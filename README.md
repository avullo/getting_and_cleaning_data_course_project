# Course Project

## Getting and Cleaning Data Course

The goal of this project is to prepare tidy data that can be used for later analyses. The data is obtained by processing and transforming data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

Please refer to the file CodeBook.md on information on how to get this data.

## Content

This repo includes the following scripts and data files:

### run_analysis.R

#### Description

A script to automatically transform data collected from the accelerometers from the Samsung Galaxy S smartphone
into a tidy dataset. Please read CodeBook.md for a description of the variables, the data, and any transformations
performed to clean up the data.

For more information about the data used, please refer to [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones].

#### Usage

The script assumes a directory called "UCI HAR Dataset" with the Samsung data is in the working directory. This is how
to run the script:

```
Rscript run_analysis.R
```

#### Output

Running the script produces a file called "tidy_dataset.txt" which, as the name implies, represents the tidy dataset
obtained from the original data using the transformations described in the code book.

### CodeBook.md

The code book for this project. Contains a description of the transformations applied to the original data set and the set of variables in the trasformed data set.

### tidy_dataset.txt

The tidy dataset as a result of the application of the run_analysis.R script to the original data.

### codebook.R

#### Description

A script which automatically format (markdown) and dump the code book content in the CodeBook.md file. It assumes
the tidy data set file has been produced by running the run_analysis.R script and is present in the working directory.

#### Notes

This is not part of the assignment but I've found it particularly handy since it's dealing with dumping the description of lots of variables automatically.
It's included here for completness.

#### Usage

```
Rscript codebook.R
```

#### Output
The file CodeBook.md.