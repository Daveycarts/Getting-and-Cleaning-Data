#########################################################################
#  File  
#    run_analysis.R
#
#  GOAL  
#  
#  The goal is to prepare a tidy data set based on the wearable data set 
#  from the Samsung Galaxy S smartphone. 

library(dplyr)

#  Download zip file from the URL provided and unzip the files to a 
#  working folder

zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile(".Dataset.zip")
download.file(zipURL, temp, mode = "wb")

unzip(temp, exdir = "H:/Data Science Notes/Current Coursera/Getting and Cleaning Data/Week 4/Dataset")

#  View what was downloaded from the zip file

list.files("H:/Data Science Notes/Current Coursera/Getting and Cleaning Data/Week 4/Dataset")

#  View the information that exists in the UCI HAR Dataset folder

list.files("H:/Data Science Notes/Current Coursera/Getting and Cleaning Data/Week 4/Dataset/UCI HAR Dataset", recursive = TRUE)

#  Create a file path to the dataset.

PATH <- file.path("H:/Data Science Notes/Current Coursera/Getting and Cleaning Data/Week 4/Dataset", "UCI HAR Dataset")

#  MERGE DATA SETS
#
#  This section will merge the test and training sets into one data set

## bring in the training tables
X_Train <- read.table(file.path(PATH, "train", "X_train.txt"), header = FALSE)
Y_Train <- read.table(file.path(PATH, "train", "Y_train.txt"), header = FALSE)
Subject_Train <- read.table(file.path(PATH, "train", "subject_train.txt"), header = FALSE)

## bring in the testing tables
X_Test <- read.table(file.path(PATH, "test", "X_test.txt"), header = FALSE)
Y_Test <- read.table(file.path(PATH, "test", "Y_test.txt"), header = FALSE)
Subject_Test <- read.table(file.path(PATH, "test", "subject_test.txt"), header = FALSE)

## bring in the features table
Features <- read.table(file.path(PATH, "features.txt"), header = FALSE)

## bring in activities label table
Activity_Labels <- read.table(file.path(PATH, "activity_labels.txt"), header = FALSE)

#  Add column headers prior to joining the data tables

colnames(X_Train) = Features[,2]
colnames(Y_Train) = "ActivityID"
colnames(Subject_Train) = "SubjectID"
colnames(X_Test) = Features[,2]
colnames(Y_Test) = "ActivityID"
colnames(Subject_Test) = "SubjectID"
colnames(Activity_Labels) = c("ActivityID", "ActivityType")

#  Join the three training tables together, then the three testing 
#  tables together and then join the aggregated training and testing 
#  tables together

Training <- cbind(Y_Train, Subject_Train, X_Train)
Testing <- cbind(Y_Test, Subject_Test, X_Test)

Merged <- rbind(Training, Testing)

#  MEASUREMENT - MEAN and STANDARD DEVIATION
#
#  This section will extract the measurements of mean and standard 
#  deviation for each measurement.

Column_Names <- colnames(Merged)

Mean_STD_Col <- (grepl("ActivityID", Column_Names) | grepl("SubjectID", Column_Names) | grepl("mean..", Column_Names) | grepl("std..", Column_Names))

Mean_STD_Data <- Merged[, Mean_STD_Col == TRUE]

#  ADD ACTIVITY NAMES
#
#  This section will add the descriptive activity names in the mean 
#  and standard deviation data set

Activity_Labels$ActivityID <- as.character(Activity_Labels$ActivityID)
Mean_STD_Data$ActivityID <- as.character(Mean_STD_Data$ActivityID)

Mean_STD_Act_Name <- Mean_STD_Data %>%
  left_join(Activity_Labels, by = c("ActivityID" = "ActivityID")) %>%
  select(-"ActivityID")

MeanSTDColNames <- colnames(Mean_STD_Act_Name)

MeanSTDColNames <- gsub("[\\(\\)-]","",MeanSTDColNames)
MeanSTDColNames <- gsub("^f","frequencyDomain",MeanSTDColNames)
MeanSTDColNames <- gsub("^t","timeDomain",MeanSTDColNames)
MeanSTDColNames <- gsub("Acc","Accelerometer",MeanSTDColNames)
MeanSTDColNames <- gsub("Gyro","Gyroscope",MeanSTDColNames)
MeanSTDColNames <- gsub("Mag","Magnitude",MeanSTDColNames)
MeanSTDColNames <- gsub("Freq","Frequency",MeanSTDColNames)
MeanSTDColNames <- gsub("mean","Mean",MeanSTDColNames)
MeanSTDColNames <- gsub("std","StandardDeviation",MeanSTDColNames)
MeanSTDColNames <- gsub("BodyBody","Body",MeanSTDColNames)

colnames(Mean_STD_Act_Name) <- MeanSTDColNames

# CREATE NEW TIDY SET

MeanSummary <- Mean_STD_Act_Name %>%
  group_by(SubjectID, ActivityType) %>%
  summarise(across(.cols = everything(), .fns = mean))

write.table(MeanSummary, "H:/Data Science Notes/Current Coursera/Getting and Cleaning Data/Week 4/tidy_data.txt", row.names = FALSE, quote = FALSE )
