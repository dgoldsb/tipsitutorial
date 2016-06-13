#!/bin/bash

## DEFINITION OF OPTIONS

# All options should be listed here
options=(TPR TRR LOG GMX PAR REV ONE TWO)

# Option definitions:
# The NAME_FLAG need only be specified for flags that don't take arguments.
#
# NAME=default        NAME_OPT=option   NAME_FLAG=true    NAME_DSC=Description
TPR=;                 TPR_OPT=-s;                         TPR_DSC="Gromacs run input file (TPR)"
TRR=;                 TRR_OPT=-f;                         TRR_DSC="Gromacs full precision trajectory (TRR)"
OUT=intene.dat;       OUT_OPT=-o;                         OUT_DSC="Output file (DAT)"
LOG=intene.log;       LOG_OPT=-g;                         LOG_DSC="Log file (TXT)"
PAR=tps.param;        PAR_OPT=-p;                         PAR_DSC="Parameter definitions"
REV=0;                REV_OPT=-rev;                       REV_DSC="Path reversal probability"
ONE=0;                ONE_OPT=-1w;                        ONE_DSC="One-way shooting probability"
TWO=0;                TWO_OPT=-2w;                        TWO_DSC="Two-way shooting probability"
GMX=$(which GMXRC);   GMX_OPT=-gmxrc;                     GMX_DSC="Gromacs RC file"

## PARSING OF ARGUMENTS

while [[ -n "$1" ]]
do
    have=false
    for i in ${options[@]}
    do
        opt=${i}_OPT; flag=${i}_FLAG
        [[ $1 == ${!opt} ]] && { ${!flag:-false} && { v=true; n=1; } || { v=$2; n=2; }; eval $i="\$v"; shift $n; have=true; break; }
    done
    $have || { echo Unexpected argument $1 \(not an option\); exit; }
done


## WORK

TIPSI="$SDIR/tipsy.py -f tps.param"
MONITOR="$TIPSI -tpr @TPR -trr @TRR -pid @PID"
GROMIT="$SDIR/gromit.sh -control \"$MONITOR\""

CYCLE=0

function MC ()
{
    # Return true / false with probability 0.P / 1-0.P
    # $RANDOM: 0-65535
    P=${1#*.}
    R=$RANDOM; while [[ $R -gt 10000 ]]; do R=$RANDOM; done
    echo $(( P * 10**(4-${#P}) - $R > 0 )) 
}


# if [[ 0 ]]
# then
#     echo Trying path reversal
    
#     : $((GENERATION++))
# fi


# if [[ $(( PSHOOT * 10**(5-${#PSHOOT}) - $RANDOM )) -gt 0 ]]
# then
#     echo Shooting move
#     REJECT=true
#     while $REJECT
#     do
# 	echo $TIPSI
# 	echo $GROMIT
# 	REJECT=false
#     done
# fi


# Set the correct sed version for multi-platform use. 
# Also try to avoid GNU specific sed statements for the poor bastards
# that are stuck with one of those Mac things (including me, these days).
SED=$(which gsed || which sed)

# Macros to echo stuff only if the step is to be executed
function SHOUT() { [[ $STEP == $NOW ]] && echo && L=$($SED -e 's/./-/g;s/^/#/;' <<< " $@ ") && echo $L && sed 's/^/#/' <<< "$@ " && echo $L ; }
function LINE()  { [[ $STEP == $NOW ]] && echo && $SED -e 's/^/ /;s/$/ /p;s/./-/g;' <<< "$@" | sed 's/^/#/'; }
function ECHO()  { [[ $STEP == $NOW ]] && echo "$@"; }


#-----------------------------------------------
SHOUT "---STEP 1: INITIALIZATION OF TPS PROJECT"
#-----------------------------------------------


## 0. Initialization
##    Make directories/filetree:
##      - init/      := initialization runs
##      - tps/$i/$j  := tps runs, $i-th cycle, $j-th try
##      - status.log := project status
##      - paths.dat  := path info
##      - order.dat  := order parameter statistics


## If we're running an extension, then there will be a tps directory
## with stuff in it. So first check that.

if [[ -d tps ]]
then
    cycle=-1
    while [[ -d tps/$((++cycle)) ]]; do :; done
    
fi


## 1. SETUP
##
##      TPR := Run input file  --> TPR
##      TRR := Initial path    --> TRR(0)
##
##    If no initial path is given, run the TPR. That would give some
##    trouble, as it is not sure that a path will be sampled. A
##    possibility is to provide a SETUP scheme and a RUN scheme. The
##    SETUP scheme could consist of a systematic approach to perform
##    simulations to maximize the probability of finding a path. This
##    could be shaped as a pull simulation or SMD, but it is also
##    possible to run with increasing temperature to increase the
##    probability of crossing some barrier.
##
##      Analyze TRR(0) --> PATH(0) 
##


maxInitRun=0
if [[ ! -f $TRR ]]
then
    mkdir -p init/0
    cp $TPR init/0
  
    # Run this in a subshell
    (
	cd init
        run=0
        while [[ $run -lt $maxInitRun ]]
        do
            cd $run
            # RUN

	    # While not accepted
	    # Run TPR(0,j) --> TRR(0,j)
	    # if ACCEPT
	    #     TRR(0) <-- TRR(0,j)
	    # elif TRY < MAXTRY:
	    #     Modify(TPR(0,j)) --> TPR(0,j+1)
	    # else:
	    #     exit FAIL
	    #
	    # TPR <-- TPR(0,j)
	    # TRR <-- TRR(0,j)

	    # TEST
	    # BREAK if ACCEPT
        done
    )
fi



#-----------------------------------------------
SHOUT "---STEP 2: TPS CYCLES"
#-----------------------------------------------



## 2. RUN
##
##    while CYCLE < MAXCYLES or PATHS < MAXPATHS:
##
##        #CYCLE i:
##
##        while not ACCEPT:
##
##            # There is a given probability for each type of move.
##            # Probabilities should be relative and then be recalculated
##            # to give proper probabilities in an if/elif/elif/else block.
##
##            if shootOneWay:
##
##                # There is a given probability for Forward/Backward shooting. 
##                if FORWARD:
##                    TPR(i) <-- shootForward(PATH(i-1))
##                else:
##                    TPR(i) <-- ShootBackward(PATH(i-1))
##                MD(TPR(i)) --> TRR(i)
##                if isPath(TRR(i-1),TRR(i)):
##                    ACCEPT
##                
##            elif shootTwoWay:
##                TPRF(i)  <-- shootForward(PATH(i-1))
##                TPRB(i)  <-- shootBackward(PATH(i-1))
##                MD(TPRF(i)) --> TRRF(i)
##                MD(TPRB(i)) --> TRRB(i)
##                if isPath(TRRB(i),TRRF(i)):
##                    ACCEPT
##
##            elif reverseTime:
##                if isPath(reverse(PATH(i-1))):
##                    ACCEPT
##
##            if ACCEPT:
##                REGISTER
##                Update TREE
##                Statistics/Analysis
##                    It should be possible to make statistical
##                    inferences about the validity/quality of a
##                    certain path, based on the number of successful
##                    (decoupled) paths. 
