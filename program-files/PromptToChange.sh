#!/bin/bash

echo "Choose the name of the reference list you would like to use instead.

Warning:
This will replace the current unfiltered reference list. If you are not done working with the current reference list, or wish to cancel this input, either enter an invalid file name or exit the program.
This will not delete the references you have already filtered from the current reference list.
Entering an invalid file name will return you to the previous menu."
read -p "Enter the file name here, including the .txt file extension: " newinputfile

if [[ -f $newinputfile ]]
then
	echo "The file $newinputfile was found! Deleting the previously input reference list and replacing it..."
	cat $newinputfile > .unfilteredreflist.txt
	echo "What would you like to do?
	"
else
	echo "The file $newinputfile was not found. Please make sure of the following:
	- The .txt file is in the same directory as this program.
	- There are no spaces in the file name.
	- The file is a .txt file."
	echo "Returning to the previous menu... What would you like to do?"
fi

./program-files/PromptToFilter.sh