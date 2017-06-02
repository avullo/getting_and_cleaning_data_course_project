#!/usr/bin/env Rscript

## codebook.R
# a script to automatically get the codebook markdown file from the
# tidy dataset output of the run_analysis.R script

write("# CodeBook", file = "CodeBook.md")
write("", file = "CodeBook.md", append = TRUE)
write("## Getting and Cleaning Data Course Project", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("### Notes", file = "CodeBook.md", append = TRUE)
write('- each variable comes with a brief description and standard summary values', file = "CodeBook.md", append = TRUE)
write("- the value of each variable in each row represents the average computed over possible combinations of subject and activity", file = "CodeBook.md", append = TRUE)
write('- please refer to the README.md file for a more involved description', file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)
write("### Variables", file = "CodeBook.md", append = TRUE)
write("", file = "CodeBook.md", append = TRUE)

dataset <- read.table("tidy_dataset.txt", header = TRUE)
for (feature in colnames(dataset)) {
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
