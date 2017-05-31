#!/usr/bin/env Rscript

## run_analysis.R

## assume Samsung data is in working directory
data_dir <- "UCI HAR Dataset"

## 1. Merge the training and the test sets to create one data set

# For the training/test sets, create a data frame with the data 
# set, labels and subject identifier paste together

data_set <- read.table(sprintf("%s/train/X_train.txt", data_dir))
training_labels <- read.table(sprintf("%s/train/y_train.txt", data_dir))
training_subjects <- read.table(sprintf("%s/train/subject_train.txt", data_dir))

data_set <- cbind(data_set, training_subjects, training_labels)
rm(training_labels, training_subjects) # some cleaning, not needed

test_set <- read.table(sprintf("%s/test/X_test.txt", data_dir))
test_labels <- read.table(sprintf("%s/test/y_test.txt", data_dir))
test_subjects <- read.table(sprintf("%s/test/subject_test.txt", data_dir))

# Append test set with features/subjects/labels
data_set <- rbind(data_set, cbind(test_set, test_subjects, test_labels))

rm(test_set, test_labels, test_subjects)

## 2. Extract only the measurements on the mean and standard deviation for each measurement
# Read the file with the descriptions of the input features
feature_names <- read.table(sprintf("%s/features.txt", data_dir), sep = " ")

# Return the data frame with only the mean/std measurements, plus
# subject index and output label
data_set <- data_set[, c(grep("mean|std", feature_names[,2]), 562, 563)]

## 3. Use descriptive activity names to name the activities in the data set
activities <- read.table(sprintf("%s/activity_labels.txt", data_dir), sep = " ")

# Get the vector of lower case activity labels
activities <- tolower(activities[,2])

# Add a column of descriptive activity names
data_set$activity <- as.factor(activities[data_set[,ncol(data_set)]])

## 4. Appropriately labels the data set with descriptive variable names. 
names(data_set)[1:ncol(data_set)-1] <- c(gsub("[()]", "", tolower(feature_names[,2][grep("mean|std", feature_names[,2])])), "subject", "activitylabel")



# write.table(data_set, file="dataset.csv", row.names=FALSE)
