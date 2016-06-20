#!/bin/bash

add_to_traj(){
        if [ -f "./$outname" ]
        then
                echo -n "."
                trjconv -dump $timestep -f $trajectory_trr -o temp.trr >> mergelog.txt 2>&1
		trjcat -f $outname temp.trr -o $outname >> mergelog.txt 2>&1
		rm temp.trr >> mergelog.txt 2>&1
        else
                echo "Create the first frame for $outname, now appending"
		echo "trjconv -dump $timestep -f $trajectory_trr -o $outname" >> mergelog.txt 2>&1
		trjconv -dump $timestep -f $trajectory_trr -o $outname >> mergelog.txt 2>&1
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
                re='-*[0-9]+.[0-9]+'
		if [[ $timestep =~ $re ]] ; then
			add_to_traj
		fi
        done <"$file"
        echo " done, written as ./$outname!"
	ext='.trr'
        echo "Making an .xtc of the .trr..."
        trjconv -f ./$outname -s ../md.tpr -pbc mol -center -ur compact -o ${outname%$ext}.xtc < trjconvopts.txt >> mergelog.txt 2>&1
}

rm mergelog.txt *temp* totalpath_run*
echo "Make sure there are no files called totalpath_runx.trr!"
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

