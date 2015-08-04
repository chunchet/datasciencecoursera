## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Pre-requisition
# check for required packages
install.required.package <- function(pkg) {
	if(!pkg %in% rownames(installed.packages())) {
		install.packages(need, dependencies = TRUE, quietly = T)
	}
}

packages <- c("data.table", "reshape2")
lapply(packages, install.required.package)
sapply(packages, suppressPackageStartupMessages(require),
	character.only = TRUE)

## 1. Merges the training and the test sets to create one data set
# read data
train.label	<- read.table("UCI\ HAR\ Dataset/train/y_train.txt")
train.subject	<- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
train.data	<- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
test.label	<- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
test.subject	<- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
test.data	<- read.table("UCI\ HAR\ Dataset/test/X_test.txt")

# bind the training & test data in the format: label, subject, data
data <- rbind(train.data, test.data)

## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement. 
feature.label <- read.table("UCI\ HAR\ Dataset/features.txt", 
			stringsAsFactors=F)
idx.meanstd <- grep("mean|std", feature.label[, 2])
data <- data[, idx.meanstd]

## 3. Uses descriptive activity names to name the activities in the data set
activity.label <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")
data.label <- rbind(train.label, test.label)
data.label$labelName = activity.label[data.label[, 1], 2]

## 4. Appropriately labels the data set with descriptive variable names.
data <- cbind(data.label, rbind(train.subject, test.subject), data)
label.id <- c("label", "labelName", "subject")
names(data) <- c(label.id, feature.label[idx.meanstd, 2])

## 5. Creates a second, independent tidy data set with 
##    the average of each variable for each activity and each subject.
melt.data <- melt(data, id=label.id, measure.vars=feature.label[idx.meanstd, 2])
tidy.data <- dcast(melt.data, labelName + subject ~ variable, mean)

write.table(tidy.data, file = "./UCI\ HAR\ Dataset/tidy_data.txt")
