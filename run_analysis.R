library(dplyr)

## Set working directory
setwd("C:/Users/solot/Downloads/gcd-data/UCI HAR Dataset")

## Read in the observations for the test subjects
testVals <- read.delim("test/X_test.txt",header = FALSE, sep = "")

## Read in the observations for the training subjects
trainVals <- read.delim("train/X_train.txt", header = FALSE, sep = "")

## Read in the test participant id 
testSubjects <- read.table("test/subject_test.txt")$V1

## Read in the training participant id
trainSubjects <- read.table("train/subject_train.txt")$V1

## Read in the activities for the test subjects
testActivities <- read.table("test/y_test.txt")$V1

## Read in the activities for the training subjects
trainActivities <- read.table("train/y_train.txt")$V1

## Read in the activity labels from activity_labels.txt
actLabels <- read.delim("activity_labels.txt", header = FALSE, sep = "")

## Change the activity into a factor using the labels from the previous step
testActivities <- factor(testActivities, actLabels$V1, actLabels$V2)
trainActivities <- factor(trainActivities, actLabels$V1, actLabels$V2)

## Read in the feature names for the column headers
features <- read.delim("features.txt", header = FALSE, sep = "")

## Set the column names for both training and test data frames
names(testVals) <- features$V2
names(trainVals) <- features$V2

## Create a subject variable in the data frames
testVals$subject <- testSubjects
trainVals$subject <- trainSubjects

## Create an activity variable in the data frames
testVals$activity <- testActivities
trainVals$activity <- trainActivities

## Merge the test and training data frames
allVals <- rbind(testVals, trainVals)

## Subset out the columns we need
allVals <- allVals[, (grepl("-mean\\(\\)", names(allVals))) | grepl("-std\\(\\)", names(allVals)) | names(allVals) %in% c("subject", "activity")]

## Clean up a bit
remove(trainVals)
remove(testVals)

## Tidy it up
tidy <- aggregate(allVals, list(subject = allVals$subject, activity = allVals$activity), FUN = "mean", drop = TRUE)[,-c(69,70)]
