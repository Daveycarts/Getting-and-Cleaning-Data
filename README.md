# Getting and Cleaning Data Course Project

One of the most exciting areas in all of data science right now is
wearable computing. Companies like Fitbit, Nike, and Jawbone Up are
racing to develop the most advanced algorithms to attract new users. The
data linked to from the course website represent data collected from the
accelerometers from the Samsung Galaxy S smartphone.

A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The purpose of this project is to demonstrate your ability to collect,
work with, and clean a data set. The goal is to prepare tidy data that
can be used for later analyses.

This repository contains the following files:

-   README.md - provides an overview of the data set and how it was
    created
-   run\_analysis.R - the script used create the summarized data set
-   tidy\_data.txt - an independent tidy data set with the average of
    each variable for each activity and each subject
-   CodeBook.md - describes the variables, the data, and data
    transformations performed to clean up the data

## Data Set Information

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

## Script Overview

The data for the project can be found here:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The script used, retrieves the data in the above zip file, unzips the
file and stores the data to a local drive. The test and training data
sets were merged into one data table. Only measurement data containing
mean and standard deviation information was kept.

A separate file was created, tidy\_data.txt, which is an independent
tidy data set with the average of each variable for each activity and
each subject.

The dplyr package, version 1.0.7, was used in the script.

RStudio version 1.4.1106 “Tiger Daylily” (2389bc24, 2021-02-11) for
Windows Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36
(KHTML, like Gecko) QtWebEngine/5.12.8 Chrome/69.0.3497.128
Safari/537.36 was used to create the script.
