# getting-cleaning-data
This is a repo for the course project "Getting and Cleaning Data". This repo contains an R script file named run_analysis.R which performs following steps:

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3) Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names. 

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Pre-requisites and how to use the script
Two R packages named "data.table" and "reshape2" are needed to run this R script. The script automatically checks if the said two packages are installed. If not, the script will install them using internet and load them.

You need to have the supplied dataset "UCI HAR Dataset" in the working directory of RStudio.
After sourcing the R script, run the function "run_analysis()" to get the tidy data set. 
The function will create a text file "tidy_data". You can view the file in Notepad (try to see with and without "Word Wrap") or any other text editor. You can also check by reading the text file from R Studio and then use view() function to see the imported data in a tabular form.
