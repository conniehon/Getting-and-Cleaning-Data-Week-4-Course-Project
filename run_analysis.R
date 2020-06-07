## Step 1. Stage the directory and get the data

#clear console
cat("\014")

#to find out what the current directory is
getwd()

#check if folder "data" exists in current directory. if it does not, a folder "data" will be created in current directory.
if(!file.exists("./data")){dir.create("./data")}

#create a new variable fileURL to store the URL
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#download file from fileURL and store it in folder "data" under filename "dataset.zip", specify method = "curl" to workaround the https component of the URL
download.file(fileURL, destfile = "./data/dataset.zip", method = "curl")

#unzips the zip file and stores files in the same folder as folder "data"
unzip("./data/dataset.zip")

#lists the files in the working directory
list.files()

#for convenience, set the working directory to the folder containing the data
setwd("./UCI HAR Dataset")

## Step 2. Read the data

#From README.txt, the data that we want are in six files 
# test data: "./test/X_test.txt", "./test/y_test.txt" and "./test/subject_test.txt" and 
# train data: "./train/X_train.txt", "./train/y_train.txt" and "./train/subject_train.txt"
#Since all column widths are the same, we can use "read.table" function to read .txt files into tables.
#Use read.table instead of read.delim as read.table uses white spaces as separators

#read test data
testvalues <- read.table("./test/X_test.txt", header = FALSE)
testsubjects <- read.table("./test/subject_test.txt", header = FALSE)
testactivity <- read.table("./test/y_test.txt", header = FALSE)

#read training data
trainvalues <- read.table("./train/X_train.txt", header = FALSE)
trainsubjects <- read.table("./train/subject_train.txt", header = FALSE)
trainactivity <- read.table("./train/y_train.txt", header = FALSE)

#if the column widths are different due to whitespaces we will need to use a text reader such as Visual Studio Code to examine each file for whitespaces
#we also need to use the readr package to read txt file into table
#library(readr)
#we can use read_fwf function to read txt file into table, specifying the whitepaces.

#open "activity_labels.txt" in a text editor and examine the data
#read in activity variable names
activities <- read.table("./activity_labels.txt", header = FALSE)
#label the columns
x <- c("activityid", "activitylabel")
colnames(activities) <- x

#open "features.txt" in a text editor and examine the data
#read in features variable names, do not convert text labels to factors as the labels contain commas followed by numbers
features <- read.table("./features.txt", as.is = TRUE)

### Task 1. Merges the training and the test sets to create one data set.

#combine test and training data sets in the same order
testbind <- cbind(testsubjects, testactivity, testvalues)
trainbind <- cbind(trainsubjects, trainactivity, trainvalues)
fulldata <- rbind(testbind, trainbind)

#create column headers
z <- c("subject", "activityid", features[,2])
colnames(fulldata) <- z

#load dplyr to view data
library(dplyr)

#view full data, this will open up a new window in Source
fulldata <- tbl_df(fulldata)
View(fulldata)

#check that number of columns and number of column headers tally
ncol(fulldata)
str(z)

#apply column headers to table. The table in Source should update automatically
colnames(fulldata) <- z

#remove element data sets to preserve memory space
rm(testsubjects)
rm(testactivity)
rm(testvalues)
rm(trainsubjects)
rm(trainactivity)
rm(trainvalues)

### Task 2. Extracts only the measurements on the mean and standard deviation for each measurement.

#extracts columns containing "subject", "activityid", "mean" or "std" into a list
#leave out spaces between or R will consider trailing or beginning spaces into each criteria
columns_wanted <- grep("subject|activityid|mean|std", names(fulldata))

#extract desired columns into a new dataframe
mydata <- fulldata[, columns_wanted]

### Task 3. Uses descriptive activity names to name the activities in the data set

#revert mydata into a dplyr dataframe
mydata <- tbl_df(mydata)

#view mydata
View(mydata)

#use factor to substitute each id/level with the appropriate activitylabel/label
#this produces a list of factors, put the result back into mydata to replace the activityid column
mydata$activityid <- factor(mydata$activityid, levels = activities[,1], labels = activities[,2])

### Task 4. Appropriately labels the data set with descriptive variable names.

#extract column names out into a list
allcolumns <- names(mydata)

#examine the list
allcolumns

#1. remove hyphens and parentheses. Need to escape parentheses with \\
allcolumns <- gsub("-", "", allcolumns)
allcolumns <- gsub("\\(", "", allcolumns)
allcolumns <- gsub("\\)", "", allcolumns)

#2. expand abbreviations
allcolumns <- sub("subject", "Subject", allcolumns)
allcolumns <- sub("activityid", "Activity", allcolumns)
allcolumns <- gsub("^t", "TimeDomain", allcolumns)
allcolumns <- gsub("Freq", "Frequency", allcolumns)
allcolumns <- gsub("^f", "Frequency", allcolumns)
allcolumns <- gsub("Acc", "Accelerometer", allcolumns)
allcolumns <- gsub("mean", "Mean", allcolumns)
allcolumns <- gsub("std", "StandardDeviation", allcolumns)
allcolumns <- gsub("Gyro", "Gyroscope", allcolumns)
allcolumns <- gsub("Mag", "Magnitude", allcolumns)


#3. remove typos
allcolumns <- gsub("BodyBody", "Body", allcolumns)

#4. put corrected column names back into table
colnames(mydata) <- allcolumns

#check results
View(mydata)

### Task 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# Use group_by to group observations by activity, followed by subject and assign to a new dataframe
mydata2 <- group_by(mydata, Activity, Subject)

# Use summarize to summarize using mean
mydata2 <- summarize_all(mydata2, .funs = mean)

# View table
View(mydata2)

# Write to a new dataset, setting quote = FALSE prevents R from adding quotation marks to names of variables, setting row.names = FALSE prevents R from naming rows.
write.table(mydata2, file = "./tidydata.txt", quote = FALSE, row.names = FALSE)






















