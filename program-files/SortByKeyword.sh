#!/bin/bash
echo "What keyword would you like parse for?"
read -p "Enter keyword here: " keyword

grep  -i "$keyword" .unparsedreflist.txt >> parsedreflist.txt
sort parsedreflist.txt | uniq

echo "What else would you like to parse by?"
./program-files/PromptToParse.sh
