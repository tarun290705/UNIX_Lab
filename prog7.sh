# 7. Design a menu to display different shell commands. Provide the user the choice to execute different shell commands.

#!/bin/bash

echo "MENU :"
echo "1. who"
echo "2. whoami"
echo "3. ls -l"
echo "4. date"
echo "5. exit"
echo -e "\nEnter your choice : \c"
read ch
case $ch in
	1) who;;
	2) whoami;;
	3) ls -l;;
	4) date;;
	5) exit;;
	*) echo "Invalid Choice!"
esac