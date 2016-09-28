# Cousera Cleaning Data Course Project
# Anthony Rocchio

# load the necessary libraries
library("dplyr")

# STEP 1: Merges the training and the test sets to create one data set

# read in common data sets (features, labels, etc)
features <- read.table("features.txt")
features <- features[,2]
activity_labels <- read.table("activity_labels.txt")

#read in "test" related data sets first
test_data <- read.table("X_test.txt")
test_activities <- read.table("y_test.txt")
test_subjects <- read.table("subject_test.txt")
names(test_activities) <- "activity"
names(test_subjects) <- "subject"
colnames(test_data) <- features
test_data <- cbind(test_data, test_subjects)
test_data <- cbind(test_data, test_activities)

# now read in "train" related data sets
train_data <- read.table("X_train.txt")
train_activities <- read.table("y_train.txt")
train_subjects <- read.table("subject_train.txt")
names(train_activities) <- "activity"
names(train_subjects) <- "subject"
colnames(train_data) <- features
train_data <- cbind(train_data, train_subjects)
train_data <- cbind(train_data, train_activities)

# combine the test and train datasets together
step1_data <- rbind(test_data, train_data)
### END STEP 1
# ***********************************************

# STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement

# Basically just grep for "mean" and "Std" in the column names of step1_data
step2_data <- step1_data[, grep("mean", colnames(step1_data))]
step2_data <- cbind(step2_data, step1_data[, grep("std", colnames(step1_data))])
### END STEP 2
# ***********************************************

#STEP 3: Uses descriptive activity names to name the activities in the data set

# add in "activity" col from step 1 to our dataset produced in step 2
# but this only has integers, NOT the descriptive names
# luckily "activity_labels" is a way to cross reference 
Activity <- step1_data[, grep("activity", colnames(step1_data))]

#here's the cross-reference step
Descriptive_Activity <- sapply(Activity, function(x) activity_labels[x,2])

#then simply add the new descriptive activity vector to the dataset
step3_data <- cbind(step2_data, Descriptive_Activity)
# END STEP 3
# ***********************************************

# STEP 4: Appropriately labels the data set with descriptive variable names.

# I decided to keep the variable (column) names the same, but make them all lower case
# and remove any special characters (-, (, ), etc... per tidy data guidelines given in this course)
step4_colnames <- tolower(colnames(step3_data))
# this step will remove ALL punctuation from each column name
step4_colnames <- gsub("[[:punct:]]", "", step4_colnames)
colnames(step3_data)  <- step4_colnames
# END STEP 4
# ***********************************************

# STEP 5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# first we've got to add the subject information to our dataset from all the way back in step1
subject <- step1_data[, grep("subjec", colnames(step1_data))]
step4_data <- cbind(step3_data, subject)

# now our dataset is ready for analysis - it contains test and train info, subject and activity info, as well
# as all information related to means and standard deviation data
# we we have to create a second dataset with the avg of each var per activity and subject

step5_data <- group_by(step4_data, subject, descriptiveactivity) # group the data by subject and also activity
tidy_data <- summarize_each(step5_data, funs(mean)) # takes the mean of each column and creates a new tidy dataframe
View(tidy_data) # prints tidy_data
