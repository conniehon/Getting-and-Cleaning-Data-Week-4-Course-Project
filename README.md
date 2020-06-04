# Getting-and-Cleaning-Data-Week-4-Course-Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

**Background of the data:**

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

**The data:**

Here are the data for the project: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description is available at the site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**The requirements**

You should create one R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**What were done**

In order to fulfill the requirements, script was written into a file "run_analysis.R". Below are snippets of each code segment in the file.

The original data sets were combined into one large dataset, cleaned, tidied and finally manipulated into a tidy dataset of their own. This dataset is saved as file "tidydata.txt".

I hope these repo helps others learn as much as I did myself. I have been learning R on and off for a month and a half and I have no background in programming, R being my first language. It was a struggle and a mess and in the most parts it still is, but I'm getting to the point where I'm able to produce tidier code than before. 

### From staging the directory to getting the data

```
#clear console
cat("//014")

#to find out what the current directory is
getwd()
...
```

### Reading the data

```
#read test data
testvalues <- read.table("./test/X_test.txt", header = FALSE)
testsubjects <- read.table("./test/subject_test.txt", header = FALSE)
...
```

### Tidying the data and finally saving the output

```
#combine test and training data sets in the same order
testbind <- cbind(testsubjects, testactivity, testvalues)
trainbind <- cbind(trainsubjects, trainactivity, trainvalues)
...
# Write to a new dataset, setting quote = FALSE prevents R from adding quotation marks to names of variables, setting row.names = FALSE prevents R from naming rows.
write.table(mydata2, file = "./tidydata.txt", quote = FALSE, row.names = FALSE)
```
