# Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a 
median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass 
Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that we used for this project that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

# Tidy Data Output Variables

Data include also contains information on each subject the observation relates to (subject), as well as the activity the 
subject was performing at the time of observation (descriptiveactivity).

On the given data, we pulled out all columns related to mean and standard deviation.  We then calculated the mean of these data, per subject/activity pairs.  The variables
were as follows:
tbodyaccmeanx

tbodyaccmeany

tbodyaccmeanz

tgravityaccmeanx

tgravityaccmeany

tgravityaccmeanz

tbodyaccjerkmeanx

tbodyaccjerkmeany

tbodyaccjerkmeanz

tbodygyromeanx

tbodygyromeany

tbodygyromeanz

tbodygyrojerkmeanx

tbodygyrojerkmeany

tbodygyrojerkmeanz

tbodyaccmagmean

tgravityaccmagmean

tbodyaccjerkmagmean

tbodygyromagmean

tbodygyrojerkmagmean

fbodyaccmeanx

fbodyaccmeany

fbodyaccmeanz

fbodyaccmeanfreqx

fbodyaccmeanfreqy

fbodyaccmeanfreqz

fbodyaccjerkmeanx

fbodyaccjerkmeany

fbodyaccjerkmeanz

fbodyaccjerkmeanfreqx

fbodyaccjerkmeanfreqy

fbodyaccjerkmeanfreqz

fbodygyromeanx

fbodygyromeany

fbodygyromeanz

fbodygyromeanfreqx

fbodygyromeanfreqy

fbodygyromeanfreqz

fbodyaccmagmean

fbodyaccmagmeanfreq

fbodybodyaccjerkmagmean

fbodybodyaccjerkmagmeanfreq

fbodybodygyromagmean

fbodybodygyromagmeanfreq

fbodybodygyrojerkmagmean

fbodybodygyrojerkmagmeanfreq

tbodyaccstdx

tbodyaccstdy

tbodyaccstdz

tgravityaccstdx

tgravityaccstdy

tgravityaccstdz

tbodyaccjerkstdx

tbodyaccjerkstdy

tbodyaccjerkstdz

tbodygyrostdx

tbodygyrostdy

tbodygyrostdz

tbodygyrojerkstdx

tbodygyrojerkstdy

tbodygyrojerkstdz

tbodyaccmagstd

tgravityaccmagstd

tbodyaccjerkmagstd

tbodygyromagstd

tbodygyrojerkmagstd

fbodyaccstdx

fbodyaccstdy

fbodyaccstdz

fbodyaccjerkstdx

fbodyaccjerkstdy

fbodyaccjerkstdz

fbodygyrostdx

fbodygyrostdy

fbodygyrostdz

fbodyaccmagstd

fbodybodyaccjerkmagstd

fbodybodygyromagstd

fbodybodygyrojerkmagstd

# Notes: 
- Features are normalized and bounded within [-1,1].


# Sources:
UCI HAR Dataset README and feature_info files

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
