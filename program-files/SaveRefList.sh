#!/bin/bash

read -p "Enter the file name of your new reference list, including the .txt file extension: " savedreflist
sort .filteredreflist.txt | uniq > $savedreflist
echo "Your reference list was saved to $savedreflist! Tidying it up..."
rm .unfilteredreflist.txt
rm .filteredreflist.txt
echo "Your reference list has been saved successfully!"