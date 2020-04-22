#!/bin/bash

# Checking who the user is
a=$(whoami)
read input

# 8th column or character contains the required number
number=$(echo $input | cut -c8)

case $number in
	1)
		day=monday
		;;
	2)
		day=tuesday
		;;
	3)
		day=wednesday
		;;
	4)
		day=thursday
		;;
	5)
		day=friday
		;;
	6)
		day=saturday
		;;
	7)
		day=sunday
		;;
esac

Date=$(date -d "last $day" "+%Y-%m-%d" )
cat /home/$a/attendance_record | grep $Date 
