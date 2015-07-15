#The Codebook for the course project data

The data for this project was obtained in a study conducted by UCI.  A full description of the experiment and the gathering of the data can be found here:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The resulting data set, which forms the basis for our course work, can be downloaded here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The data set contains training data (in the "train" sub-directory) and test data (in the "test" sub-directory).

The "X", "Y", and "Subject" data from the train and test files will be read into R by the "run_analysis.R" script, combined
and saved in 3 data frames:
the following variables:
* completeData <- concat data from x_train.txt and x_test.txt
* completeLabel <- concat data from y_train.txt and y_test.txt
* completeSubject <- concat data from subject_train.txt and subject_test.txt

Extract the mean and standard deviation measures from the features.txt file in the data root directory.  (The description for the data in
the features.txt file can be found in the features_info.txt file in the data root drectory.)
We use this to get a subset of completeData with the corresponding columns that only have all the mean and standard deviation measures.

The column names of the subset is then cleaned to remove special characters like "(", ")", and "-".

The activity_latels.txt data is then used to transform the values of completeLabel from numbers (IDs) to text (desctriptive names)

The completeData, completeLabel and completeSubject data frames are then combined into a new data frame completeCleanData. The first two
columns of the cleanData data frame are then renamed to "subject" and "activity".  The data in completeCleanData is then of the format:
* subject:  Integers from 1 to 30
* activity:  Text representing activity names
* The rest of the columns represent our mean and standard deviation measurements with values between -1 and 1.

This cleaned data will be written to a text file called merged_data.txt.  A second file called data_with_means.txt will be written
with the average of each variable for each activity and each subject.
