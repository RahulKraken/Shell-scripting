#! /bin/bash

# ECHO COMMAND
echo Hello World!

# VARIABLES
# Uppercase by convention
# Letters, numbers, underscores
NAME="Kraken"
echo "My name is $NAME"
echo "My name is ${NAME}"

# USER INPUT
read -p "Enter your name: " NAME
echo "Hello $NAME, nice to meet you"

# SIMPLE IF STATEMENT
if [ "$NAME" == "Kraken" ]
then
	echo "Your name is Kraken."
fi

# IF-ELSE
if [ "$NAME" == "Rahul" ]
then
	echo "Your name is Rahul."
else
	echo "Your name is NOT Rahul."
fi

# ELSE-IF (elif)
if [ "$NAME" == "Rahul" ]
then
	echo "Your name is Rahul."
elif [ "$NAME" == "Kraken" ]
then
	echo "Your name is Kraken."
else
	echo "You are a stranger."
fi

# COMPARISON
############
# val1 -eq val2 Returns true if the values are equal
# val1 -ne val2 Returns true if the values are not equal
# val1 -gt val2 Returns true if val1 is greater than val2
# val1 -ge val2 Returns true if val1 is greater than or equal to val2
# val1 -lt val2 Returns true if val1 is less than val2
# val1 -le val2 Returns true if val1 is less than or equal to val2
############

NUM1=3
NUM2=5
if [ "$NUM1" -gt "$NUM2" ]
then
	echo "$NUM1 is greater than $NUM2"
elif [ "$NUM1" -ge "$NUM2" ]
then
	echo "$NUM1 is equal to $NUM2"
else
	echo "$NUM1 is less than $NUM2"
fi

# FILE CONDITIONS
#############
# -d file	True if the file is a directory
# -e file	True if the file exists(note that this is not particularly portable, thus -f is generally used)
# -f file 	True if the provided string is a file
# -g file 	True if the group id is set on a file
# -r file 	True if the file is readable
# -s file 	True if the file has a non-zero size
# -u		True if the user id is set on a file
# -w 		True if the file is writable
# -x 		True if the file executable
#############

read -p "Enter file/directory name: " FILE
if [ -d "$FILE" ]
then
	echo "$FILE is a directory."
elif [ -f "$FILE" ]
then
	echo "$FILE is a file."
else
	echo "$FILE is not a directory or file."
fi

# CASE STATEMENT
read -p "Are you 21 or over? Y/N " ANS
case "$ANS" in
	[yY] | [yY][eE][sS])					# case 1
		echo "You can have a beer :)"
		;;
	[nN] | [nN][oO])						# case 2
		echo "Sorry, no drinking :("
		;;
	*)										# kinda default statement
		echo "Please enter y/yes or n/no"
		;;
esac

# SIMPLE FOR LOOP
NAMES="Kraken Rahul Gawd Lol"
for NAME in $NAMES
	do
		echo "Hello $NAME"
done

# FOR LOOP TO RENAME FILES
FILES=$(ls *.txt)							# '*' is a wild card
NEW="new"
for FILE in $FILES
	do
		echo "Renaming $FILE to new-$FILE"
		mv $FILE $NEW-$FILE
done

# WHILE LOOP - READ THROUGH A FILE LINE BY LINE
LINE=1
while read -r CURRENT_LINE
	do
		echo "$LINE: $CURRENT_LINE"
		((LINE++))							# ((...)) means perform arithmetic and return result
done < "./new-1.txt"

# FUNCTION
function sayHello() {
	echo "Hello World"
}

sayHello

# FUNCTION WITH PARAMS
function greet() {
	echo "Hello, I am $1 and I am $2"
}

read -p "name - " NAME
read -p "age - " AGE

greet $NAME $AGE

# CREATE FOLDER AND WRITE TO A FILE
mkdir hello
touch "hello/world.txt"
echo "Hello World" >> "hello/world.txt"
echo "Created hello/world.txt"