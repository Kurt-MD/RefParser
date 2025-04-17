#!/bin/bash

echo "BEFORE USING THIS PROGRAM:
This program is meant to be used in conjunction with a .pdf to .txt converter.
If you have not already converted the .pdf of your article to a .txt file yet, please do so before continuing.

This program is designed to parse through an article to find additional articles for you to use."
read -p "Paste the file name of your article here, including the .txt file extension: " inputfile
cat $inputfile > ~refparserlist.txt

./program-files/PromptFilter.sh