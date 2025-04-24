#!/bin/bash

echo "RangeYear.sh working"
read -p "Enter the first year in the range: " beforerangeyear
read -p "Enter the last year in the range: " afteryearrange

for year in [$beforerangeyear-$afteryearrange] do
	echo year
done