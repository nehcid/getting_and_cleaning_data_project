# Data Processing Procedures

The R script, `run_analysis.R`, works as follows:

1. Load the training and test datasets
2. Load subjects, activity labels and features for both training and test datasets
3. merge taining and test datasets, subjects and activity labels
4. name all columns using features
5. columnbind dataset, sujects and activity labels
6. Extract mean and standard deviation for each measurement
7. Convert activity to factor using descriptive activity names
8. Rename the data set columns with descriptive variable names
9. Calculate the average of each variable for each activity and each subject and write the tidy data to file.

The end result is shown in the file `tidy.txt`.
