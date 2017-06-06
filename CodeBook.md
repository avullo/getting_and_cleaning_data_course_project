# Getting and Cleaning Data Course Project

## Study design

### Getting the Data

- Download the data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip];
- Unzip the data into your working directory, you should see the subdirectory "UCI HAR Dataset"

### Transforming the Data

Please refer to the the file README.txt in the "UCI HAR Dataset" directory for a description of the original dataset.
In order to get the tidy data set ready for analysis, the following transformations are applied:
- the training and the test sets are merged to create one data set;

The columns of the resulting data frame are the 561 original features plus two colums which identify the subject and her activity.
This results in a data frame where each row is the observation of a particular subject doing a particular activity.

- extracts only the measurements on the mean and standard deviation for each measurement. 

This results in a set of observations comprising 81 values: 79 feature values plus subject/activity identifiers.

- use descriptive activity names to name the activities in the data set

Meaningful names are derived from the "activity_labels.txt" file.
The original column with activity labels is removed from the data frame.

- label the data set with descriptive variable names.

The labels are lower case feature variable names with parentheses removed.
The identifier "subject" is used as the name of the column indentifying subjects.

- The final tidy independent data set is derived by taking the average of each variable for each activity and each subject.

This last step is particularly controversial as the given instruction gives room to multiple interpretations.
In this case the narrow data set approach is taken:  the final "tidy" dataset will have a single row for each 
unique combination of activity and subject, and many columns containing the averages for each "signal-variable" pair.
Since there are 6 activities and 30 subjects, there are 180 records, assuming each subject is recorded in six activities.

### Code book

#### Notes

- each feature variable comes with a brief description and standard summary values 
- the value of each variable in each row represents the average computed over possible combinations of subject and activity

#### Identifier Variables

- **subject** _numerical identifier for the subject performing an activity_

- **activity** _categorical variable with six possible states identifying the activity of each subject_ (laying, sitting, standing, walking, walking_downstairs, walking_upstairs)

#### Feature variables

**tbodyacc_mean_x** _Time domain body acceleration mean value - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.2216  0.2712  0.2770  0.2743  0.2800  0.3015 
```

**tbodyacc_mean_y** _Time domain body acceleration mean value - y axis_
```
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-0.040510 -0.020020 -0.017260 -0.017880 -0.014940 -0.001308 
```

**tbodyacc_mean_z** _Time domain body acceleration mean value - z axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.15250 -0.11210 -0.10820 -0.10920 -0.10440 -0.07538 
```

**tbodyacc_std_x** _Time domain body acceleration standard deviation - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9961 -0.9799 -0.7526 -0.5577 -0.1984  0.6269 
```

**tbodyacc_std_y** _Time domain body acceleration standard deviation - y axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.99020 -0.94210 -0.50900 -0.46050 -0.03077  0.61690 
```

**tbodyacc_std_z** _Time domain body acceleration standard deviation - z axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9877 -0.9498 -0.6518 -0.5756 -0.2306  0.6090 
```

**tgravityacc_mean_x** _Time domain gravity acceleration mean value - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.6800  0.8376  0.9208  0.6975  0.9425  0.9745 
```

**tgravityacc_mean_y** _Time domain gravity acceleration mean value - y axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.47990 -0.23320 -0.12780 -0.01621  0.08773  0.95660 
```

**tgravityacc_mean_z** _Time domain gravity acceleration mean value - z axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.49510 -0.11730  0.02384  0.07413  0.14950  0.95790 
```

**tgravityacc_std_x** _Time domain gravity acceleration standard deviation - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9968 -0.9825 -0.9695 -0.9638 -0.9509 -0.8296 
```

**tgravityacc_std_y** _Time domain gravity acceleration standard deviation - y axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9942 -0.9711 -0.9590 -0.9524 -0.9370 -0.6436 
```

**tgravityacc_std_z** _Time domain gravity acceleration standard deviation - z axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9910 -0.9605 -0.9450 -0.9364 -0.9180 -0.6102 
```

**tbodyaccjerk_mean_x** _Time domain body acceleration jerk signal mean value - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
0.04269 0.07396 0.07640 0.07947 0.08330 0.13020 
```

**tbodyaccjerk_mean_y** _Time domain body acceleration jerk signal mean value - y axis_
```
      Min.    1st Qu.     Median       Mean    3rd Qu.       Max. 
-0.0386900  0.0004664  0.0094700  0.0075650  0.0134000  0.0568200 
```

**tbodyaccjerk_mean_z** _Time domain body acceleration jerk signal mean value - z axis_
```
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-0.067460 -0.010600 -0.003861 -0.004953  0.001958  0.038050 
```

**tbodyaccjerk_std_x** _Time domain body acceleration jerk signal standard deviation - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9946 -0.9832 -0.8104 -0.5949 -0.2233  0.5443 
```

**tbodyaccjerk_std_y** _Time domain body acceleration jerk signal standard deviation - y axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9895 -0.9724 -0.7756 -0.5654 -0.1483  0.3553 
```

**tbodyaccjerk_std_z** _Time domain body acceleration jerk signal standard deviation - z axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.99330 -0.98270 -0.88370 -0.73600 -0.51210  0.03102 
```

**tbodygyro_mean_x** _Time domain angular velocity mean value - x axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.20580 -0.04712 -0.02871 -0.03244 -0.01676  0.19270 
```

**tbodygyro_mean_y** _Time domain angular velocity mean value - y axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.20420 -0.08955 -0.07318 -0.07426 -0.06113  0.02747 
```

**tbodygyro_mean_z** _Time domain angular velocity mean value - z axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.07245  0.07475  0.08512  0.08744  0.10180  0.17910 
```

**tbodygyro_std_x** _Time domain angular velocity standard deviation - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9943 -0.9735 -0.7890 -0.6916 -0.4414  0.2677 
```

**tbodygyro_std_y** _Time domain angular velocity standard deviation - y axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9942 -0.9629 -0.8017 -0.6533 -0.4196  0.4765 
```

**tbodygyro_std_z** _Time domain angular velocity standard deviation - z axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9855 -0.9609 -0.8010 -0.6164 -0.3106  0.5649 
```

**tbodygyrojerk_mean_x** _Time domain angular velocity jerk signal mean value - x axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.15720 -0.10320 -0.09868 -0.09606 -0.09110 -0.02209 
```

**tbodygyrojerk_mean_y** _Time domain angular velocity jerk signal mean value - y axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.07681 -0.04552 -0.04112 -0.04269 -0.03842 -0.01320 
```

**tbodygyrojerk_mean_z** _Time domain angular velocity jerk signal mean value - z axis_
```
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-0.092500 -0.061720 -0.053430 -0.054800 -0.048980 -0.006941 
```

**tbodygyrojerk_std_x** _Time domain angular velocity jerk signal standard deviation - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9965 -0.9800 -0.8396 -0.7036 -0.4629  0.1791 
```

**tbodygyrojerk_std_y** _Time domain angular velocity jerk signal standard deviation - y axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9971 -0.9832 -0.8942 -0.7636 -0.5861  0.2959 
```

**tbodygyrojerk_std_z** _Time domain angular velocity jerk signal standard deviation - z axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9954 -0.9848 -0.8610 -0.7096 -0.4741  0.1932 
```

**tbodyaccmag_mean** _Time domain body acceleration magnitude mean value_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9865 -0.9573 -0.4829 -0.4973 -0.0919  0.6446 
```

**tbodyaccmag_std** _Time domain body acceleration magnitude standard deviation_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9865 -0.9430 -0.6074 -0.5439 -0.2090  0.4284 
```

**tgravityaccmag_mean** _Time domain gravity acceleration magnitude mean value_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9865 -0.9573 -0.4829 -0.4973 -0.0919  0.6446 
```

**tgravityaccmag_std** _Time domain gravity acceleration magnitude standard deviation_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9865 -0.9430 -0.6074 -0.5439 -0.2090  0.4284 
```

**tbodyaccjerkmag_mean** _Time domain body acceleration jerk signal magnitude mean value_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9928 -0.9807 -0.8168 -0.6079 -0.2456  0.4345 
```

**tbodyaccjerkmag_std** _Time domain body acceleration jerk signal magnitude standard deviation_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9946 -0.9765 -0.8014 -0.5842 -0.2173  0.4506 
```

**tbodygyromag_mean** _Time domain angular velocity magnitude mean value_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9807 -0.9461 -0.6551 -0.5652 -0.2159  0.4180 
```

**tbodygyromag_std** _Time domain angular velocity magnitude standard deviation_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9814 -0.9476 -0.7420 -0.6304 -0.3602  0.3000 
```

**tbodygyrojerkmag_mean** _Time domain angular velocity jerk signal magnitude mean value_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.99730 -0.98520 -0.86480 -0.73640 -0.51190  0.08758 
```

**tbodygyrojerkmag_std** _Time domain angular velocity jerk signal magnitude standard deviation_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9977 -0.9805 -0.8809 -0.7550 -0.5767  0.2502 
```

**fbodyacc_mean_x** _Frequency domain body acceleration mean value - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9952 -0.9787 -0.7691 -0.5758 -0.2174  0.5370 
```

**fbodyacc_mean_y** _Frequency domain body acceleration mean value - y axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.98900 -0.95360 -0.59500 -0.48870 -0.06341  0.52420 
```

**fbodyacc_mean_z** _Frequency domain body acceleration mean value - z axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9895 -0.9619 -0.7236 -0.6297 -0.3183  0.2807 
```

**fbodyacc_std_x** _Frequency domain body acceleration standard deviation - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9966 -0.9820 -0.7470 -0.5522 -0.1966  0.6585 
```

**fbodyacc_std_y** _Frequency domain body acceleration standard deviation - y axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.99070 -0.94040 -0.51340 -0.48150 -0.07913  0.56020 
```

**fbodyacc_std_z** _Frequency domain body acceleration standard deviation - z axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9872 -0.9459 -0.6441 -0.5824 -0.2655  0.6871 
```

**fbodyacc_meanfreq_x** _Frequency domain body acceleration weighted average - x axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.63590 -0.39170 -0.25730 -0.23230 -0.06105  0.15910 
```

**fbodyacc_meanfreq_y** _Frequency domain body acceleration weighted average - y axis_
```
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-0.379500 -0.081310  0.007855  0.011530  0.086280  0.466500 
```

**fbodyacc_meanfreq_z** _Frequency domain body acceleration weighted average - z axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.52010 -0.03629  0.06582  0.04372  0.17540  0.40250 
```

**fbodyaccjerk_mean_x** _Frequency domain body acceleration jerk signal mean value - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9946 -0.9828 -0.8126 -0.6139 -0.2820  0.4743 
```

**fbodyaccjerk_mean_y** _Frequency domain body acceleration jerk signal mean value - y axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9894 -0.9725 -0.7817 -0.5882 -0.1963  0.2767 
```

**fbodyaccjerk_mean_z** _Frequency domain body acceleration jerk signal mean value - z axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9920 -0.9796 -0.8707 -0.7144 -0.4697  0.1578 
```

**fbodyaccjerk_std_x** _Frequency domain body acceleration jerk signal standard deviation - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9951 -0.9847 -0.8254 -0.6121 -0.2475  0.4768 
```

**fbodyaccjerk_std_y** _Frequency domain body acceleration jerk signal standard deviation - y axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9905 -0.9737 -0.7852 -0.5707 -0.1685  0.3498 
```

**fbodyaccjerk_std_z** _Frequency domain body acceleration jerk signal standard deviation - z axis_
```
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-0.993100 -0.983700 -0.895100 -0.756500 -0.543800 -0.006236 
```

**fbodyaccjerk_meanfreq_x** _Frequency domain body acceleration jerk signal weighted average - x axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.57600 -0.28970 -0.06091 -0.06910  0.17660  0.33140 
```

**fbodyaccjerk_meanfreq_y** _Frequency domain body acceleration jerk signal weighted average - y axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.60200 -0.39750 -0.23210 -0.22810 -0.04721  0.19570 
```

**fbodyaccjerk_meanfreq_z** _Frequency domain body acceleration jerk signal weighted average - z axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.62760 -0.30870 -0.09187 -0.13760  0.03858  0.23010 
```

**fbodygyro_mean_x** _Frequency domain angular velocity mean value - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9931 -0.9697 -0.7300 -0.6367 -0.3387  0.4750 
```

**fbodygyro_mean_y** _Frequency domain angular velocity mean value - y axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9940 -0.9700 -0.8141 -0.6767 -0.4458  0.3288 
```

**fbodygyro_mean_z** _Frequency domain angular velocity mean value - z axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9860 -0.9624 -0.7909 -0.6044 -0.2635  0.4924 
```

**fbodygyro_std_x** _Frequency domain angular velocity standard deviation - x axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9947 -0.9750 -0.8086 -0.7110 -0.4813  0.1966 
```

**fbodygyro_std_y** _Frequency domain angular velocity standard deviation - y axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9944 -0.9602 -0.7964 -0.6454 -0.4154  0.6462 
```

**fbodygyro_std_z** _Frequency domain angular velocity standard deviation - z axis_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9867 -0.9643 -0.8224 -0.6577 -0.3916  0.5225 
```

**fbodygyro_meanfreq_x** _Frequency domain angular velocity weighted average - x axis_
```
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-0.395800 -0.213400 -0.115500 -0.104600  0.002655  0.249200 
```

**fbodygyro_meanfreq_y** _Frequency domain angular velocity weighted average - y axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.66680 -0.29430 -0.15790 -0.16740 -0.04269  0.27310 
```

**fbodygyro_meanfreq_z** _Frequency domain angular velocity weighted average - z axis_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.50750 -0.15480 -0.05081 -0.05718  0.04152  0.37710 
```

**fbodyaccmag_mean** _Frequency domain body acceleration magnitude mean value_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9868 -0.9560 -0.6703 -0.5365 -0.1622  0.5866 
```

**fbodyaccmag_std** _Frequency domain body acceleration magnitude standard deviation_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9876 -0.9452 -0.6513 -0.6210 -0.3654  0.1787 
```

**fbodyaccmag_meanfreq** _Frequency domain body acceleration magnitude weighted average_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.31230 -0.01475  0.08132  0.07613  0.17440  0.43580 
```

**fbodybodyaccjerkmag_mean** _Frequency domain body acceleration jerk signal magnitude mean value_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9940 -0.9770 -0.7940 -0.5756 -0.1872  0.5384 
```

**fbodybodyaccjerkmag_std** _Frequency domain body acceleration jerk signal magnitude standard deviation_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9944 -0.9752 -0.8126 -0.5992 -0.2668  0.3163 
```

**fbodybodyaccjerkmag_meanfreq** _Frequency domain body acceleration jerk signal magnitude weighted average_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.12520  0.04527  0.17200  0.16250  0.27590  0.48810 
```

**fbodybodygyromag_mean** _Frequency domain angular velocity magnitude mean value_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9865 -0.9616 -0.7657 -0.6671 -0.4087  0.2040 
```

**fbodybodygyromag_std** _Frequency domain angular velocity magnitude standard deviation_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9815 -0.9488 -0.7727 -0.6723 -0.4277  0.2367 
```

**fbodybodygyromag_meanfreq** _Frequency domain angular velocity magnitude weighted average_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.45660 -0.16950 -0.05352 -0.03603  0.08228  0.40950 
```

**fbodybodygyrojerkmag_mean** _Frequency domain angular velocity jerk signal magnitude mean value_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9976 -0.9813 -0.8779 -0.7564 -0.5831  0.1466 
```

**fbodybodygyrojerkmag_std** _Frequency domain angular velocity jerk signal magnitude standard deviation_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.9976 -0.9802 -0.8941 -0.7715 -0.6081  0.2878 
```

**fbodybodygyrojerkmag_meanfreq** _Frequency domain angular velocity jerk signal magnitude weighted average_
```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.18290  0.05423  0.11160  0.12590  0.20810  0.42630 
```

**subject** _Frequency domain angular velocity jerk signal magnitude weighted average_
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    1.0     8.0    15.5    15.5    23.0    30.0 
```

**activity** _Frequency domain angular velocity jerk signal magnitude weighted average - y axis_
```
            laying            sitting           standing            walking 
                30                 30                 30                 30 
walking_downstairs   walking_upstairs 
                30                 30 
```

