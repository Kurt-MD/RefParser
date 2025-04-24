#!/bin/bash

echo "This program is designed to parse through an article to find additional articles for you to use.

BEFORE USING THIS PROGRAM:
Copy and paste the reference list from a web-based version of you article into a .txt file. Ideally, each reference should occupy one line.
Move the .txt file into the same directory as RefParser and make sure no spaces are in the file name."

echo "REMEMBER TO MAKE THIS FILE THE ONE THAT PULLS THE REFERENCE LIST!"
#read -p "Enter the name of your desired reference list here, including the .txt file extension: " inputfile

echo "USING SAMPLE FILE."
cat sample.txt > .unparsedreflist.txt
echo "What would you like to parse the reference list by?"
./program-files/PromptToParse.sh

#if [[ -f $inputfile ]]; then
#	echo "$inputfile found!"
#	cat $inputfile > .unparsedreflist.txt
#	What would you like to parse the reference list by?
#	./program-files/PromptToParse.sh
#else
#	echo "The file $inputfile was not found. Make sure of the following:
#	- The .txt file is in the same directory as RefParser
#	- There are no spaces in the file name.
#	- The file is a .txt file."
#fi
