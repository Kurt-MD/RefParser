#!/bin/bash

echo "Type the number corresponding to the option.
1. Publishing year for the reference.
2. Keyword present in the title.
3. Neither, you just wanted to extract the reference list."
read -p 'Enter response here: ' desiredfilter

if [[ desiredfilter -eq 1 ]]
then
	echo "You chose to sort by publishing year."
	./program-files/SortByDate.sh
fi

if [[ desiredfilter -eq 2 ]]
then
	echo "You chose to parse by keywords."
	./program-files/SortByKeyword.sh
fi

if [[ desiredfilter -eq 3 ]]
then
	echo "You are done parsing through your reference list."
	./program-files/PromptToAppend.sh

elif [[ desiredfilter -ge 3 ]]
then
	echo "Error: please enter a valid response."
	./program-files/PromptToParse.sh
fi