#!/bin/bash

echo "This program is designed to filter through the reference list of an article and pull additional resources for you to use based on your provided inputs.

BEFORE USING THIS PROGRAM:
Copy and paste the reference list from a web-based version of your article into a .txt file. Ideally, each reference should occupy a single line.
Move the .txt file into the same directory as RefParser and make sure no spaces are in the file name.
"
read -p "Enter the name of your desired reference list here, including the .txt file extension: " inputfile

if [[ -f $inputfile ]]
then
	echo "The file $inputfile was found! Copying this reference list into a new document..."
	cat $inputfile > .unfilteredreflist.txt
	echo "What would you like to do first?"
	./program-files/PromptToFilter.sh
else
	echo "The file $inputfile was not found. Make sure of the following:
	- The .txt file is in the same directory as this program.
	- There are no spaces in the file name.
	- The file is a .txt file."
fi