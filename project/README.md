#Getting and Cleaning Data Course Project

The "run_analysis.R" script will do the following:

1. The "X", "Y", and "Subject" data from the train and test files will be read into R, combined and saved in the following variables:
  * completeData <- concat data from x_train.txt and x_test.txt
  * completeLabel <- concat data from y_train.txt and y_test.txt
  * completeSubject <- concat data from subject_train.txt and subject_test.txt
2. Extract the mean and standard deviation measures from the features.txt file in the data root directory.
3. Use this to get a subset of completeData with the corresponding columns that only have all the mean and standard deviation measures.
4. The column names of the subset is then cleaned to remove special characters like "(", ")", and "-".
5. The activity_latels.txt data is then used to transform the values of completeLabel from numbers (IDs) to text (desctriptive names)
6. The completeData, completeLabel and completeSubject data frames are then combined into a new data frame completeCleanData. 7. The first two columns of the cleanData data frame are then renamed to "subject" and "activity".  The data in completeCleanData is then of the format:
  * subject:  Integers from 1 to 30
  * activity:  Text representing activity names
  * The rest of the columns represent our mean and standard deviation measurements with values between -1 and 1.
8. This cleaned data will be written to a text file called merged_data.txt.
9. A second file called data_with_means.txt will be written with the average of each variable for each activity and each subject.
