# 10. Write a shell script to calculate and display the DA, HRA and gross salary of all the employees in empn.lst. Assume Da 25% for those having salary > INR 6000 and 30% for others. HRA is 10% of basic.

#!/bin/bash

file="empn.lst"
if [ ! -e $file ]
then
	echo "File does not exists"
	exit
fi
echo -e "Employee Salary Details :\n"
cat $file | while read name sal
do
	# Calculation of DA
	if [ $sal -gt 6000 ]
	then
		da=$((sal*25/100))
	else
		da=$((sal*30/100))
	fi

	# Calculation of HRA
	hra=$((sal*10/100))

	# Calculation of Gross salary
	gross=$((sal+da+hra))

	echo "Employee name : $name"
	echo "Employee Basic Salary : $sal"
	echo "Employee DA : $da"
	echo "Employee HRA : $hra"
	echo -e "Employee Gross salary : $gross\n"
done
