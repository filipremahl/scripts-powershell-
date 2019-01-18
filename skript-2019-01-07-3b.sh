#!/bin/bash
#Singel spacing file
sed G data.txt >data2.txt
cat data2.txt >data.txt

#check if file exists, if it dose, dubble spaces it, then removing all empty lines in $FILE
FILE=$1
if [ -f $FILE ]; then
   echo "File $FILE exists."
sed G data2.txt >$FILE
sed '/^[[:space:]]*$/d' $FILE > data2.txt
cat data2.txt > $FILE
else
   echo "File $FILE does not exist."
fi
