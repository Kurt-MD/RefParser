#!/bin/bash

read -p "Enter the file name of your new reference list, including the .txt file extension: " savedreflist
cat .filteredreflist.txt > $savedreflist
echo "Your reference list was saved to $savedreflist! Tidying it up..."
sort $savedreflist | uniq
rm .unfilteredreflist.txt
rm .filteredreflist.txt
echo "Your reference list has been saved successfully!"