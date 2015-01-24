## Getting and Cleaning Data - Course Project

This project is aimed at creating an R script to convert the Human Activity Recognition Using Smartphones Dataset into a tidy dataset. This project contains an R script called run_analysis.R that does the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Following are the steps to execute this run_analysis.R:

1.Download the required dataset from the links given below,

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2.Extract and save the dataset in a folder.

3.The R script is dependent on two packages "reshape2" and "data.table". You can install and load them as follows,
	3.1Open R console and type following commands
	3.2install.packages("reshape2")
	3.3install.packages("data.table")
	If no error occurs so far, load these packages before running the main script,
	3.4library(reshape2)
	3.5library(data.table)

4.Change the working directory in R to the home directory of downloaded dataset i.e. 'UCI HAR Dataset' folder.

5.Copy the run_analysis.r file in 'UCI HAR Dataset' folder

6.Enter the following commands in R to create tidy dataset in a text file(tidyData.txt) in 'UCI HAR Dataset' folder,
	6.1 source("run_analysis.r")
	6.2 generateTidyData

### For details about variables in the dataset refer to codebook.md file
