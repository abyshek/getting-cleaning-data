# CODE BOOK

This codebook describes the variables, the data and any other transformation that has been performed to the supplied dataset.

# Data Source

Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Original description of project: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Some insight of the experiment and data (from original source)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

# Variables

Following are some major variables used in the R script to perform the transformation:

1. act_lbls : data from "activity_labels.txt" is read into this variable
2. data_colname: data from "features.txt" is read into this variable and gives us the column names
3. X_trainingdata: data from "X_train.txt" is read into this variable
4. Y_trainingdata: data from "y_train.txt" is read into this variable
5. trainingsubject: data from "subject_train.txt" is read into this variable and gives us the ids of participants of training
6. trainingdata: this variable stores the combined dataset of X and Y training data
7. X_testdata: data from "X_test.txt" is read into this variable
8. Y_testdata: data from "Y_test.txt" is read into this variable
9. testsubject: data from "subject_test.txt" is read into this variable and gives us ids of participants of test
10. testdata : this variable stores the combined dataset of X and Y test data
11. combinedata: this variable stores the merged dataset of "testdata" and "training data"

# Transformations
The R script has been divided into several sections
Section 1: This section process the "training" dataset. This section reads various text files related to training and stores them in variables as mention in the above "Variables" section. Line 39 of this section extracts only the measurements of mean and standard deviation. Lines 55 and 56 give meaningful labels to the measurement data

Section 2: Section 2 performs similar operation on the "test" dataset as performed by the section 1.

Section 3: This section merges the datasets created by section 1 and section 2 and creates a tidy dataset with with meaningful labels.

Section 4: This section creates a second tidy dataset with average values of each activity and each subjects. This section uses the melt and dcast function of "reshape2" package to convert long data format to wide data format.

Section 5: This final section outputs the tidy data created in section 4 to a text file named "tidy_data.txt" and to a csv file named "tidy_data.csv". Additional csv file has been created to present the tidy data in a better format.

# Implementation of the code

Original dataset and R script (run_analysis.R) should be saved together in the working directory. After sourcing the R file, function run_analysis() should be called without any parameters. This would create the final tidy data text file in the working directory.
  
