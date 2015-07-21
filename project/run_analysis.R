# Load the plyr library
library(plyr)

# Read in our train and test data from the text files
trainData <- read.table("./data/train/X_train.txt")
trainLabel <- read.table("./data/train/y_train.txt")
trainSubject <- read.table("./data/train/subject_train.txt")
testData <- read.table("./data/test/X_test.txt")
testLabel <- read.table("./data/test/y_test.txt")
testSubject <- read.table("./data/test/subject_test.txt")

# Combine the train and test data
completeData <- rbind(trainData, testData)
completeLabel <- rbind(trainLabel, testLabel)
completeSubject <- rbind(trainSubject, testSubject)

# Read in the labels of all the measurements from the text file
features <- read.table("./data/features.txt")

# Extract all the mean and standard deviation measure labels and drop the rest of
# the measures from our data.
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
completeData <- completeData[, meanStdIndices]

# Clean up column names by removing "(", ")" and "-" in column names
names(completeData) <- gsub("\\(\\)", "", features[meanStdIndices, 2])
names(completeData) <- gsub("-", "", names(completeData))

# Read in our activity names from the text file, remove "_" characters and apply CamelCase.
# Then replace the integer values in our data with the names
activity <- read.table("./data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[completeLabel[, 1], 2]
completeLabel[, 1] <- activityLabel
names(completeSubject) <- "subject"
names(completeLabel) <- "activity"

# Combine the Subject, Label and Data data frames and write it to a text file
completeCleanData <- cbind(completeSubject, completeLabel, completeData)
write.table(completeCleanData, "clean_merged_data.txt", row.name=FALSE)

# Calculate the average of each variable for each activity and each subject.
# Write the results to a text file.
completeCleanDataWithMeans <- ddply(completeCleanData, c("subject","activity"), numcolwise(mean))
write.table(completeCleanDataWithMeans, "clean_merged_data_with_means.txt", row.name=FALSE)
