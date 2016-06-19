#!/bin/bash

add_to_traj(){
        if [ -f "./$outname" ]
        then
                echo "Add two to each other" >> mergelog.txt 2>&1
                trjconv -dump $timestep -f $trajectory_xtc -o temp.xtc >> mergelog.txt 2>&1
		trjcat -f $outname temp.xtc -o $outname >> mergelog.txt 2>&1
		rm temp.xtc
        else
                echo "Create the first frame" >> mergelog.txt 2>&1
		trjconv -dump $timestep -f $trajectory_xtc -o $outname >> mergelog.txt 2>&1
        fi
}

process_accept(){
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
                add_to_traj
        done <"$file"
        echo "Written as ./$outname" >> mergelog.txt 2>&1
}

rm mergelog.txt
# we first find any folder that is produced by TIPSI
for file in */*/PARENT ; do
    : # $file is the PARENT file found
	echo "Found file with a parent: $file" >> mergelog.txt 2>&1
	
	# we get the directory of this file
	DIR=$(dirname "${file}")
        echo "Found file in directory $DIR" >> mergelog.txt 2>&1

	# if the path was not accepted, we can stop
        if [ -f "$DIR/ACCEPTED" ]
        then
		echo "$file is accepted, proceeding..." >> mergelog.txt 2>&1
		try=$(basename $DIR)
		run=$(basename $(dirname $DIR))
		outname=./totalpath_run$run.xtc                
		process_accept
        else
                echo "$file is rejected, skipping to next..." >> mergelog.txt 2>&1
        fi
done
