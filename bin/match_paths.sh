#!/bin/bash

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
		try=$(basename $dir)
		run=$(basename $(dirname $DIR))
		outname=./totalpath_run$run.xtc                
		process_accept()
        else
                echo "$file is rejected, skipping to next..."
        fi
done

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
		trajectory_trr=${BASH_REMATCH[2]}
		trajectory_xtc=$(${trajectory_trr%.trr}.xtc)

		add_to_traj()
	done <"$file"
	echo "Written as ./$outname"
}

add_to_traj(){
	if [ -f "./$outname" ]
	then
		trjcat -f $outname $trajectory_xtc -b $timestep -e $timestep -o $outname
	else
		trjconv -f $trajectory_xtc -b $timestep -e $timestep -o $outname
	fi
}
