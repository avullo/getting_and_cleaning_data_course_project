## run_analysis.R
##  


## merge_data_sets
## Merges the training and the test sets to create one data set

merge_data_sets <- function(directory) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the 'activity_labels.txt file which
  ## maps numeric indices to activity names
  
  ## For the training/test sets, create a data frame with the data 
  ## set, labels and subject identifier paste together
  
  data_set <- read.table(sprintf("%s/train/X_train.txt", directory))
  training_labels <- read.table(sprintf("%s/train/y_train.txt", directory))
  training_subjects <- read.table(sprintf("%s/train/subject_train.txt", directory))
 
  data_set <- cbind(data_set, training_subjects, training_labels)
  rm(training_labels, training_subjects) # some cleaning, not needed
  
  test_set <- read.table(sprintf("%s/test/X_test.txt", directory))
  test_labels <- read.table(sprintf("%s/test/y_test.txt", directory))
  test_subjects <- read.table(sprintf("%s/test/subject_test.txt", directory))
  
  ## Append test set with features/subjects/labels
  data_set <- rbind(data_set, cbind(test_set, test_subjects, test_labels))
  
  data_set
}

## filter_measurements
## For the merged data set obtained in step 1, extracts only the measurements on 
## the mean and standard deviation for each measurement

filter_measurements <- function(data, directory) {
  ## 'data' is the data frame obtained by merging the training and test
  ## set together
  
  ## 'directory' is is a character vector of length 1 indicating
  ## the location of the 'features.txt' file which maps numeric
  ## indices to the names of the features in the input vector
  
  ## Read the file with the descriptions of the input features
  feature_names <- read.table(sprintf("%s/features.txt"), sep = " ")
  
  ## Return the data frame with only the mean/std measurements, plus
  ## subject index and output label
  data[, c(grep("mean|std", feature_names[,2]), 562, 563)]
}

## get_activity_names
## Return a vector of descriptive activity names (lower case)

get_activity_names <- function(directory) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the 'activity_labels.txt file which
  ## maps numeric indices to activity names

  ## Read files with activity labels
  activities <- read.table(sprintf("%s/activity_labels.txt", directory), sep = " ")
  
  ## Return a vector of lower case activity labels
  tolower(activities[,2])
}

## 