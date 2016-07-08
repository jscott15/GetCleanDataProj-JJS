"run_analysis.r" is an R script that prepares a dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip for further analysis.

The script first sets the working directory, loads the dplyr package, and then reads in the downloaded data. Subject and activity data columns are bound to the test and train data. Test and train data is then combined into one table. Variables are given appropriate names and all activities are renamed with more meaningful names.

A subset of data containing only mean and standard variation columns is created, and then all columns are renamed to be more readable. Means are calculated by activity and subject. Extra columns are removed and variables renamed. The resulting table, "tidy.txt", is then exported to the working directory.

Additional information is included in the associated codebook for this project.

All original data is from the following publication:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
