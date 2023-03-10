#!/bin/bash
comb() {
	if (( $2 == $1 || $2 == 0 ))
	then
		echo 1
	else
		echo $(( $( comb $(( $1 - 1 )) $(( $2 - 1 )) ) + $( comb $(( $1 - 1 )) $(( $2 )) ) ))
	fi
}

space() {
	if (( $1 == 0 ))
	then
		echo -n ""
	else
		echo -n " "
		echo -n "$( space $(( $1 - 1 )) )"
	fi
}

inline() {
	if (( $2 == -1 ))
	then
		echo -n ""
	else
		printf "%-9s " $( comb $1 $2 )
		echo -n "$( inline $1 $(( $2 - 1 )) )"
	fi
}

outline() {
	for (( i=0 ; i<=$1 ; i++ ))
	do
		v=$(( $(( $1 - $i )) / 2 ))
		v=$(( $v * 9 ))
		if (( $(( $(( $1 - $i )) % 2 )) ))
		then
			v=$(( $v + 5 ))
		else
			v=$(( $v ))
		fi
		inline $i $i
		echo
	done
}

read -p "Enter the size of the Pascal Triangle: " a
outline $a
echo
