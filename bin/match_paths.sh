#!/bin/bash

for file in */*/PARENT ; do
    : # do something with "$file" here
	echo "Found file with a parent: $file"

	DIR=$(dirname "${file}")
        echo "Found file in directory $DIR"

        if [ -f "$DIR/ACCEPTED" ]
        then
                echo "$file is accepted, proceeding..."
		value=$(<$file)
		echo "Parent is: $value"

		array1=($DIR/*.xtc)
		in1=${array1[0]}
		array2=($DIR/$value/*.xtc)
		in2=${array2[0]}
		
		# Check which one is forward, thus last!
		if [ -f "$DIR/FORWARD" ]
		then
			outname=./totalpath_$(basename $(dirname $value))_$(basename $(dirname $DIR)).xtc
	                echo $outname   

			trjcat -f $in2 $in1 -o $outname
		else
			outname=./totalpath_$(basename $(dirname $DIR))_$(basename $(dirname $value)).xtc
                	echo $outname   

			trjcat -f $in1 $in2 -o $outname
		fi

		echo "Written as ./$outname"
        else
                echo "$file is rejected, skipping to next..."
        fi
done
