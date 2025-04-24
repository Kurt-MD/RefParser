#!/bin/bash

echo "Would you like to parse for references published before or after a year, or within a specific year range?
Type the number corresponding to which option.
1. Before and excluding a given year.
2. After and including a given year.
3. Within a specific year range, including both years.
4. Return to the previous menu."

read -p "Enter a response here: " yearoption

if [[ $yearoption -eq 1 ]]; then
	echo "BeforeYear"
	./program-files/BeforeYear.sh
fi

if [[ $yearoption -eq 2 ]]; then
	echo "AfterYear"
	./program-files/AfterYear.sh
fi

if [[ $yearoption -eq 3 ]]; then
	echo "YearRange"
	./program-files/RangeYear.sh
fi

if [[ $yearoption -eq 4 ]]; then
	echo "Returning to the previous menu..."
	echo "What would you like to parse by?"
	./program-files/PromptToParse.sh

elif [[ $yearoption -ge 4 ]]
then
	echo "Error: please enter a valid response."
	./program-files/SortByDate.sh
fi