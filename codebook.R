#!/usr/bin/env Rscript

## codebook.R
# a script to automatically get the codebook markdown file from the
# tidy dataset output of the run_analysis.R script

write("# Getting and Cleaning Data Course Project", file = "CodeBook.md")
write("", file = "CodeBook.md", append = TRUE)
write("## Study design", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("### Getting the Data", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("- Download the data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip];", file = "CodeBook.md", append = TRUE)
write("- Unzip the data into your working directory, you should see the subdirectory \"UCI HAR Dataset\"", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("### Transforming the Data", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("Please refer to the the file README.txt in the \"UCI HAR Dataset\" directory for a description of the original dataset.", file = "CodeBook.md", append = TRUE)
write("In order to get the tidy data set ready for analysis, the following transformations are applied:", file = "CodeBook.md", append = TRUE)
write("- the training and the test sets are merged to create one data set;", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("The columns of the resulting data frame are the 561 original features plus two colums which identify the subject and her activity.", file = "CodeBook.md", append = TRUE)
write("This results in a data frame where each row is the observation of a particular subject doing a particular activity.", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("- extracts only the measurements on the mean and standard deviation for each measurement. ", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("This results in a set of observations comprising 81 values: 79 feature values plus subject/activity identifiers.", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("- use descriptive activity names to name the activities in the data set", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("Meaningful names are derived from the \"activity_labels.txt\" file.", file = "CodeBook.md", append = TRUE)
write("The original column with activity labels is removed from the data frame.", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("- label the data set with descriptive variable names.", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("The labels are lower case feature variable names with parentheses removed.", file = "CodeBook.md", append = TRUE)
write("The identifier \"subject\" is used as the name of the column indentifying subjects.", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("- The final tidy independent data set is derived by taking the average of each variable for each activity and each subject.", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("This last step is particularly controversial as the given instruction gives room to multiple interpretations.", file = "CodeBook.md", append = TRUE)
write("In this case the narrow data set approach is taken:  the final \"tidy\" dataset will have a single row for each ", file = "CodeBook.md", append = TRUE)
write("unique combination of activity and subject, and many columns containing the averages for each \"signal-variable\" pair.", file = "CodeBook.md", append = TRUE)
write("Since there are 6 activities and 30 subjects, there are 180 records, assuming each subject is recorded in six activities.",file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("### Code book", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("#### Notes", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write('- each feature variable comes with a brief description and standard summary values ', file = "CodeBook.md", append = TRUE)
write("- the value of each variable in each row represents the average computed over possible combinations of subject and activity", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("#### Identifier Variables", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("- **subject** _numerical identifier for the subject performing an activity_", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("- **activity** _categorical variable with six possible states identifying the activity of each subject_ (laying, sitting, standing, walking, walking_downstairs, walking_upstairs)", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("#### Feature variables", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
dataset <- read.table("tidy_dataset.txt", header = TRUE)
for (feature in colnames(dataset)) {
  if(feature == "subject" | feature == 'activity') next
  if(grepl("^t", feature)) {
    description <- "Time domain"
  } else if(grepl("^f", feature)) {
    description <- "Frequency domain"
  }
  
  if(grepl("bodyacc", feature)) { description <- paste(description, "body acceleration", sep = " ") }
  else if(grepl("gravityacc", feature)) { description <- paste(description, "gravity acceleration", sep = " ") }
  else if(grepl("bodygyro", feature)) { description <- paste(description, "angular velocity", sep = " ") }
  
  if(grepl("jerk", feature)) { description <- paste(description, "jerk signal", sep = " ") }
  if(grepl("mag", feature)) { description <- paste(description, "magnitude", sep = " ") }
  
  if(grepl("mean", feature) && !grepl("meanfreq", feature)) { description <- paste(description, "mean value", sep = " ")}
  else if(grepl("std", feature)) { description <- paste(description, "standard deviation", sep = " ") }
  else if(grepl("meanfreq", feature)) { description <- paste(description, "weighted average", sep = " ") }
  
  if(grepl("x$", feature)) { description <- paste(description, "- x axis", sep = " ") }
  else if(grepl("y$", feature)) { description <- paste(description, "- y axis", sep = " ") }
  else if(grepl("z$", feature)) { description <- paste(description, "- z axis", sep = " ") }
  
  write(paste0('**', feature, '** _', description, '_'), file = "CodeBook.md", append = TRUE)
  write("```", file = "CodeBook.md", append = TRUE)
  capture.output(summary(dataset[[feature]]), file = "CodeBook.md", append = TRUE)
  write("```", file = "CodeBook.md", append = TRUE)
  write("", file = "CodeBook.md", append = TRUE)
}
