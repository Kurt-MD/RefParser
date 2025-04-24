#!/bin/bash

echo "BeforeYear.sh working"
read -p "Enter the year: " beforeinputyear

echo "Parsing for references published before $beforeinputyear..."

for year in {1000..$beforeinputyear}
do
	echo $year
done