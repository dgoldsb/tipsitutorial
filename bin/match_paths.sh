#!/bin/bash
# Author: Dylan Goldsborough
# Email: dylan.goldsborough@student.uva.nl
# Run in the DATA directory of TIPSI output to assemble all possible path
# Trjconv setting can be edited by changing what is written to trjconvopts.txt, standard is all atoms, centered for the protein

dump(){
    dumpsource=$(dirname $trajectory_trr)
    trydsrc=$(basename $dumpsource)
    rundsrc=$(basename $(dirname $dumpsource))
    
    # We want to find the start and end of each trajectory, and if it is backward
    # We read this from a dat-file
    regexdump='[A-I]\s+(\S+)\s+[F-T][a-z]+\s+\S+\s+'
    if [ -f "$dumpsource/$rundsrc-$trydsrc-FW.dat" ] || [ -f "$dumpsource/0-0.dat" ]
    then
        if [ -f "$dumpsource/0-0.dat" ]
	then    
            file="$dumpsource/0-0.dat"
        else
	    file="$dumpsource/$rundsrc-$trydsrc-FW.dat"
        fi
	ARRAY=()
        while IFS= read line
            do
            # we apply the regex to the line
            [[ $line =~ $regex ]]
            ARRAY+=(${BASH_REMATCH[1]})
        done <"$file"
	max=${ARRAY[0]}
	min=${ARRAY[0]}

	# Loop through all elements in the array
	for i in "${ARRAY[@]}"
	do
	    # Update max if applicable
	    if [[ $(echo $i '>' $max | bc -l) == 1 ]]; then
		max="$i"
	    fi
	    
	    # Update min if applicable
	    if [[ $(echo $i '<' $min | bc -l) == 1 ]]; then
	        min="$i"
            fi
	done
	
	echo Max is $max >> mergelog.txt 2>&1
        dt=$(echo ${ARRAY[1]} '-' ${ARRAY[0]} | bc -l)
        
        # Now we can overwrite the times...
	echo dt is $dt >> mergelog.txt 2>&1
        trjconv -f $trajectory_trr -t0 0 -timestep $dt -o ./temp2.trr >> mergelog.txt 2>&1
        # And dump the frame we want
        # Time runs from min to max, so we want frame timestep-min/dt
        frameno=$(echo $timestep - $min | bc -l)
        trjconv -dump $frameno -f ./temp2.trr -o temp.trr >> mergelog.txt 2>&1
	#trjconv -f temp3.trr -t0 $timestep i-o temp.trr >> mergelog.txt 2>&1
        rm ./temp2.trr temp3.trr  >> mergelog.txt 2>&1
    else
        file="$dumpsource/$rundsrc-$trydsrc-BW.dat"
        ARRAY=()
        while IFS= read line
            do
            # we apply the regex to the line
            [[ $line =~ $regex ]]
            ARRAY+=(${BASH_REMATCH[1]})
        done <"$file"
        max=${ARRAY[0]}
        min=${ARRAY[0]}

        # Loop through all elements in the array
        for i in "${ARRAY[@]}"
	do
	    # Update max if applicable
	    if [[ $(echo $i '>' $max | bc -l) == 1 ]]; then
		max="$i"
	    fi
	    
	    # Update min if applicable
	    if [[ $(echo $i '<' $min | bc -l) == 1 ]]; then
	        min="$i"
            fi
	done

	echo Minimum is $min >> mergelog.txt 2>&1
        dt=$(echo ${ARRAY[0]} '-' ${ARRAY[1]} | bc -l)
        
        # Now we can overwrite the times...
	echo dt is $dt >> mergelog.txt 2>&1
        trjconv -f $trajectory_trr -t0 0 -timestep $dt -o ./temp2.trr >> mergelog.txt 2>&1
        # And dump the frame we want
        # Time runs from max to min, so we want frame timestep-min/dt
        frameno=$(echo $max - $timestep | bc -l)
        trjconv -dump $frameno -f ./temp2.trr -t0 $timestep -o temp.trr >> mergelog.txt 2>&1
	# trjconv -f temp3.trr -t0 $timestep -o temp.trr >> mergelog.txt 2>&1
        rm ./temp2.trr temp3.trr  >> mergelog.txt 2>&1
    fi
}

add_to_traj(){
    if [ -f "./$outname" ]
    then
        echo -n "."
        dump
        trjcat -f $outname temp.trr -o $outname >> mergelog.txt 2>&1
        rm temp.trr >> mergelog.txt 2>&1
    else
        echo "Create the first frame for $outname, now appending"
        dump
        mv ./temp.trr ./$outname
    fi
}

process_accept(){
    echo "Shooting_Point New_Shooting_Point Shooting_Frame" >> shootingpoint-run$run.txt 2>&1

    # now we assemble the trajectory, as written in the .dat file
    # regex to find the time of the frame and the corresponding tpr/xtc file
    regex='[A-I]\s+(\S+)\s+[F-T][a-z]+\s+(\S+)\s+'

    file="$DIR/$run-$try.dat"
    while IFS= read line
    do
        # we apply the regex to the line
        [[ $line =~ $regex ]]

        timestep=${BASH_REMATCH[1]}
        trajectory_trr=$DIR/${BASH_REMATCH[2]}
        ext='.trr'
        trajectory_xtc=${trajectory_trr%$ext}.xtc
        re='-*[0-9]+.[0-9]+'
        if [[ $timestep =~ $re ]] ; then
            add_to_traj
        fi
    done <"$file"
    echo " done, written as ./$outname!"
    ext='.trr'
    echo "Setting the time at 0, shooting point is computed and stored now."

    # Find the shooting point
    if [ -f $DIR/$run-$try-FW.dat ]
    then
        file="$DIR/$run-$try-FW.dat"
        ARRAY=()
        while IFS= read line
            do
            # we apply the regex to the line
            [[ $line =~ $regex ]]
            ARRAY+=(${BASH_REMATCH[1]})
        done <"$file"
        minsp=${ARRAY[0]}

        # Loop through all elements in the array
        for i in "${ARRAY[@]}"
        do
            # Update min if applicable
            if [[ $(echo $i '<' $minsp | bc -l) == 1 ]]; then
                minsp="$i"
            fi
        done
	echo $minsp - $dt
        shootingpoint=$(echo $minsp - $dt | bc -l)
    else    
        file="$DIR/$run-$try-BW.dat"
        ARRAY=()
        while IFS= read line
            do
            # we apply the regex to the line
            [[ $line =~ $regex ]]
            ARRAY+=(${BASH_REMATCH[1]})
        done <"$file"
        maxsp=${ARRAY[0]}

        # Loop through all elements in the array
        for i in "${ARRAY[@]}"
        do
            # Update max if applicable
            if [[ $(echo $i '>' $maxsp | bc -l) == 1 ]]; then
                maxsp="$i"
            fi
        done
        originalshootingpoint=$(echo $maxsp + $dt | bc -l)
    fi
    
    # Find out how much we shift everything
    file="$DIR/$run-$try.dat"
    ARRAY=()
    while IFS= read line
        do
        # we apply the regex to the line
        [[ $line =~ $regex ]]
        ARRAY+=(${BASH_REMATCH[1]})
    done <"$file"
    minrun=${ARRAY[0]}

    # Loop through all elements in the array
    for i in "${ARRAY[@]}"
    do
        # Update min if applicable
        if [[ $(echo $i '<' $min | bc -l) == 1 ]]; then
            minrun="$i"
        fi
    done
    newshootingpoint=$(echo $originalshootingpoint - $minrun | bc -l)
    dt=$(echo ${ARRAY[1]} '-' ${ARRAY[0]} | bc -l)
    shootingframe=$(echo $newshootingpoint / $dt | bc -l)
    # Store in a file
    echo "$shootingpoint $newshootingpoint $shootingframe" >> shootingpoint-run$run.txt 2>&1

    # Shifting the starting time to t0 for good measure
    trjconv -f ./$outname -t0 0 -o ./$outname
    rm \#$outname.1\#
    echo "Making an .xtc of the .trr..."
    trjconv -f ./$outname -s ../md.tpr -pbc mol -center -ur compact -o ${outname%$ext}.xtc < trjconvopts.txt >> mergelog.txt 2>&1
}

rm mergelog.txt totalpath_run*
echo -e "1\n0" > trjconvopts.txt
echo "Make sure there are no files called totalpath_runx.trr!"
echo "Also note that all paths start at t=0, to avoid negative frame numbers!"
# we first find any folder that is produced by TIPSI
for file in */*/PARENT ; do
    : # $file is the PARENT file found
    echo "Found file with a parent: $file"

    # we get the directory of this file
    DIR=$(dirname "${file}")
    echo "Found file in directory $DIR"

    # if the path was not accepted, we can stop
    if [ -f "$DIR/ACCEPTED" ]
    then
        echo "$file is accepted, proceeding..."
        try=$(basename $DIR)
        run=$(basename $(dirname $DIR))
        outname=./totalpath_run$run.trr                
        process_accept
    else
        echo "$file is rejected, skipping to next..."
    fi
done
rm trjconvopts.txt

