# Getting & Cleaning Data - Course Project
3rd Module Coursera -Data Science
##Objective
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## run_analysis()
### R script needs to be created to fulfill following tasks:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Different Components of this Repository
* "data" Folder with all raw data
* README.md: this file
* CodeBook.md: information about raw and tidy data set
* run_analysis.R: to achieve goal of this course project
* Tidy Data Set created as result of this project "Tidy_data_frame.txt"
* Please ignore other components of Repo

## Process
* Download "data" folder in your working directory
* Download "run_analysis.R" and open in R Studio -press ctrl+S
* Execute function "tidy_df <- run_analysis()"
* Execute comman "write.table(tidy_df, "./Tidy_data_frame.txt",row.name=FALSE,sep = "\t")" [Purpose of using sep = "\t" is to make data more readable, if you copy paste text data directly in excel]
