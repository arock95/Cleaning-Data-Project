Coursera Data Cleaning Course Project
Anthony Rocchio
9/27/2016
########################################

# Overview

For this project, we are to clean a given set of data and from it produce a tidy data set of averages.

The resultant dataset is tidy because it meets the 3 criteria outlined by Hadley Wickham in "Tidy Data".  
Each variable forms one (and only one) column - each column from the initial set became one column in the resultant set. 
Each observation forms a row - I debated making the resultant dataset narrow and long, but that would have broken up observations
onto more than one line, as discussed below.  Since each of the many variables in the original dataset makes up one observation,
I decided to keep with the wide dataset approach.  
And each type of observational unit forms a table - the resultant table contains thousands of rows, but they are all of the same
type of observation.

# Assumptions

The script assumes your current working directory has all of the files necessary to process the tidy data output.  These files include:
activity_labels.txt, features.txt, subject_test.txt, subject_train.txt, X_test.txt, X_train.txt, y_test.txt, and y_train.txt.

# Details

The data we are analyzing is in two parts: training and test data.  This breaks the tidy data rule of 
"A single observational unit is stored in multiple tables (Wickham, "Tidy Data")".  So the first step is 
to combine the train and test data into one master table.  This can be done simply enough by reading 
all of the relevant data into R, giving it appropriate titles, and merging it together.  The data used 
was found in the x_*.txt files.  For column names, we used the "features.txt" file which is simply a list 
of all of the variables measured.  We also added training labels (y_*.txt) and subject information (subject_*.txt) 
to the table.  We created one table each for testing and training data, and then used rbind to merge them together.

Based on the column names, the next step was to extract only the measurements on the mean and standard deviation for 
each measurement.  This was done by using grep and searching for column names with "mean" or "std" in them.  We also 
added subject and activity data to this subset since they will be used later.

Once we had the subset of data we needed, we mapped the activity data in numerical form (1-6) to the descriptive 
activity name (Walking, Laying, etc).  We read in activity_labels.txt and used it as a lookup table.

Next we created more appropriate labels for the data set with better variable names, using the information learned 
in the class.  Specifically, variable names should be: all lowercase, descriptive, not duplicated, and no special 
characters.  We determined that the names were reasonably descriptive enough, so all that needed to be done was to remove 
punctuation and set all the characters to lower case.

After the variable names were made tidy, we created our new tidy dataset.  Doing this was relatively simple since our data 
was in a tidy format already.  First we grouped our data by subject and activity, using group_by.  Then we used the dplyr function 
summarize_each to iterate through each measurement variable and take the mean for the subject/activity group.

For our tidy dataset we decided to keep it "wide", meaning that it had a significant numbers of rows.  It was determined 
that though there were many variables, each variable was part of one observation, so we didn't want to break up one observation 
onto many rows.  Per Hadley Wickham's work in "Tidy Data", this choice is tidy because each observation forms a row, and each variable 
forms a column.  I debated whether each measurement was actually a value and not a variable, which would have made for a much narrower 
but much longer dataset.  However, I believe the correct choice was made.

For more technical details, please see the comments throughout the actual R code in run_analysis.R.
