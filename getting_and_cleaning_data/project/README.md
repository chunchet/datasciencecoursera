# Getting and Cleaning Data
Project of the Coursera course in data science, **Getting and Cleaning Data**. 
As part of an understanding in generating a tidy dataset from the raw wearable
computing data collected from the accelerometers from the Samsung Galaxy S 
smartphone.

## File in this repo
* README.md -- you are reading it
* CodeBook.md -- codebook describing the data, the variable formats and transformations
* run_analysis.R -- main R code for the project

## The Project
To create a R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each 
   measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set 
   with the average of each variable for each activity and each subject.

## How does it work?
1. Donwload ```UCI HAR dataset``` from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip the dataset in the same working directory.
3. run the R script, ```run_analysis.R```, as follows:  
   > source("run_analysis.R")
4. A tidy dataset called, tidy_data.txt will be generated.

_Note_: Dependency packages, ```data.table``` and ```reshape2```, 
        will be installed automatically if any is missing.
