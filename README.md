# RefParser (DO NOT FORGET THE ABSTRACT)

## Author: Kurt "Kurt-MD" Hess

## Abstract
DO NOT FORGET THIS
DO NOT FORGET THIS
DO NOT FORGET THIS

## Introduction
Scientific articles are ubiquitous in science, technology, engineering, and mathematics fields. These provide a means for research on a subject to be published and for readers can find information on it, and can exist in many forms. The most associated with science fields are research papers, in which the methods of a performed study are outlined and the results are discussed along with their implications. In addition to these, meta analyses combine the results of multiple research papers to be used in a broader discussion of a topic. The same is applicable for overview articles, providing a wealth of information on a specific subject, such as a disease. 

These articles tend to pull information from a variety of sources, and as such they may feature lengthy reference lists with tens or hundreds of entries. In addition to the article itself, the reference list can be a valuable resource for finding more information on a topic. They can be especially useful for finding specific information, as meta analyses or overview articles may tend to be a bit more general. However, it can be cumbersome to sort through such a large list in what could be a short time. As such, a program that performs this for the user may be useful for quickly filtering through desired references from an existing list.

This program attempts to do that based on the publishing year of the reference and keywords or key phrases in the title. It first finds and accepts a text file containing the reference list the user would like to filter through, and copies the reference list into a new file which is modified as the program is used. Users can either filter references by publishing year, or by keywords or phrases present in the title. When a match for either is found, the entries are added to a filtered reference list. The user can also choose to work with multiple reference lists simultaneously, or change the reference list they are filtering through. When the user is done, the filtered reference list can either be saved as is, or appended to an existing reference list which they have previously filtered through. The filtered reference list is saved as a simple text document which can be easily opened or exported into another program. 


## Methods and Results

As this project was developed, a set of points were kept in-mind to ease with writing the code and bringing the project together. Many of these points come from the article "Good Enough Practices in Scientific Computing" (Wilson et al., 2017). Some of these were planned on being implementing prior to starting work on this project, while others were excluded as referred to in the discussion. The first among these points was to name variables and program files based on function rather than sequence and programming language. Next was having a short series of "mini-programs" with no more than 60 lines of code, and having a "black box" program which would be called upon and returned to. A sample reference list was used while developing the project, and a different one is included with the program. 

Much of the code in this project exists in multiple files. Besides the first file mentioned, and the one executed at the start of the program, all other files coded are included in the program-files directory. The code from each file will first be pasted below, then the explanation for the function of each line will be provided. Most of the coding for this project was written in Sublime Text, which aided in formatting the code and recognizing the programming language. Additional coding and file creation were done in Windows Subsystem for Linux via the terminal window. Lastly, writing this Markdown file was done in the web-based Markdown editor named Stackedit. 

### *RefParser.sh*
This is the first file in the code and is what is executed when starting the program. Its main purpose is to find and accept the reference list that the user wishes to filter through. 
```
#!/bin/bash

echo "This program is designed to filter through the reference list of an article and pull additional resources for you to use based on your provided inputs.

BEFORE USING THIS PROGRAM:
Copy and paste the reference list from an article into a .txt file. Ideally, each reference should occupy a single line.
Move the .txt file into the same directory as RefParser and make sure no spaces are in the file name.
"
read -p "Enter the name of your desired reference list, including the .txt file extension: " inputfile

if [[ -f $inputfile ]]
then
	echo "The file $inputfile was found! Copying this reference list into a new document..."
	cat $inputfile > .unfilteredreflist.txt
	echo "What would you like to do first?"
	./program-files/PromptToFilter.sh
else
	echo "The file $inputfile was not found. Make sure of the following:
	- The .txt file is in the same directory as this program.
	- There are no spaces in the file name.
	- The file is a .txt file."
fi
```
> The first line is the shebang telling the script which programming language is used; as this project was entirely coded in Shell, this is the same across all files. All cases of the "echo" command in this project are either to instruct the user on what to do, or provide feedback based on their inputs. Here, it is instructing the user on how to prepare the reference list before using this program. Remaining cases of the shebang or echo commands will not be covered besides where necessary. 

`read -p "Enter the name of your desired reference list, including the .txt file extension: " inputfile`
> The read command enables for user input and interprets it as a variable. Here, it is used to establish the user's reference list as the variable $inputfile. The "-p" argument allows for a prompt to be used alongside the command.

`if [[ -f $inputfile ]]`
> This if loop checks to see if the file that the user input exists within the current directory. The -f argument is what checks for the file of the same name. In this case, that file is the $inputfile variable.

```
if [[ -f $inputfile ]]
then
	echo "The file $inputfile was found! Copying this reference list into  a new document..."
	cat $inputfile > .unfilteredreflist.txt
	echo "What would you like to do first?"
	./program-files/PromptToFilter.sh
else
	echo "The file $inputfile was not found. Make sure of the following:
	- The .txt file is in the same directory as this program.
	- There are no spaces in the file name.
	- The file is a .txt file."
fi
```
> If the input file exists, it communicates to the user that it was found and creates the ".unfilteredreflist.txt" text file in the same directory as RefParser. This is then concatenated and written into the text file .unfilteredreflist.txt with the greater than symbol (">").  If this file does not already exist, it will be created upon running this command. The program then executes the next file, "PromptToFilter.sh," which is what calls upon most of the other files in this program. 
> 
> If no input file was found in the directory, then it produces the error message above, and provides reasons as for why, and closes the program.

### *PromptToFilter.sh*
This is the first of the scripts in the program-files directory that is executed, and is the "black box" from which the main operations of the program are performed. 
```
#!/bin/bash

echo "Type the number corresponding to the option.
1. Filter by publishing year of the reference, within a range.
2. Filter by keyword or keyphrase present in the referenced article's title.
3. Switch to working with a different reference list.
4. Work with an additional reference list.
5. Save the current filtered reference list."
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

elif [[ desiredfilter -gt 5 ]]
then
	echo "Error: please enter a valid response."
	./program-files/PromptToFilter.sh
fi
```
> Much like the previous file, this one similarly requires a user-input. However, instead of it being a file, it is instead an option. Each if loop above is activated depending on what the user inputs for the $desiredfilter variable. For each variable that $desiredfilter could be, the option selected is stated and a script corresponding to each option is executed.

> Two arguments are used within the parameters for the if and elif loops to compare $desiredfilter to a number. The "-eq" argument means equal to, and communicates that the $desiredfilter variable should be equal to that value. For example, if $desiredfilter equals 1, then only the script "FilterByDate" will be executed. The "-gt" argument means greater than, and is used to display an error message in this case. If $desiredfilter is greater than 5, then it will display an error message and re-execute PromptToFilter.

I will be covering each of the next script files in the order in which they are called upon based on the options. Option 1 corresponds to FilterByYear, option 2 FilterByKeyword, option 3 to PromptToChange, option 4 to PromptToAdd, and option 5 to PromptToSave. 

### *FilterByYear.sh*
This script asks the user to input a range of years, starting with the first user input and ending with the second. Any reference published between these years will be filtered through.
```
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
```
> The user is asked to input the first year in the range using the read command, and is established as the variable $minYear. The if loop checks if the year is less than 1000, using the "-lt" argument. The script proceeds if $minYear is greater than 1000, and displays an error message and is re-executed otherwise. The second user input is for the last year in the range, established as the variable $maxYear. Two checks exist for this using if loops: first is if it's greater than 9999,  or exceeding four digits, re-executing the script if this is the case; second is if its less than the $minYear variable, at which point the script is re-executed again and the error is displayed if it is. As long as the conditions of all the if loops are not satisfied, then the program proceeds to the while loop.

```
while [[ $minYear -le $maxYear ]]; do
	awk "/$minYear/" .unfilteredreflist.txt >> .filteredreflist.txt
	((minYear++))
	if [[ $minYear -eq $maxYear ]]
	then
		awk "/$minYear/" .unfilteredreflist.txt >> .filteredreflist.txt
	fi
done
```
> The above while loop produces whole number integers ranging from, and including, the $minYear and $maxYear variables. The "-le" argument is used to compare these two values to see if the increasing $minYear is less than or equal to the $maxYear. 
> 
> For the initial $minYear, the year is found in any line of the .unfilteredreflist.txt file using the "awk" command. The $minYear variable is put in quotes and slashes to indicate this is what should be parsed. The result of this awk command are appended to .filteredreflist.txt using two greater-than symbols.
> 
> `((minYear++))` was included so the $minYear variable incrementally increases by 1. The if loop checks for when $minYear and $maxYear are equal, giving the while loop a stopping point and making one more appendation from .unfilteredreflist.txt to .filteredreflist.txt. For example, if you were to input "2010" for the year at the start of the range, the while loop will first iterate 2010, then 2011, 2012, and so on until it is equal to $maxYear. For each year, the awk command is performed.

`sort .filteredreflist.txt | uniq`
> This last line of code sorts the entries in .filteredreflist.txt by alphabetical order. Once this is done, the resulting file is piped into the "uniq" command to remove duplicated entries. After this, the PromptToFilter script is re-executed.

### *FilterByKeyword.sh*
This script parses through the document for user-input keywords and key phrases using grep. 
```
#!/bin/bash
echo "This will only include references only with a specific keyword or keyphrase in their title. You can also use this to search for references from a specific author.

What keyword would you like search for?"
read -p "Enter the keyword here: " keyword

grep  -i "$keyword[., ():;'s]" .unfilteredreflist.txt >> .filteredreflist.txt
sort .filteredreflist.txt | uniq

echo "What else would you like to do?"
./program-files/PromptToFilter.sh
```
> Upon execution, the user is prompted to enter a word or phrase, which is established as the variable $keyword. The main line of code in this script is below.

`grep  -i "$keyword[., ():;'s]" .unfilteredreflist.txt >> .filteredreflist.txt`
> Grep is used to parse for lines with a matching pattern. If you type "grep 'AAA' <filename.txt>" it will extract all lines of text in the file that contain "AAA." Grep is case-sensitive by default, and this case sensitivity is removed using the "-i" argument.
> 
> Importantly, Grep is one of the commands that supports regular expressions. The $keyword variable is the main pattern being matched. In addition, the values in square brackets are also being matched. This is to include any line in the document in which the keyword precedes any of the characters in the brackets. Most of these are different forms of punctuation.
> 
> The first file name, .unfilteredreflist.txt is the file in which Grep reads and parses through. The unfiltered reference list should be a copy of the original reference list the user is using. The output of this Grep command is then redirected and appended to the filtered reference list, .filteredreflist.txt, similarly to the FilterByYear script. The entries appended to the filtered reference list is the output of this script. When finished, PromptToFilter is re-executed.


### *PromptToChange.sh*
This script takes a user input for a file to override the current unfiltered reference list, .unfilteredreflist.txt.
```
#!/bin/bash

echo "Choose the name of the reference list you would like to use instead.

Warning:
This will replace the current unfiltered reference list. If you are not done working with the current reference list, or wish to cancel this input, either enter an invalid file name or exit the program.
This will not delete the references you have already filtered from the current reference list.
Entering an invalid file name will return you to the previous menu."
read -p "Enter the file name here, including the .txt file extension: " newinputfile

if [[ -f $newinputfile ]]
then
	echo "The file $newinputfile was found! Deleting the previously input reference list and replacing it..."
	cat $newinputfile > .unfilteredreflist.txt
	echo "What would you like to do?"
else
	echo "The file $newinputfile was not found. Please make sure of the following:
	- The .txt file is in the same directory as this program.
	- There are no spaces in the file name.
	- The file is a .txt file."
	echo "Returning to the previous menu... What would you like to do?"
fi

./program-files/PromptToFilter.sh
```
> Much like the initial script in RefParser.sh, this first asks the user to input the name and extension of a file using the read command. A warning is displayed that the current contents of .unfilteredreflist.txt will be overwritten. This is saved as the variable $newinputfile. The if loop similarly checks if a file sharing the name and file extension of $newinputfile exists within the directory. If it does not exist, then it will display the  error message and close the loop. 
> 
> If the file corresponding to $newinputfile does exist, then it will concatenate the file using the cat command. The output of this file will be directed to .unfilteredreflist.txt using a single greater than symbol. Since only one is used here, it overrides the existing contents of .unfilteredreflist.txt, instead of appending the output to it. Regardless of if the file is found or not, PromptToFilter will be re-executed upon the closing of the if loop. 

### *PromptToAdd.sh*
This script functions similarly to PromptToAdd, in this case allowing the user to 
```
#!/bin/bash

echo "This will append another reference list to the one you are currently working with. Again, please make sure that each reference occupies a single line and is in the same directory as RefParser.
What other reference list would you like to work with?"
read -p "Enter the file name here, including the .txt file extension: " addedinputfile

if [[ -f $addedinputfile ]]
then
	echo "The file $addedinputfile was found! Appending the reference list to the existing one and sorting the entries..."
	cat $addedinputfile >> .unfilteredreflist.txt
	sort .unfilteredreflist.txt | uniq
	echo "What else would you like to do?"
	./program-files/PromptToFilter.sh
else
	echo "The file $addedinputfile was not found. Please make sure of the following:
	- The .txt file is in the same directory as this program.
	- There are no spaces in the file name.
	- The file is a .txt file."
	echo "Returning to the previous menu... What would you like to do?"
	./program-files/PromptToFilter.sh
fi
```
> Similarly to PromptToChange.sh, this script prompts the user to enter a file using the read command, and saves the input as the variable $addedinputfile. It similarly still checks for $addedinputfile exists in the directory, and if it is not found, an error message is displayed and PromptToFilter is re-executed. 
> 
> If it is found, the text contained in $addedinputfile is concatenated using the "cat" command. However, instead of overwriting .unfilteredreflist.txt, it appends the contents to it, using two greater than symbols instead of one. The string 
> `sort .unfilteredreflist.txt | uniq` is included here to sort the combined reference list alphabetically and remove possible duplicate entries.

### *PromptToSave.sh*
This script prompts the user to save their parsed reference list, either by saving it as a stand-alone text file or appending it to an existing one. 
```
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
elif [[ saveorappend -gt 3 ]]; then
	echo "Error: please enter a valid response."
	./program-files/PromptToSave.sh
fi
```
> Similarly to PromptToFilter.sh, this script prompts the user to type a number corresponding to a specific option, and works in the same way. The number corresponding to the selected option is saved as the variable $saveorappend. The "elif" if loop checks if $saveorappend is greater than 3 using the "-gt" argument, and displays an error message and reruns the script if true.
> 
> As opposed to the five options in PromptToFilter.sh, this only contains three. The three if loops check if $saveorappend is equal to each option's corresponding number. If it is equal to that number, a message saying the selected option is echoed and the corresponding file is ran. Option 1 corresponds to the script SaveRefList, option 2 to AppendRefList, and option 3 re-executed PromptToFilter. 

### *SaveRefList.sh*
```
#!/bin/bash

read -p "Enter the file name of your new reference list, including the .txt file extension: " savedreflist

echo "The file $savedreflist was created! Tidying it up and removing old files..."

sort .filteredreflist.txt | uniq > $savedreflist
rm .unfilteredreflist.txt
rm .filteredreflist.txt
echo "Your reference list has been saved successfully to $savedreflist!"
```
> This script similarly prompts the user to enter the name of the file they would like to save their reference list as, and echoes that it will be saved. The name of the file they would like to save to is stored as the variable $savedreflist.

`sort .filteredreflist.txt | uniq > $savedreflist`
> The file .filteredreflist.txt, the modified output of FilterByYear and FilterByKeyword, is first sorted alphabetically and only by unique entries using the pipe ("|") character. The output of these commands is directed into a new file matching the file name in the $savedreflist variable. 

`rm .unfilteredreflist.txt`
`rm .filteredreflist.txt`
> The two lines above delete the .unfilteredreflist.txt and .filteredreflist.txt text files, as to not clog up the directory in which RefParser is stored in, and to avoid any mistakes with preserving the files across runs of this program. After these files are removed, a final message saying the file was saved is echoed, and the program stops running. This is one of two ways the program can stop, besides cancelling. 

### *AppendRefList.sh*
This file gives the option for the user to append the contents of their filtered reference list, .filteredreflist.txt to an existing text file. 
```
#!/bin/bash

echo "To which existing reference list would you like to append your filtered one to?"
read -p "Enter the file name here, including the .txt file extension: " existingreflist

if [[ -f $existingreflist ]]; then
	echo "The file $existingreflist was found! Tidying up..."
	cat .filteredreflist >> $existingreflist
	sort $savedreflist | uniq
	rm .unfilteredreflist.txt
	rm .filteredreflist.txt
	echo "You have successfully appended your reference list to $savedreflist!"
else
	echo "The file $existingreflist was not found. Please make sure of the following:
	- The .txt file is in the same directory as this program.
	- There are no spaces in the file name.
	- The file is a .txt file."
	./program-files/AppendRefList.sh
fi
```
> Upon this executing this file, the user is prompted to enter the name of the file they wish to append their filtered reference list to, and saves this as the variable $existingfreflist. The if loop with the "-f" argument checks if $existingreflist is found. If it is not found, the "else" part of the loop is executed and an error message is displayed. This script is also re-executed. 
> 
> If the file is found, it concatenates the output of .filteredreflist.txt and directs that output into $existingreflist, using two the greater than symbols to append the contents. The next line sorts $existingreflist for unique entries one additional time in case any duplicates were found. The two remove ("rm") commands remove both the .unfilteredreflist.txt and the .filteredreflist.txt in preparation for if RefParser is ran again. After the removal of these files, a message displaying that the file was created is echoed, and the program ends. 

## Discussion and Conclusions
**Coding Discussion, Outputs, and Errors**


In terms of code-specific decisions used in the final project, the echoed text asking the user what they would like to do was included before PromptToFilter was executed so it could be different depending on if the user has already filtered the reference list currently in use. For the options in PromptToFilter and PromptToSave, numbers were deliberately used instead of words which the user had to type, which were originally used. The change was made so user inputs were less prone to typos, for ease of quickly selecting options, and for ease of coding. Sorting by unique entries was not done in PromptToChange.sh as the reference list the user had is likely already sorted and is unlikely to include duplicates.

**Non-coding Details and Exclusions**
Besides the code included in this project, there were a few things I did during the development of this project that were left out, either deliberately or due to time constraints. Before I finished coding, I confused actual reference parsing with what I did here; reference parsing is actually separating fields such as the authors, title, publishing year, and more into separate fields to be recompiled. What I did, and what I thought reference parsing actually was, was pulling out references based on specific parameters. This neither changed the original vision of this project following its proposal, nor did it affect my coding after the realization. 

The major exclusion I originally planned was to have a way to pull the actual reference list from either a .pdf version of the document, or the HTML code of a web-based version of the article. The .pdf converter was ultimately abandoned as I neither wanted to use a program someone else wrote, nor did I want to deal with the conversion in file formats and the unrecognized characters. The HTML coding idea seemed more desirable until I realized that websites could vary greatly in how they were structured and formatted, and that modern websites use a combination of programming languages. I also wanted to prioritize coding the others aspects of this project, and I took longer than anticipated to figure them out. As such, no means of pulling the reference list, either from another file format or from the web, were included.

In terms of other exclusions, I originally had a "change log" that I would update to track my progress and note major additions or removals. However, as I repeatedly forgot to update it, I ultimately left it out of this project. The same applied to the temporary files directory, which would have been included to distinguish the filtered and unfiltered reference lists. This produced multiple errors when attempting to sort the temporary and final outputs, appending entries, and saving the final filtered reference list.

There are two notable exclusions in terms of code used. First, I wanted to incorporate Python in addition to HTML. This was ultimately left out as, though I could get a script in Shell to execute a script in Python, I could not do the reverse. Second, I originally wanted to have the code filtering the reference list by year be in three different files: one for sources published before a given year, one for sources published after, and one for sources with in a year range. The year range file stuck as having the program files for the other options would be redundant and unnecessary. If you would like to see some of the failed coding attempts for the FilterByYear script, refer to the Appendix. 

**Conclusion**
In the future, I would like to continue working on this project as a side-passion. I could include a way of extracting the reference list from an article, and would like to fix some of the previously-discussed bugs in the code. When discussing the project with my instructor, she said that the idea seems quite "iterative" as I could add suggested features and parameters to filter through. If possible, I would like to add such parameters and find ways to code them in. 

## References
Ellingwood, J., & Walia, A. S. (2025, April 20). Mastering grep with regular expressions: Guide for efficient text search. Digital Ocean. Retrieved April 28, 2025, from https://www.digitalocean.com/community/tutorials/using-grep-regular-expressions-to-search-for-text-patterns-in-linux

Geeks for Geeks. (2024, January 2). Bash scripting - while loop. Retrieved April 28, 2025, from https://www.geeksforgeeks.org/bash-scripting-while-loop/

Geeks for Geeks. (2025, April 11). AWK command in Unix/Linux with examples. Retrieved April 28, 2025, from https://www.geeksforgeeks.org/awk-command-unixlinux-examples/

Haddock, S. H. D., & Dunn, C. W. (2010). Practical computing for biologists. Sinauer Associates.

Kadima, S. (2023, April 24). Shell scripting: Comparison operators and if statements. Medium. Retrieved April 28, 2025, from https://medium.com/@kadimasam/shell-scripting-comparison-operators-and-if-statements-9e0277fd60b8

The Open Group. (2018). Utilities: Awk. Retrieved April 28, 2025, from https://pubs.opengroup.org/onlinepubs/9699919799/utilities/awk.html

Salerno, P. (2025, January 16). Computing for Biologists | SMCM Spring 2025. Retrieved April 28, 2025, from https://pesalerno.github.io/computing_SP25/

Website updated throughout the semester.

Sublime HQ. (n.d.). Sublime text: Text editing, done right. Retrieved April 28, 2025, from https://www.sublimetext.com/

Walia, A. S. (2025, April 14). Shell script if else: Comprehensive guide with examples. Digital Ocean. Retrieved April 28, 2025, from https://www.digitalocean.com/community/tutorials/if-else-in-shell-scripts

Walia, A. S., & Kumar, P. (2025, February 13). Mastering grep command in Linux/Unix: A beginner's tutorial. Digital Ocean. Retrieved April 28, 2025, from https://www.digitalocean.com/community/tutorials/grep-command-in-linux-unix

Wilson, G., Bryan, J., Cranston, K., Kitzes, J., Nederbragt, L., & Teal, T. K. (2017). Good enough practices in scientific computing. PLoS computational biology, 13(6), e1005510. https://doi.org/10.1371/journal.pcbi.1005510


## Appendix: Excluded Code for FilterByYear.sh
Below are some of the attempted code used for FilterByYear.sh that did not work.