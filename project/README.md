#Getting and Cleaning Data Course Project

The "run_analysis.R" script will do the following:

1. The "X", "Y", and "Subject" data from the train and test files will be read into R, combined and saved in the following variables:
  * completeData <- combine data from ./data/train/x_train.txt and ./data/test/x_test.txt
  * completeLabel <- combine data from ./data/train/y_train.txt and ./data/test/y_test.txt
  * completeSubject <- combine data from ./data/train/subject_train.txt and ./data/test/subject_test.txt
2. Extract the mean and standard deviation measures from the features.txt file in the data root (./data/) directory.
3. Use this to get a subset of completeData with only the corresponding columns that have all the mean and standard deviation measures.
4. The column names of the subset are then cleaned to remove "(", ")" and "-" characters.
5. Read in the data from ./data/activity_labels.txt into the activity variable.
6. The activity variable is then used to transform the values of completeLabel from numbers (IDs) to text (desctriptive names).
6. The completeData, completeLabel and completeSubject data frames are then combined into a new data frame completeCleanData. 
7. The first two columns of the cleanData data frame are then renamed to "subject" and "activity".
8. This cleaned data is then written to a text file called clean_merged_data.txt.
9. A second file called clean_merged_data_with_means.txt is written with the average of each measure for each activity/subject combination.
