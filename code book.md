

Prerequisites:

Data should be downloaded from the below link and placed in a local directory:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Place the files in the working directory




The code run_analysis.R contains does the following:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


Variables:

Subject ID- A total of 30 subjects
Activity label : 6 lables
Mean and Standard deviation for the given values


Output files:

tidydata.csv : Data set with only the mean and standard deviation for each measurement (10 299 rows by 563 variables).
tidydata.mean.csv : Aggregate using mean for each activity and each subject (180 rows by 68 variables).
Experimental study design used

