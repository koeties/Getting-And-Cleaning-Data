#The Codebook for the course project data

The data for this project was obtained in a study conducted by UCI.  A full description of the experiment and the gathering of the data can be found here:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The resulting data set, which forms the basis for our course work, can be downloaded here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The data set contains training data (in the "train" sub-directory) and test data (in the "test" sub-directory).

The R analysis performs the following transformations on the original data:

1. The "X", "Y", and "Subject" data from the train and test data sets are each combined:
  * completeData <- combine data from ./data/train/x_train.txt and ./data/test/x_test.txt
  * completeLabel <- combine data from ./data/train/y_train.txt and ./data/test/y_test.txt
  * completeSubject <- combine data from ./data/train/subject_train.txt and ./data/test/subject_test.txt
2. The labels for the mean and standard deviation measures are read from the features.txt file in the data root (./data/) directory. (The description for the data in the features.txt file can be found in the features_info.txt file in the data root directory.)
3. These labels are then used to get a subset of completeData with only the corresponding columns that have all the mean and standard deviation measures. The rest of the measures are dropped.
4. The column names of the subset are then cleaned to remove "(", ")" and "-" characters.
5. Read in the data from ./data/activity_labels.txt into the activity variable.
6. The activity variable is then used to transform the values in the completeLabel dataset from numbers (IDs) to text (desctriptive names).
6. The completeData, completeLabel and completeSubject data frames are then combined into a new data frame called  completeCleanData. 
7. The first two columns of the cleanData data frame are then renamed to "subject" and "activity".  The data in completeCleanData is then of the format:
  * subject:  Integers from 1 to 30
  * activity:  Text representing activity names
  * The rest of the columns: Integer values between -1 and 1 representing the mean and standard deviation measurements.
8. This cleaned data is written to a text file called clean_merged_data.txt.
9. A second file called clean_merged_data_with_means.txt will be written where each row will contain the average of each measure for the activity and subject combination. The data colums:
  * subject:  Integers from 1 to 30
  * activity:  Text representing activity names
  * The rest of the columns: Integer values between -1 and 1 representing the average of each of the mean and standard deviation measurements for the subject/activity combination.
