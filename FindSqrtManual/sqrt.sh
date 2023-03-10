#!/bin/bash
srt () {
	low=0
	high=$1
	while (( `echo "scale=10; $low + 0.00000001 < $high" | bc` ))
	do
		mid=`echo "scale=10; ($low + $high)/2" | bc`
		if (( `echo "scale=10; $mid * $mid < $1" | bc` ))
		then
			low=$mid
		else
			high=$mid
		fi
	done
	echo $low
}
read -p "Enter a number: " a
res=$( srt $a )
echo "Square root of the number : $res"
