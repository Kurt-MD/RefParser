#!/bin/bash

read -p 'What would you like to filter by?
- Publishing year for the reference (type "Year")
- Keyword present in the title (type "Word")
- Neither, you just wanted to extract the reference list (type "Done")
Enter response here: ' desiredfilter

echo "$desiredfilter"
