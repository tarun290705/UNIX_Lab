# 4. Write a shell script to know the size of individual files, permissions, existence of link and file name. Display only these file attributes.

#!/bin/bash

echo -e "Enter the filename : \c"
read file
if [ ! -e $file ]
then
	echo "File does not exists"
	exit
fi
ls -l $file | cut -d ' ' -f 5,1,2,9
