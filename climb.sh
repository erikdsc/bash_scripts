#!/bin/bash
function climb {
	if [ -z "$1" ]
	then 
		cd ..
	else
		END="$1"
		for i in $(seq 1 $END); do cd ..; done
	fi
}
#alias climb="source FILEPATH; climb"
