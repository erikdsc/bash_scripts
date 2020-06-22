#!/bin/bash
function track {
	if [ "$1" == "start" ]
	then
		if [ -z "$2" ]
		then
			echo "Please give your task a label"
		else
			echo -n "START " >> ${LOGFILE}
			date >> ${LOGFILE}
			echo "LABEL" "$2" >> ${LOGFILE}
			T1=${SECONDS}
			Label="$2"
			Started="y"
		fi
	elif [ "$1" == "stop" ]
	then
		if [ "y" == ${Started} ]
		then	
			echo -n "END   " >>${LOGFILE}
			date >> ${LOGFILE}
			T2=${SECONDS}
			SUsed=$(echo "$T2 - $T1" | bc)
			H=$(echo "$SUsed / 3600" | bc)
			M=$(echo "($SUsed % 3600) / 60" | bc)
			S=$(echo "($SUsed % 3600) % 60" | bc)
			Hours=$(printf "%02d" $H)
			Minutes=$(printf "%02d" $M)
			Seconds=$(printf "%02d" $S)
			echo "${Label}":  "${Hours}":"${Minutes}":"${Seconds}" >> ${LOGFILE}
			Started="n"#
			Label=""
		else
			echo "There is nothing to stop!"
		fi
	elif [ "$1" == "status" ]
	then
		if [ ${Started} == "y" ]
		then
			echo Currently tracking: ${Label}
		else
			echo "No active tasks!"
		fi
	elif [ "$1" == "log" ]
	then
		counter=0
		while read line
		do
			rest4=$(echo "$counter % 5" | bc)
			if [ $rest4 == "3" ]
			then 
				echo $line
			fi
			counter=$((counter+1))
		done < ${LOGFILE}
	
	else
		echo "Unknown argument. Use \"track start [label]\", \"track stop\" or \"track status\"!"
	fi
}
