# 5. Write a shell script to read a file name and pattern as variables and search the pattern in given file. Display suitable messages if wrong entries are made.

#!/bin/bash

echo -e "Enter the filename : \c"
read file
if [ ! -e $file ]
then
	echo "File does not exists"
	exit
fi
echo -e "Enter the pattern : \c"
read pat
grep "$pat" $file
if [ $? -eq 0 ]
then
	echo "Command executed successfully"
else
	echo "Command does not executed"
fi
