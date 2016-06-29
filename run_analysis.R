# set working directory
#setwd("C:/Users/JohnSc/Google Drive/R_Data/fitData")
setwd("C:/Users/johnj/Google Drive/R_Data/fitData")

# load packages
library(dplyr)

# read in data sets
test <- read.table("X_test.txt")
train <- read.table("X_train.txt")
actLabels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
subTest <- read.table("subject_test.txt")
subTrain <- read.table("subject_train.txt")
actTest <- read.table("y_test.txt")
actTrain <- read.table("y_train.txt")

# add subject and activity data to test and train data
test <- bind_cols(actTest, test)
train <- bind_cols(actTrain, train)
test <- bind_cols(subTest, test)
train <- bind_cols(subTrain, train)

# combine test and train, and name variables and activities
testTrain <- rbind(test, train)
names(testTrain) <- c("subject", "activity", as.character(t(features[,2])))
testTrain$activity[testTrain$activity == 1] <- "walking"
testTrain$activity[testTrain$activity == 2] <- "walking_upstairs"
testTrain$activity[testTrain$activity == 3] <- "walking_downstairs"
testTrain$activity[testTrain$activity == 4] <- "sitting"
testTrain$activity[testTrain$activity == 5] <- "standing"
testTrain$activity[testTrain$activity == 6] <- "laying"

#subset mean and standard deviation data
tempmeanstd <- testTrain[grepl("(subject)|(activity)|(mean())|(std)", names(testTrain))]
meanstd <- tempmeanstd[, -grep("Freq", colnames(tempmeanstd))]

#rename columns
names(meanstd) <- gsub("tBody", "TimeBody", names(meanstd))
names(meanstd) <- gsub("tGravity", "TimeGravity", names(meanstd))
names(meanstd) <- gsub("fBody", "FreqBody", names(meanstd))
names(meanstd) <- gsub("fGravity", "FreqGravity", names(meanstd))
names(meanstd) <- gsub("-mean()-", "Mean", names(meanstd), fixed = TRUE)
names(meanstd) <- gsub("-std()-", "Std", names(meanstd), fixed = TRUE)
names(meanstd) <- gsub("-mean()", "Mean", names(meanstd), fixed = TRUE)
names(meanstd) <- gsub("-std()", "Std", names(meanstd), fixed = TRUE)

# Calculate means by activity and subject
# This works, but generates two extra columns, so then have to delete and rename columns. Help on this is appreciated!
# Also, generates error messages, but I get the desired results. Any help?
aggdata = aggregate(meanstd,by=list(meanstd$activity, meanstd$subject),mean)
finaldata <- aggdata[,-c(3,4)]
names(finaldata)[1] <- "activity"
names(finaldata)[2] <- "subject"

# Write final tidy data to a .txt file
write.table(finaldata, "tidy.txt", row.names = FALSE, quote = FALSE)
