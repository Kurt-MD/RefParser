#!/bin/bash

read -p "From: " minYear

if [[ $minYear -lt 1000 ]]; then
	echo "Error: years before 1000 are not supported. Please enter a valid year."
	./program-files/FilterByYear.sh
fi

read -p "To: " maxYear

if [[ $maxYear -gt 9999 ]] ; then
	echo "Error: the year should only be four digits. Please enter a valid year."
	./program-files/FilterByYear.sh
fi

if [[ $minYear -gt $maxYear ]] ; then
	echo "Error: The year at the start of the range should be less than the year at the end."
	./program-files/FilterByYear.sh
fi

echo "Searching for refernces published between $minYear and $maxYear..."

while [[ $minYear -le $maxYear ]]; do
	awk "/$minYear/" .unfilteredreflist.txt >> .filteredreflist.txt
	((minYear++))
	if [[ $minYear -eq $maxYear ]]
	then
		awk "/$minYear/" .unfilteredreflist.txt >> .filteredreflist.txt
	fi
done

sort .filteredreflist.txt | uniq
echo "References published between $minYear and $maxYear have been added to your filtered reference list!
What else would you like to do?"
./program-files/PromptToFilter.sh