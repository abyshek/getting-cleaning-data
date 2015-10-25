## Following line of codes perform the parts of the assignment.         |
## Following code first checks if the pre-requisite packages are        |
## installed. If not,it installs the packages.(a) It then merges the    |
## training and the test sets to create one data set. (b) Then          |
## extracts only the measurements on the mean and standard deviation    |
## for each measurement. (c) The code uses descriptive activity names   |
## to name the activities in the data set. (d)code then appropriately   |
## labels the data set with descriptive activity names.                 |
## (e) Finally, the code creates a second, independent tidy data set    |
## with the average of each variable for each activity and each subject.|
##----------------------------------------------------------------------

run_analysis <- function()
{
  
  #checks if "data.table" and "reshape2" packages are installed
  if (!require("data.table")) {
  install.packages("data.table")
  }

  if (!require("reshape2")) {
  install.packages("reshape2")
  }

  #loads the data.table and reshape2 package
  library("data.table")
  library("reshape2")
  ##---------------------------------------------------------------------- 
  
  ## Process the Training data set and extract only measurements
  
  # Load the activity labels
  act_lbls <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
  
  # Load the data column names
  data_colname <- read.table("./UCI HAR Dataset/features.txt")[,2]
  
  # Extract only the measurements on the mean and standard deviation for each measurement.
  measurement <- grepl("mean|std", data_colname)
  
  X_trainingdata <- read.table("./UCI HAR Dataset/train/X_train.txt")
  Y_trainingdata <- read.table("./UCI HAR Dataset/train/y_train.txt")
  
  trainingsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  names(X_trainingdata) = data_colname
  
  # Extract only the measurements on the mean and standard deviation for each measurement.
  X_trainingdata = X_trainingdata[,measurement]
  
  
  Y_trainingdata[,2] = act_lbls[Y_trainingdata[,1]]
  names(Y_trainingdata) = c("ACTIVITY_ID", "ACTIVITY_LABEL")
  names(trainingsubject) = "PARTICIPANT"
  
  
  trainingdata <- cbind(as.data.table(trainingsubject), Y_trainingdata, X_trainingdata)
  
  ##------------------------------------------------------------------------------------
  
  ## Process the "test data set" and extract only measurements
  
  # Load X_test & y_test data.
  X_testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
  Y_testdata <- read.table("./UCI HAR Dataset/test/y_test.txt")
  testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  names(X_testdata) = data_colname
  
  # Extract only the measurements
  X_testdata = X_testdata[,measurement]
  
  # Load activity labels
  Y_testdata[,2] = act_lbls[Y_testdata[,1]]
  names(Y_testdata) = c("ACTIVITY_ID", "ACTIVITY_LABEL")
  names(testsubject) = "PARTICIPANT"
  
  testdata <- cbind(as.data.table(testsubject), Y_testdata, X_testdata)
  
  ##------------------------------------------------------------------------------------
  
  ## Merge the worked out "training" and "test data" sets and create a tidy set with proper
  ## labels.
  combinedata = rbind(testdata, trainingdata)
  
  id_label   = c("PARTICIPANT", "ACTIVITY_ID", "ACTIVITY_LABEL")
  data_label = setdiff(colnames(combinedata), id_label)
  data_melt      = melt(combinedata, id = id_label, measure.vars = data_label)
  
  ##--------------------------------------------------------------------------------------
  
  
  ## Appending averages of the variables of each activity and each subject
  ## to create second tidy set
  final_data   = dcast(data_melt, PARTICIPANT + ACTIVITY_LABEL ~ variable, mean)
  ##-------------------------------------------------------------------------------------
  
  ## Write the final tidy dataset to a text file named "tidy_data.txt"
  write.table(final_data, file = "./tidy_data.txt", sep="\t", row.names = FALSE)
}