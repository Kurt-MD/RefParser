#!/bin/bash

echo "To which existing reference list would you like to append your filtered one to?"
read -p "Enter the file name here, including the .txt file extension: " existingreflist

if [[ -f $existingreflist ]]; then
	echo "The file $existingreflist was found! Tidying up..."
	cat .filteredreflist > $existingreflist
	sort $savedreflist | uniq
	rm .unfilteredreflist.txt
	rm .filteredreflist.txt
	echo "You have successfully appended your reference list to $savedreflist!"
else
	echo "The file $existingreflist was not found. Please make sure of the following:
	- The .txt file is in the same directory as this program.
	- There are no spaces in the file name.
	- The file is a .txt file.
	"
	./program-files/AppendRefList.sh
fi