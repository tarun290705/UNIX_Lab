# 6. Write an interactive shell script using variables to check the existence of a particular user login account. Display suitable messages if wrong entries are made.

#!/bin/bash

echo -e "Enter the username : \c"
read user
if [[ -z $user ]]
then
	echo "Username cannot be empty"
	exit
fi
if who | cut -d ' ' -f 1 | grep $user -wq
then
	echo "User exists"
else
	echo "User does not exists"
fi
