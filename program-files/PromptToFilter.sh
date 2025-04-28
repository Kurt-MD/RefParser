#!/bin/bash

echo "Type the number corresponding to the option.
1. Filter by publishing year of the reference, within a range.
2. Filter by keyword present in the referenced article's title.
3. Switch to working with a different reference list.
4. Work with an additional reference list.
5. Save the current filtered reference list.
"
read -p 'Enter response here: ' desiredfilter

if [[ desiredfilter -eq 1 ]]
then
	echo "You chose to filter by publishing year."
	./program-files/FilterByYear.sh
fi

if [[ desiredfilter -eq 2 ]]
then
	echo "You chose to filter by keyword."
	./program-files/FilterByKeyword.sh
fi

if [[ desiredfilter -eq 3 ]]
then
	echo "You chose to switch to using a different reference list."
	./program-files/PromptToChange.sh
fi

if [[ desiredfilter -eq 4 ]]
then
	echo "You chose to work with the current reference list in addition to a new one."
	./program-files/PromptToAdd.sh
fi

if [[ desiredfilter -eq 5 ]]
then
	echo "You are done parsing through your reference list."
	./program-files/PromptToSave.sh

elif [[ desiredfilter -ge 5 ]]
then
	echo "Error: please enter a valid response."
	./program-files/PromptToParse.sh
fi