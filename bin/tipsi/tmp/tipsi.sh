#!/bin/bash

PROGRAM=tipsi.sh
VERSION=0.1
VERSTAG=20150320-17-TAW
AUTHOR="Tsjerk A. Wassenaar, PhD"
YEAR="2015"
AFFILIATION="University of Amsterdam"


DESCRIPTION=$(cat << __DESCRIPTION__

TIPSI - Transition/Interface Path Sampler and Identifier
========================================================

TIPSI is a convenience program to run transition path
sampling, starting from a single initial path, provided
as a Gromacs trajectory in TRR format, containing both
positions and velocities. 

__DESCRIPTION__
)


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


# - main options:
TPR=       # Input TPR file
TRR=       # Input path TRR file
PAR=       # Input TPS parameter file
NDX=       # Input index file
NP=1       # Number of processors
MDRUN=mdrun

# - TPS options
TPS_INI=() # Expressions evaluated before loading trajectory 
TPS_EXP=() # Expressions not saved to output (order parameter) file 
TPS_PAR=() # Parameter expressions 
TPS_STA=() # State expressions 
TPS_IFA=() # Interface expressions
TPS_BIA=() # Shooting point selection bias expressions 
TPS_STP=() # Stop condition (expression)
TPS_REC=() # Recrossing rules: A-I-A=A 
TPS_2WY=() # Probability of two-way shooting 
TPS_RND=() # Velocity randomization 
TPS_MIN=() # Minimum path length 
TPS_MXF=() # Maximum number of frames per run 
TPS_MDP=() # MD parameters: par=val 
TPS_MXC=   # Maximum number of paths to sample


GMXRC=
GROM=() # Gromit command line options


OPTIONS=$(cat << __OPTIONS__

## OPTIONS ##

  File options
    -tpr        Gromacs MD input file
    -trr        Full precision input trajectory with velocities
    -ndx        Index file
    -par        TPS parameter file
    -gmxrc      Gromacs RC file
    -mdrun      MDRUN command

  TPS options
    -init       Initialization
    -E          Expression
    -P          Parameter expression
    -S          State definition
    -I          Interface definition
    -B          Shooting point selection bias expression
    -Q          Stop conditions

  Path options
    -R          Recrossing rules
    -2way       Two way shooting probability
    -rand       Randomization of velocities
    -minlen     Minimum path length
        
  Further TPS/MD control:
    -maxc       Maximum number of cycles/paths to sample
    -maxf       Maximum number of frames per run
    -mdp        MDP setting

  Control options
    -np         Number of processors to use for MD simulation (0 to let Gromacs decide)

  Other options are passed to GROMIT

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
[[ -z $1 ]] && USAGE && exit 0


while [ -n "$1" ]; do
  case $1 in
              -h)                    USAGE         ; exit 0 ;;

    # File options
            -tpr)                   TPR=$2         ; shift 2; continue;;
            -trr)                   TRR=$2         ; shift 2; continue;;
            -ndx)                   NDX=$2         ; shift 2; continue;;
            -par)                   PAR=$2         ; shift 2; continue;;
          -gmxrc)                 GMXRC=$2         ; shift 2; continue;;
          -mdrun)                 MDRUN=$2         ; shift 2; continue;;

    # TPS options
           -init)              TPS_INI+=(${2// /}) ; shift 2; continue;; 
              -E)              TPS_EXP+=(${2// /}) ; shift 2; continue;; 
              -P)              TPS_PAR+=(${2// /}) ; shift 2; continue;; 
              -S)              TPS_STA+=(${2// /}) ; shift 2; continue;; 
              -I)              TPS_IFA+=(${2// /}) ; shift 2; continue;; 
              -B)              TPS_BIA+=(${2// /}) ; shift 2; continue;; 
              -Q)              TPS_STP+=(${2// /}) ; shift 2; continue;; 
    # Path options
              -R)              TPS_REC+=(${2// /}) ; shift 2; continue;; 
           -2way)               TPS_2WY=$2         ; shift 2; continue;; 
           -rand)               TPS_RND=$2         ; shift 2; continue;; 
         -minlen)               TPS_MIN=$2         ; shift 2; continue;; 
        
    # Further TPS/MD control:
           -maxc)               TPS_MXC=$2         ; shift 2; continue;;
           -maxf)               TPS_MXF=$2         ; shift 2; continue;; 
            -mdp)              TPS_MDP+=(${2// /}) ; shift 2; continue;; 

    # Control options
             -np)                    NP=$2         ; shift 2; continue;;

    # Options for downstream programs -- only GROMIT here
             --*)                 GROM+=($1)       ; shift 1; continue;;
              -*)                 GROM+=($1 $2)    ; shift 2; continue;;    

    # All options should be covered above. Anything else raises an error here.
               *)                BAD_OPTION $1;;

  esac
done


# Warming up variable gymnastics


# Base directory
BDIR=$(pwd)


[[ -n $NDX ]] && NDX="-ndx $BDIR/$NDX"
[[ -n $GMXRC ]] && GMXRC="-gmxrc $GMXRC" 

# These add to the settings in the parameter file
# (This allows using a base parameter file, and add to it)
TPS_INI=$(for i in ${TPS_INI[@]}; do echo -init $i; done)
TPS_EXP=$(for i in ${TPS_EXP[@]}; do echo -E $i; done)
TPS_PAR=$(for i in ${TPS_PAR[@]}; do echo -P $i; done)
TPS_STA=$(for i in ${TPS_STA[@]}; do echo -S $i; done)
TPS_IFA=$(for i in ${TPS_IFA[@]}; do echo -I $i; done)
TPS_BIA=$(for i in ${TPS_BIA[@]}; do echo -B $i; done)
TPS_STP=$(for i in ${TPS_STP[@]}; do echo -Q $i; done)
TPS_REC=$(for i in ${TPS_REC[@]}; do echo -R $i; done)
TPS_MDP=$(for i in ${TPS_MDP[@]}; do echo -mdp $i; done)


# These override settings in parameter file (if given)
if [[ -n $PAR ]]
then
    [[ -z $TPS_MXC ]] && TPS_MXC=$(sed -n '/^ *maxcycle/s/.*=//p' $PAR)
    [[ -z $TPS_MXF ]] && TPS_MXF=$(sed -n '/^ *maxframes/s/.*=//p' $PAR)
    [[ -z $TPS_MIN ]] && TPS_MIN=$(sed -n '/^ *minlen/s/.*=//p' $PAR)
    [[ -z $TPS_2WY ]] && TPS_2WY=$(sed -n '/^ *twoway/s/.*=//p' $PAR)
    [[ -z $TPS_RND ]] && TPS_RND=$(sed -n '/^ *randvel/s/.*=//p' $PAR)
    PAR="-par $BDIR/$PAR"
fi
[[ -z $TPS_MXC ]] && TPS_MXC=1000
[[ -z $TPS_MXF ]] && TPS_MXF=-1
[[ -z $TPS_MIN ]] && TPS_MIN=10
[[ -z $TPS_2WY ]] && TPS_2WY=0
[[ -z $TPS_RND ]] && TPS_RND=0



# Setup of TIPSI 
TIPSI=$SDIR/tipsi.py
STUFF="$TPS_INI $TPS_EXP $TPS_PAR $TPS_STA $TPS_IFA $TPS_BIA $TPS_STP $TPS_REC $TPS_MDP"
STUFF="$STUFF -maxf $TPS_MXF -2way $TPS_2WY -rand $TPS_RND -minlen $TPS_MIN"
SCORE="$TIPSI score $NDX $PAR $STUFF"
SHOOT="$TIPSI shoot $NDX $PAR $STUFF"
CHECK="$TIPSI check $NDX $PAR $STUFF"
MONIT="$TIPSI monitor $NDX $PAR -tpr @TPR -trr @TRR -pid @PID -pi parent.dat -po path.dat -sleep 60 $STUFF"


function SHOUT() { echo && L=$(sed -e 's/./-/g;s/^/#/;' <<< " $@ ") && echo $L && sed 's/^/#/' <<< "$@ " && echo $L ; }
function LINE()  { echo && sed -e 's/^/ /;s/$/ /p;s/./-/g;' <<< "$@" | sed 's/^/#/'; }


function run_md()
{
    tpr=$1
    dir=${tpr/*}
    tpr=${tpr##$dir/}

    pushd ./$dir >/dev/null

    # Run the simulation from the TPR file provided as argument
    GROMIT="$SDIR/gromit.sh -f $tpr -mdrun \"$MDRUN\" --mdrun-append -np $NP -g ${tpr%.tpr}.out -e ${tpr%.tpr}.err $GMXRC"
    CONTROL="$MONIT -out ${tpr%.tpr}.dat"
    echo $GROMIT -control $CONTROL
    $GROMIT -control "$CONTROL"
    OK=$?

    if [[ -f TERMINATED ]]
    then
	SHOUT " The run was killed by a signal. Exiting this program too."
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
elif [[ -f $DIR/REJECTED ]]
then
    SHOUT " Restarting TPS run, because previous initial path was rejected."
    pushd  $DIR >/dev/null

    rm REJECTED

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

    # If there is again no path from the first trajectory, we bail out now
    [[ -f $DIR/REJECTED ]] && echo Again no path in initial trajectory. Exiting. && exit 1
else
    SHOUT " Continuing TPS run. Determining last run and last accepted run."
fi


# Find the last piece of the run and the last accepted one
# Note that the run need not be complete. So we need to find
# the cycle and run with the highest number
CYCLE=$(ls DATA/[0-9]*/ | awk 'BEGIN{FS="/";M=0}{if ($2 > M) M=$2}END{print M}')
RUN=$(ls DATA/$CYCLE/?/ | awk 'BEGIN{FS="/";M=0}{if ($3 > M) M=$3}END{print M}')
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
ls $CURPATH


while [[ $CYCLE -lt $TPS_MXC ]]
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
	echo No forward or backward run data. Clearly something is wrong.
	exit
    fi

    ACCYC=$CYCLE
    ACRUN=$RUN
    touch ACCEPTED
    
    popd >/dev/null
done

