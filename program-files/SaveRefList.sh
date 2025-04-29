#!/bin/bash

read -p "Enter the file name of your new reference list, including the .txt file extension: " savedreflist

echo "The file $savedreflist was created! Tidying it up and removing old files..."

sort .filteredreflist.txt | uniq > $savedreflist
rm .unfilteredreflist.txt
rm .filteredreflist.txt
echo "Your reference list has been saved successfully to $savedreflist!"