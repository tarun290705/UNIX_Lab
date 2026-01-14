# 8. Write an interactive code to accept a list of items and item code and append the item code and item name in a file named item.txt.

#!/bin/bash

file="item.txt"
while [ true ]
do
	echo -e "\nEnter the item name : \c"
	read name
	echo -e "Enter the item code : \c"
	read code
	echo "$name - $code" >> $file
	echo "Item added to $file"
	echo -e "Do you want to add another item ? (y/n) : \c"
	read ch
	if [ $ch != "y" ]
	then
		echo -e "\nAll items appended to $file"
		echo "Contents of $file are :"
		cat $file
		break
	fi
done
