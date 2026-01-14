# 9. Write a shell program to accept a designation code and its description from terminal and perform validation and then add an entry to file desig.lst. The designation code should be numeric only and designation description should be alphabetical only.

#!/bin/bash

file="desig.lst"
while [ true ]
do
	echo -e "\nEnter designation code : \c"
	read code
	case $code in
		""|*[!0-9]*) echo "Error : Code should be numeric only"
			     continue;;
	esac
	echo -e "Enter designation description : \c"
	read desc
	case $desc in
		""|*[!a-zA-Z]*) echo "Error : Description should be alphabetical only"
			        continue;;
	esac
	echo "$desc - $code" >> $file
	echo "Entry added to $file"
	echo -e "Do you want add another entry ? (y/n) : \c"
	read ch
	if [ $ch != "y" ]
	then
		echo -e "\nAll entries appended to $file"
		echo "Contents of $file are :"
		cat $file
		break
	fi
done
