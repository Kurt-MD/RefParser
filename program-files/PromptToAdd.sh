#!/bin/bash

echo "This will append another reference list to the one you are currently working with. Again, please make sure that each reference occupies a single line and is in the same directory as RefParser.
What other reference list would you like to work with?"
read -p "Enter the file name here, including the .txt file extension: " addedinputfile

if [[ -f $addedinputfile ]]
then
	echo "The file $addedinputfile was found! Appending the reference list to the existing one and sorting the entries..."
	cat $addedinputfile >> .unfilteredreflist.txt
	sort .unfilteredreflist.txt | uniq
	echo "What else would you like to do?"
	./program-files/PromptToFilter.sh
else
	echo "The file $addedinputfile was not found. Please make sure of the following:
	- The .txt file is in the same directory as this program.
	- There are no spaces in the file name.
	- The file is a .txt file."
	echo "Returning to the previous menu... What would you like to do?"
	./program-files/PromptToFilter.sh
fi