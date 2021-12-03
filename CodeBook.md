# Code Book for Getting and Cleaning Data Course Project

## Data Source

The dataset was obtained from Human Activity Recognition Using
Smartphones and was collected from the accelerometers from the Galaxy
Samsung S smartphone. The data for the project can be found here:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## Dataset - Used in run\_analysis.R script

The following datasets are included in the zip file above

-   README.txt
-   features\_info.txt
    -   Shows information about the variables used on the feature
        vector.
-   features.txt
    -   List of all features.
-   activity\_labels.txt
    -   Links the class labels with their activity name.
-   train/X\_train.txt
    -   Training set.
-   train/y\_train.txt
    -   Training labels.
-   train/subject\_train.txt
    -   The subject who performed the activity for each window sample.
-   test/X\_test.txt
    -   Test set.
-   test/y\_test.txt
    -   Test labels.
-   test/subject\_test.txt
    -   The subject who performed the activity for each window sample

## Dataset Variables

Six activities were measured 1. Walking 2. Walking Upstairs 3. Walking
Downstairs 4. Sitting 5. Standing 6. Laying

Each record has the following \* Triaxial acceleration from the
accelerometer (total acceleration) and the estimated body acceleration.
\* Triaxial Angular velocity from the gyroscope. \* A 561-feature vector
with time and frequency domain variables. \* Its activity label. \* An
identifier of the subject who carried out the experiment.

## Data Transformation

The training datasets and test datasets were merged together to created
on dataset.

Only the measurements pertaining to mean and standard deviation were
kept in the creation of tidy\_data.txt. All other measurements were
removed.

Descriptive activity names were added to the final dataset.

Column names were changed from abbreviations to words. Freq was changed
to Frequency, as an example.

All records were summarized by grouping subject ID and activity name,
taking the mean of each measurement pertaining to mean and standard
deviation.
