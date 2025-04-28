#!/bin/bash
echo "This will only include references only with a specific keyword in their title. You can also use this to search for references from a specific author.

What keyword would you like search for?"
read -p "Enter the keyword here: " keyword

grep  -i "$keyword[., ():;'s]" .unfilteredreflist.txt >> .filteredreflist.txt
sort .filteredreflist.txt | uniq

echo "What else would you like to do?"
./program-files/PromptToFilter.sh