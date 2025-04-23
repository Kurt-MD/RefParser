#!/bin/bash
echo "What keyword would you like parse through?"
read -p "Enter keyword here (case-sensitive): " keyword

grep  -i "$keyword" .unparsedreflist.txt > parsedreflist.txt
sort parsedreflist.txt | uniq

echo "What else would you like to parse through?"
./program-files/PromptToParse.sh