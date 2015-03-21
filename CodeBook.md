# Code Book
This Code Book describes the variables, the data, and any transformations or work performed to clean up the data



## Raw Data
Raw data is obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

### Source
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Citation Request
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.



## Transformations
### Merging Data Sets
* Reading Different Files
* Creating complete data frames (assigning column names read from different file) to be merged
* Merging two complete data frames

### Extract Measurements on mean & standard deviation only
_________Each Variable measures is in different column
* Cteated a new Data Frame with only those variables which are on mean or standard deviation

### Adding Activity Labels in Data Frame
* Data Frame obtained in previous step is joined with another data frame with activity labels
* Sequence of columns in data frame are arranged i.e. first 3 columns -Subject ID, Activity ID, Activity (label)
* "Acitivty ID" Column is dropped in final data frame

### Final Data Frame -Tidy Data
_________Each observation of all variables is in different row

_________There should be one table for each "kind" of variables [This table contains variables from 1 experiment based on 1 device]
* Average for each variable is derived for the unique comination of Suject Id & Activity
* Column names of data frame cleaned up to strip off not-allowed charactes in column names
* Column names further cleaned up to remove unnecessary dots
* First letters of mean & std in column names capitalized



## Tidy Data
### ID's (Dimensions) of data set across which measurements are stored
* Subject.ID- These are unique identifiers for 30 volunteers within an age bracket of 19-48 years
  Range: 1 to 30
* Activity- different type of activities taken up: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

### Variables (Measurements) total 79 in count
Variable List:
tBodyAcc.Mean.X, tBodyAcc.Mean.Y, tBodyAcc.Mean.Z, tBodyAcc.Std.X, tBodyAcc.Std.Y, tBodyAcc.Std.Z, tGravityAcc.Mean.X, tGravityAcc.Mean.Y, tGravityAcc.Mean.Z, tGravityAcc.Std.X, tGravityAcc.Std.Y, tGravityAcc.Std.Z, tBodyAccJerk.Mean.X, tBodyAccJerk.Mean.Y, tBodyAccJerk.Mean.Z, tBodyAccJerk.Std.X, tBodyAccJerk.Std.Y, tBodyAccJerk.Std.Z, tBodyGyro.Mean.X, tBodyGyro.Mean.Y, tBodyGyro.Mean.Z, tBodyGyro.Std.X, tBodyGyro.Std.Y, tBodyGyro.Std.Z, tBodyGyroJerk.Mean.X, tBodyGyroJerk.Mean.Y, tBodyGyroJerk.Mean.Z, tBodyGyroJerk.Std.X, tBodyGyroJerk.Std.Y, tBodyGyroJerk.Std.Z, tBodyAccMag.Mean, tBodyAccMag.Std, tGravityAccMag.Mean, tGravityAccMag.Std, tBodyAccJerkMag.Mean, tBodyAccJerkMag.Std, tBodyGyroMag.Mean, tBodyGyroMag.Std, tBodyGyroJerkMag.Mean, tBodyGyroJerkMag.Std, fBodyAcc.Mean.X, fBodyAcc.Mean.Y, fBodyAcc.Mean.Z, fBodyAcc.Std.X, fBodyAcc.Std.Y, fBodyAcc.Std.Z, fBodyAcc.MeanFreq.X, fBodyAcc.MeanFreq.Y, fBodyAcc.MeanFreq.Z, fBodyAccJerk.Mean.X, fBodyAccJerk.Mean.Y, fBodyAccJerk.Mean.Z, fBodyAccJerk.Std.X, fBodyAccJerk.Std.Y, fBodyAccJerk.Std.Z, fBodyAccJerk.MeanFreq.X, fBodyAccJerk.MeanFreq.Y, fBodyAccJerk.MeanFreq.Z, fBodyGyro.Mean.X, fBodyGyro.Mean.Y, fBodyGyro.Mean.Z, fBodyGyro.Std.X, fBodyGyro.Std.Y, fBodyGyro.Std.Z, fBodyGyro.MeanFreq.X, fBodyGyro.MeanFreq.Y, fBodyGyro.MeanFreq.Z, fBodyAccMag.Mean, fBodyAccMag.Std, fBodyAccMag.MeanFreq, fBodyBodyAccJerkMag.Mean, fBodyBodyAccJerkMag.Std, fBodyBodyAccJerkMag.MeanFreq, fBodyBodyGyroMag.Mean, fBodyBodyGyroMag.Std, fBodyBodyGyroMag.MeanFreq, fBodyBodyGyroJerkMag.Mean, fBodyBodyGyroJerkMag.Std, fBodyBodyGyroJerkMag.MeanFreq

* X,Y or Z in each variable name indicate 3 dimensions of measurement
* Mean or Std indicate mean or standard deviation for speicfic combination of names indicated in column name
* t & f prefix: t prefix indicates that measurement is on time domain & f prefix indicate measurement on frequency domain (fourier transform of t measurements)


Tidy Data stored in file "Tidy_data_frame.txt" of repository.
