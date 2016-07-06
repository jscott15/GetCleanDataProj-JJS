"Final project for Coursera Getting and Cleaning Data course
You should include a README.md in the repo describing how the script works and the code book describing the variables."

"run_analysis.r" is an R script that prepares a dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip for further analysis.

The script first sets the working directory, loads the dplyr package, and then reads in the downloaded data. Subject and activity data columns are bound to the test and train data. Test and train data is then combined into one table. Variables are given appropriate names and all activities are renamed with more meaningful names.

A subset of data containing only mean and standard variation columns is created, and then all columns are renamed to be more readable. Means are calculated by activity and subject. Extra columns are removed and variables renamed. The resulting table, "tidy.txt", is then exported to the working directory.

Additional information is included in the associated codebook for this project.
