#Getting and Cleaning Data Course Project

This file describes how the run_analysis.R script works to create a tidy data set from the source data in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following steps assume that all needed files are in your R working directory.
* Unzip the source data file and rename the directory to "data" (without the quotes)
* Load the script into R by using source("run_analysis.R").  
* This will create 2 new data files:  merged_data.txt (containing our tidy date in a data frame called "cleanedData") and data_with_means.txt which contains a data frame called "result".
* To read the data in the data_with_means.txt file into R, use: data <- read.table("data_with_means.txt")
