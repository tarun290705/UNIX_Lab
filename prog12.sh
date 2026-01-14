# 12. Write a shell script to implement an arithmetic calculator.

#!/bin/bash

echo -e "Enter two numbers : \c"
read a b
echo -e "\n1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Modulo Division"
echo -e "\nEnter your choice : \c"
read ch
case $ch in
	1) echo `expr $a + $b | bc`;;
	2) echo `expr $a - $b | bc`;;
	3) echo `expr $a \* $b | bc`;;
	4) if [ $b -eq 0 ]
	   then
		   echo "Error : Division by zero"
		   exit
	   fi
	   echo `expr $a / $b | bc`;;
	5) echo `expr $a % $b | bc`;;
	*) echo "Invalid Choice"
esac
