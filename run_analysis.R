#!/usr/bin/env Rscript

## run_analysis.R
# A script to automatically produce a tidy dataset from
# data collected from the accelerometers from the Samsung 
# Galaxy S smartphone.

## assume Samsung data is in working directory
data_dir <- "UCI HAR Dataset"

## 1. Merge the training and the test sets to create one data set

# for the training/test sets, create a data frame with the data 
# set, labels and subject identifier paste together

data_set <- read.table(sprintf("%s/train/X_train.txt", data_dir))
training_labels <- read.table(sprintf("%s/train/y_train.txt", data_dir))
training_subjects <- read.table(sprintf("%s/train/subject_train.txt", data_dir))

data_set <- cbind(data_set, training_subjects, training_labels)
rm(training_labels, training_subjects) # some cleaning, not needed

test_set <- read.table(sprintf("%s/test/X_test.txt", data_dir))
test_labels <- read.table(sprintf("%s/test/y_test.txt", data_dir))
test_subjects <- read.table(sprintf("%s/test/subject_test.txt", data_dir))

# append test set with features/subjects/labels
data_set <- rbind(data_set, cbind(test_set, test_subjects, test_labels))

# remove uneeded objects
rm(test_set, test_labels, test_subjects)

## 2. Extract only the measurements on the mean and standard deviation for each measurement

# Read the file with the descriptions of the input features
feature_names <- read.table(sprintf("%s/features.txt", data_dir), sep = " ")

# get the data frame with only the mean/std measurements, plus
# subject index and output label
data_set <- data_set[, c(grep("mean|std", feature_names[,2]), 562, 563)]

## 3. Use descriptive activity names to name the activities in the data set

# read-in index-activity mappings
activities <- read.table(sprintf("%s/activity_labels.txt", data_dir), sep = " ")

# get the vector of lower case activity labels
activities <- tolower(activities[,2])

# add a column of descriptive activity names and remove
# the column of activity numbers
data_set$activity <- as.factor(activities[data_set[,ncol(data_set)]])
data_set[,ncol(data_set)-1] <- NULL

## 4. Appropriately labels the data set with descriptive variable names.

# use lower case feature variable names with parentheses removed, use "subject"
# as column name indentifying subjects
names(data_set)[1:ncol(data_set)-1] <- c(gsub("[()]", "", tolower(feature_names[,2][grep("mean|std", feature_names[,2])])), "subject")
# replace '-' with '_' as reading the data from file would produce '.' 
names(data_set) <- gsub("-","_", names(data_set))
                        
## 5. From the data set in step 4, creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject.

# group data by subject-activity
subject_activity_split <- split(data_set, list(data_set$subject, data_set$activity))

# compute average for each feature in each individual group
# NOTE: saaply returns a matrix with rows corresponding to the features, hence the transpose
# and explicit coercion to data frame
tidy_data_set <- as.data.frame(t(sapply(subject_activity_split, function(x) colMeans(x[,1:79]))))

## 6. Write down the tidy data set to file with name "tidy_dataset.txt"
write.table(tidy_data_set, file="tidy_dataset.txt", row.names=FALSE)
