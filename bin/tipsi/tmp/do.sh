#!/bin/bash

PROGRAM=tps.sh
VERSION=0.1
VERSTAG=20150309-09-TAW
AUTHOR="Tsjerk A. Wassenaar, PhD"
YEAR="2015"
AFFILIATION="University of Amsterdam"


# Get script directory
#
# A: Test if program name contains a slash        (1) 
#    If so, change directory to program directory (2)
# B: Echo working directory, which will always be 
#    the program directory
#baseName
#       |---------------A---------------|  |B|
#       |--------1--------|    |---2----|
SDIR=$( [[ $0 != ${0%/*} ]] && cd ${0%/*}; pwd )

CMD=$@

TPR=$1
TRR=$2
PAR=$3
NDX=$4
NT=${5:-1}
BDIR=$(pwd)

GMXRC=/Users/tsjerk/GMXRC466
source $GMXRC


# - main options:
#TPR=      # Input TPR file
#TRR=      # Input path TRR file
#PAR=      # Input TPS parameter file
#NDX=      # Input index file
#PRC=1     # Number of processors
#GMXRC=
#GROM=() # Gromit command line options

OPTIONS=$(cat << __OPTIONS__

## OPTIONS ##



__OPTIONS__
)


USAGE ()
{
    cat << __USAGE__

$PROGRAM version $VERSION:

$DESCRIPTION

$OPTIONS

(c)$YEAR $AUTHOR
$AFFILIATION

__USAGE__
}


BAD_OPTION ()
{
  echo
  echo "Unknown option "$1" found on command-line"
  echo "It may be a good idea to read the usage:"
  echo -e $USAGE

  exit 1
}



TIPSI=$SDIR/tipsi.py
SCORE="$TIPSI score -ndx $BDIR/$NDX -par $BDIR/$PAR"
SHOOT="$TIPSI shoot -ndx $BDIR/$NDX -par $BDIR/$PAR"
CHECK="$TIPSI check -ndx $BDIR/$NDX -par $BDIR/$PAR"
MONIT="$TIPSI monitor -ndx $BDIR/$NDX -par $BDIR/$PAR -tpr @TPR -trr @TRR -pid @PID -pi parent.dat -po path.dat -sleep 60"

GROMIT="$SDIR/gromit.sh -mdrun echo"


function SHOUT() { echo && L=$(sed -e 's/./-/g;s/^/#/;' <<< " $@ ") && echo $L && sed 's/^/#/' <<< "$@ " && echo $L ; }
function LINE()  { echo && sed -e 's/^/ /;s/$/ /p;s/./-/g;' <<< "$@" | sed 's/^/#/'; }


function run_md()
{
    tpr=$1
    dir=${tpr/*}
    tpr=${tpr##$dir/}

    pushd ./$dir >/dev/null

    # Run the simulation from the TPR file provided as argument
    GROM="$GROMIT -f $tpr --mdrun-append -np $NT -g ${tpr%.tpr}.out -e ${tpr%.tpr}.err"
    CONTROL="$MONIT -out ${tpr%.tpr}.dat"
    echo $GROM -control $CONTROL
    $GROM -control "$CONTROL"
    OK=$?

    if [[ -f TERMINATED ]]
    then
	SHOUT " The TPS/MD run was killed by a signal. Exiting."
	echo 
	echo "# You can continue the run at a later time using"
	echo $CMD
	wait
	exit
    fi

    if [[ -f ERROR ]]
    then
	echo "MD run failed ($tpr). Check the logs."
    fi

    popd >/dev/null

    if [[ $OK == 0 ]]
    then
        return 0
    else
        return 1
    fi        
}



CYCLE=0
RUN=0
ID=$CYCLE-$RUN
MOVE=INIT
DIR=DATA/$CYCLE/$RUN


# Initialization
if [[ ! -d $DIR ]]
then

    SHOUT " Initialing new TPS run from $TPR and $TRR" 

    # Make a backup of log files
    [[ -f $LOG ]] && mv $LOG $LOG.bck
    [[ -f $STATUS ]] && mv $STATUS $STATUS.bck

    mkdir -p $DIR

    cp $TRR $DIR/$ID.trr # This is the only trr we copy
    cp $TPR $DIR/$ID.tpr

    [[ ! -f ./${TPR##*/} ]] && cp $TPR ./ && TPR=${TPR##*/}

    pushd  $DIR >/dev/null

    CMD="$SCORE -tpr $ID.tpr -trr $ID.trr -out $ID.dat"
    echo $CMD
    if $CMD
    then 
	# Change the trajectory name to make sure it is 
	# always traceable.
	sed -i"" -e "s#$ID.trr#../../$CYCLE/$RUN/$ID.trr#" $ID.dat
	touch ACCEPTED
    else 
	touch REJECTED
    fi

    popd >/dev/null

    # If there is no path from the first trajectory, we bail out now
    [[ -f $DIR/REJECTED ]] && echo No path in initial trajectory. Exiting. && exit 1
else
    SHOUT " Continuing TPS run. Determining last run and last accepted run."
fi


# Find the last piece of the run and the last accepted one
# Note that the run need not be complete. So we need to find
# the cycle and run with the highest number
CYCLE=$(ls DATA/[0-9]*/ | awk 'BEGIN{FS="/";M=0}{if ($2 > M) M=$2}END{print M}')
RUN=$(ls DATA/$CYCLE/?/ | awk 'BEGIN{FS="/";M=0}{if ($3 > M) M=$3}END{print M}')

#LASTRUN=($(ls -d DATA/?/?/ | awk 'BEGIN{FS="/";M=-1}{if ($2 > M) {M=$2; N=$3}}END{print M, N}'))
#CYCLE=${LASTRUN[0]}
#RUN=${LASTRUN[1]}

ACCEPTED=($(ls DATA/*/*/ACCEPTED | awk 'BEGIN{FS="/";M=-1}{if ($2 > M) {M=$2; N=$3}}END{print M, N}'))
ACCYC=${ACCEPTED[0]}
ACRUN=${ACCEPTED[1]}

DIR=DATA/$CYCLE/$RUN/
CURPATH=DATA/${ACCEPTED[0]}/${ACCEPTED[1]}

#echo Last run:             DATA/${LASTRUN[0]}/${LASTRUN[1]}
echo Last run:             DATA/$CYCLE/$RUN
echo Last accepted path:   $CURPATH

# Get last path
# Select point from path (use tipsi for bias and shooting point generation):
#   tipsi -path $PATHFILE -par $PAR -fw/-bw $NEWDIR/out.tpr

# Run new tpr:
#   (cd $NEWDIR; gromit.sh -f out.tpr -control $CONTROL)

# Check path
#   if $ACCEPTED; then newcycle; else newrun; fi

echo $CURPATH
#cat $CURPATH/*-*[^W].dat


MAXCYCLE=10000
while [[ $CYCLE -lt $MAXCYCLE ]]
do
    PARDIR=../../$ACCYC/$ACRUN 

    # Make a new directory
    if [[ -f $DIR/ACCEPTED ]]
    then
        : $((CYCLE++)) 
        RUN=0
    else
        : $((RUN++))
    fi

    SHOUT " Starting new run. Cycle $CYCLE Run $RUN."
    echo

    BASE=$CYCLE-$RUN
    DIR=DATA/$CYCLE/$RUN

    mkdir -p $DIR

    pushd $DIR >/dev/null

    # The parent uses a relative path
    echo $PARDIR > PARENT
    PARENT=$PARDIR/$ACCYC-$ACRUN
    INTPR=$PARENT.tpr
    [[ ! -f $INTPR ]] && INTPR=$PARENT-FW.tpr
    [[ ! -f $INTPR ]] && INTPR=$PARENT-BW.tpr
    INTRR=$PARENT.trr
    INPATH=$PARENT.dat

    echo "# Getting new shooting point"
    CMD="$SHOOT -tpr $INTPR -trr $INTRR -pi $INPATH -po ./parent.dat -fw $BASE-FW.tpr -bw $BASE-BW.tpr"
    echo $CMD
    $CMD

    if [[ -f $BASE-BW.tpr ]]
    then
	LINE " Starting BACKWARD run"
	if run_md $BASE-BW.tpr
	then
	    if [[ ! -f $BASE-FW.tpr ]]
	    then
		CMD="$CHECK -pi ./parent.dat -pi $BASE-BW.dat"
		echo $CMD
		$CMD && touch ACCEPTED || touch REJECTED
	    fi
	else
	    touch REJECTED
	fi	
    fi

    if [[ -f $BASE-FW.tpr && ! -f REJECTED ]]
    then
	LINE " Starting FORWARD run"
	if run_md $BASE-FW.tpr 
	then
	    if [[ ! -f $BASE-BW.tpr ]]
	    then
		CMD="$CHECK -pi ./parent.dat -pi $BASE-FW.dat"
	    else
		CMD="$CHECK -pi $BASE-BW.dat -pi $BASE-FW.dat"
	    fi
	    echo $CMD
	    $CMD && touch ACCEPTED || touch REJECTED
	else
	    touch REJECTED
	fi
    fi

    if [[ -f REJECTED ]]
    then
	popd
	continue
    fi

    FIX="-e s#$BASE-FW.trr#../../$CYCLE/$RUN/$BASE-FW.trr# -e s#$BASE-BW.trr#../../$CYCLE/$RUN/$BASE-BW.trr#"
    if [[ -f $BASE-FW.dat ]]
    then
	if [[ -f $BASE-BW.dat ]]
	then
	    # Two-way run: stitch the paths
	    {
		sed -e 1p -e 1d -e '2!G;h;$!d' $BASE-BW.dat
		sed -e 1d $BASE-FW.dat 
	    } | sed $FIX > $BASE.dat
	else
	    # One-way forward run: just copy the path
	    {
		cat parent.dat
		sed -e 1d $FIX $BASE-FW.dat 
	    } > $BASE.dat
	fi
    elif [[ -f $BASE-BW.dat ]]
    then
	# One-way backward run: reverse the path
	{
	    sed -e 1p -e 1d $FIX -e '2!G;h;$!d' $BASE-BW.dat 
	    sed -e 1d -e '2!G;h;$!d' parent.dat
	} > $BASE.dat
    else
	# Something is wrong...
	echo Something is wrong
	exit
    fi

    ACCYC=$CYCLE
    ACRUN=$RUN
    touch ACCEPTED
    
    popd >/dev/null
done

