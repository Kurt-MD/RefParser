#!/bin/bash

echo "BEFORE USING THIS PROGRAM:
This program is meant to be used in conjunction with a .pdf to .txt converter. If you have not already converted the .pdf of your article to a .txt file yet, please do so before continuing.
In addition, please make sure to remove any spaces from the file name.

This program is designed to parse through an article to find additional articles for you to use."
#read -p "Paste the file name of your article here, including the .txt file extension: " inputfile

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
