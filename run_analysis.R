run_analysis <- function() {
        library(dplyr)
        library(reshape2)
        ##1.Merges the training and the test sets to create one data set.   
        ####Reading Different Variables Names[There are total 561 Variables]
        var_obs <- read.table("./data/features.txt")
        ####Reading Activity Lables
        act_lab <- read.table("./data/activity_labels.txt")        
        ######Reading Training Data
        train_df <- read_train_data(var_obs)        
        ######Reading Test Data
        test_df <- read_test_data(var_obs)        
        ##Merge
        main_df <- rbind(train_df,test_df)
        main_tbl_df <- tbl_df(main_df) ####Data Frame as required by 1st part of Course Project
        
        
        ##2.Extracts only the measurements on the mean and standard deviation for each measurement. 
        ####Generate Unique & Valid Column Names
        valid_col <- make.names(names=names(main_tbl_df), unique=TRUE, allow_=TRUE)
        colnames(main_tbl_df) <- valid_col        
        ####Extract only those Columns which are either mean or standard deviation
        req_col <- grep("mean|std",valid_col,value=FALSE)        
        main_tbl2 <- select(.data=main_tbl_df, 1,2,req_col) ####Data Frame as required by 2nd part of Course Project
        
        
        ##3. Uses descriptive activity names to name the activities in the data set
        main_tbl2 <- arrange(main_tbl2, Subject.ID, Activity.ID)
        act_lab2 <- tbl_df(act_lab)
        colnames(act_lab2) <- c("Activity.ID","Activity")
        main_tdy1 <- left_join(main_tbl2,act_lab2, by="Activity.ID")
        main_tdy1 <- main_tdy1[,c(1,2,82,3:81)]
        main_tdy1 <- select(main_tdy1, -Activity.ID) ####Data Frame as required by 3rd part of Course Project
        
        
        ##4.Appropriately labels the data set with descriptive variable names
        names(main_tdy1) <- gsub("..",".",names(main_tdy1),fixed=TRUE)
        main_tdy1 ####Data Frame as required by 4th part of Course Project
        
        
        ##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        ####Melting Data Frame on Variables
        melt_tdy <- melt(main_tdy1,id=c("Subject.ID","Activity"),measure.vars=c(3:81))
        ####Casting Data Frame for having means across all columns
        tidy_df <- dcast(melt_tdy,Subject.ID+Activity~variable,mean) ####Data Frame as required by 5th part of Course Project
        ##Cleaning up column names
        names(tidy_df) <- gsub("..",".",names(tidy_df),fixed=TRUE)
        names(tidy_df) <- gsub("mean","Mean",names(tidy_df),fixed=TRUE)
        names(tidy_df) <- gsub("std","Std",names(tidy_df),fixed=TRUE)
        ####Removing dot at end of column name
        names(tidy_df) <- gsub("\\.$","",names(tidy_df))
        
        tidy_df
        
        ###Following Write command was used ---here sep ="\t" makes text file more readable
        ###If we copy paste data fro msuch text files in excel (Win), it will be formatted automatically in columns
        ##>##write.table(tidy_df, "./Tidy_data_frame.txt",row.name=FALSE,sep = "\t")
        
        
}



###I could have created 1 function for reading data from either train folder or test
###but created 2 different to keep it simple & more readable

#Function for reading Training data set
read_train_data <- function(var_obs){
        ######Reading Training Data
        ########Reading Sequence of Subject ID's for main observations table (Identifier of Person Carrying Samsung Galaxy SII)
        
        sub_id <- read.table("./data/train/subject_train.txt")
        ########Reading Sequence of Activity IDs for main observations table
        act_id <- read.table("./data/train/y_train.txt")
        ########Reading All Observations for 561 variables
        train_obs <- read.table("./data/train/X_train.txt")
        ########Combining three data sets to from complete data frame of Training set
        train_df <- cbind(sub_id,act_id,train_obs)
        ########Setting Right Column Names
        colnames(train_df) <- c("Subject ID","Activity ID",as.character(var_obs$V2))
        train_df
        
}

#Function for reading Test data set
read_test_data <- function(var_obs){
        ######Reading Test Data
        ########Reading Sequence of Subject ID's for main observations table (Identifier of Person Carrying Samsung Galaxy SII)
        sub_id2 <- read.table("./data/test/subject_test.txt")
        ########Reading Sequence of Activity IDs for main observations table
        act_id2 <- read.table("./data/test/y_test.txt")
        ########Reading All Observations for 561 variables
        test_obs <- read.table("./data/test/X_test.txt")
        ########Combining three data sets to from complete data frame of Test set
        test_df <- cbind(sub_id2,act_id2,test_obs)
        ########Setting Right Column Names
        colnames(test_df) <- c("Subject ID","Activity ID",as.character(var_obs$V2)) 
        test_df
        
        
}
