# CodeBook
This codebook is to describe the data, the variable formats and processes 
that are taken to generate a tidy dataset from the raw ```UCI HAR Dataset```.

# The Data Source

* Dataset: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
  (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Description of dataset: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]
  (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
  
## Dataset Information
The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, we captured 3-axial linear acceleration and 
3-axial angular velocity at a constant rate of 50Hz. The experiments have been 
video-recorded to label the data manually. The obtained dataset has been 
randomly partitioned into two sets, where 70% of the volunteers was selected 
for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by 
applying noise filters and then sampled in fixed-width sliding windows of 
2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The 
gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and 
frequency domain.

## Attribute Information
For each record in the dataset it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and 
  the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

## Tidy Data Processes
### 0. Pre-requisition
Check for required packages: ```data.table```, ```reshape2```.  
Install if any package is missing and load the required packages.

### 1. Merges the training and the test sets to create one data set.
Read data from the following files:

> train/subject_train.txt -- subject ids for training data
  train/X_train.txt -- feature variables for training data
  train/y_train.txt -- labels for training data
  test/subject_test.txt -- subject ids for test data
  test/X_test.txt -- feature variables for test data
  test/y_test.txt -- labels for test data

Training and test feature variables are combined into a single dataset.

### 2. Extract only the measurement on the mean and standard deviation for each measurement.
Feature labels are read from file:
> features.txt.

Search for matches in the labels containing **mean** and **std**,
the dataset is updated with only mean and standard deviation variables.

### 3. Uses descriptive activity names to name the activities in the data set
Activity labels are read from file:
> activity_labels.txt

to name the labels with activity names: 
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING
       
### 4. Appropriately labels the data set with descriptive variable names. 
The dataset is combined with labels and subjects in the format:
> label, labelName, subject, feature variables (measurements).

The Dataset columns are named appropriately using feature labels from step 2.

### 5. From the data set in step 4, creates a second, independent tidy data 
set with the average of each variable for each activity and each subject.
The dataset is melted with ```label```, ```labelName``` and ```subject```
against the feature variables.  
Tidy dataset is created by casting the melted data to obtain the average of 
each variable for each activity and each subject.  
The final data frame is saved as ```tidy_data.txt```.
