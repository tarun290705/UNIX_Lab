# 11. Write a shell script to calculate and display the electricity bill by taking the number of units consumed.

#!/bin/bash

echo -e "Enter the number of units : \c"
read units
if [ $units -le 200 ]
then
	perc=0.8
	amt=$(echo "$units*$perc" | bc)
elif [ $units -gt 200 ] && [ $units -le 300 ]
then
	excess_units=$(echo "$units - 200" | bc)
	base_amt=$(echo "200*0.8" | bc)
	excess_amt=$(echo "$excess_units*0.9" | bc)
	amt=$(echo "$base_amt+$excess_amt" | bc)
else
	excess_units=$(echo "$units-300" | bc)
	base_amt=$(echo "200*0.8" | bc)
	mid_amt=$(echo "100*0.9" | bc)
	excess_amt=$(echo "$excess_units" | bc)
	amt=$(echo "$base_amt+$mid_amt+$excess_amt" | bc)
fi
amt=$(echo "$amt+100" | bc)
if [ $(echo "$amt>400" | bc) -eq 1 ]
then
	sur=$(echo "$amt*15/100" | bc)
	amt=$(echo "$amt+$sur" | bc)
fi
echo "Amount to be paid : $amt"
