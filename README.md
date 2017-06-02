# Course Project

## Getting and Cleaning Data Course

## Content

### README.md
You're reading it.

### run_analysis.R

#### Description

A script to automatically transform data collected from the accelerometers from the Samsung Galaxy S smartphone
into a tidy dataset. Please read CodeBook.md for a description of the variables, the data, and any transformations
performed to clean up the data.

#### Usage

The script assumes a directory called "UCI HAR Dataset" with the Samsung data is in the working directory. This is how
to run the script

```
Rscript run_analysis.R
```

#### Output
Running the script produces a file called "tidy_dataset.txt" which, as the name implies, represents the tidy dataset
obtained from the original data using the transformations described in the code book.

### CodeBook.md
The code book for this project.

### codebook.R

#### Description

A script which automatically format (markdown) and dump the code book content in the CodeBook.md file. It assumes
the tidy data set file has been produced by running the run_analysis.R script and is present in the working directory.

#### Usage

```
Rscript codebook.R
```

#### Output
The file CodeBook.md.