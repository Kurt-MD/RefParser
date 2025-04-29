#!/bin/bash

echo "Would you like to save your filtered reference list as a new one, or append it to an existing reference list?
Type the number corresponding to the option.
1. Save the current filtered reference list.
2. Append the filtered reference list to an existing one.
3. Return to the previous menu."
read -p "Enter your response here: " saveorappend

if [[ saveorappend -eq 1 ]]; then
	echo "You chose to save your current reference list."
	./program-files/SaveRefList.sh
fi

if [[ saveorappend -eq 2 ]]; then
	echo "You chose to append your current reference list to an existing one."
	./program-files/AppendRefList.sh
fi

if [[ saveorappend -eq 3 ]]; then
	echo "Returning to the previous menu... What would you like to do?"
	./program-files/PromptToFilter.sh
elif [[ saveorappend -ge 3 ]]; then
	echo "Error: please enter a valid response."
	./program-files/PromptToSave.sh
fi