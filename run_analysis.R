## This script will take the UCI HAR data and
## transform it into a tidy dataset, along with
## a separate tidy dataset with summary information
library(plyr)
library(dplyr)

#Input to function should be locations of test and training data
run_analysis <- function(train_loc, test_loc) {
    
    #Read in all of the relevant datasets to R
    subject_test <- read.table(paste(test_loc,"/subject_test.txt",sep=""))
    X_test <- read.table(paste(test_loc,"/X_test.txt",sep=""))
    Y_test <- read.table(paste(test_loc,"/Y_test.txt",sep=""))
    body_acc_x_test <- read.table(paste(test_loc,"/Inertial Signals/body_acc_x_test.txt",sep=""))
    body_acc_y_test <- read.table(paste(test_loc,"/Inertial Signals/body_acc_y_test.txt",sep=""))
    body_acc_z_test <- read.table(paste(test_loc,"/Inertial Signals/body_acc_z_test.txt",sep=""))
    body_gyro_x_test <- read.table(paste(test_loc,"/Inertial Signals/body_gyro_x_test.txt",sep=""))
    body_gyro_y_test <- read.table(paste(test_loc,"/Inertial Signals/body_gyro_y_test.txt",sep=""))
    body_gyro_z_test <- read.table(paste(test_loc,"/Inertial Signals/body_gyro_z_test.txt",sep=""))
    total_acc_x_test <- read.table(paste(test_loc,"/Inertial Signals/total_acc_x_test.txt",sep=""))
    total_acc_y_test <- read.table(paste(test_loc,"/Inertial Signals/total_acc_y_test.txt",sep=""))
    total_acc_z_test <- read.table(paste(test_loc,"/Inertial Signals/total_acc_z_test.txt",sep=""))
    subject_train <- read.table(paste(train_loc,"/subject_train.txt",sep=""))
    X_train <- read.table(paste(train_loc,"/X_train.txt",sep=""))
    Y_train <- read.table(paste(train_loc,"/Y_train.txt",sep=""))
    body_acc_x_train <- read.table(paste(train_loc,"/Inertial Signals/body_acc_x_train.txt",sep=""))
    body_acc_y_train <- read.table(paste(train_loc,"/Inertial Signals/body_acc_y_train.txt",sep=""))
    body_acc_z_train <- read.table(paste(train_loc,"/Inertial Signals/body_acc_z_train.txt",sep=""))
    body_gyro_x_train <- read.table(paste(train_loc,"/Inertial Signals/body_gyro_x_train.txt",sep=""))
    body_gyro_y_train <- read.table(paste(train_loc,"/Inertial Signals/body_gyro_y_train.txt",sep=""))
    body_gyro_z_train <- read.table(paste(train_loc,"/Inertial Signals/body_gyro_z_train.txt",sep=""))
    total_acc_x_train <- read.table(paste(train_loc,"/Inertial Signals/total_acc_x_train.txt",sep=""))
    total_acc_y_train <- read.table(paste(train_loc,"/Inertial Signals/total_acc_y_train.txt",sep=""))
    total_acc_z_train <- read.table(paste(train_loc,"/Inertial Signals/total_acc_z_train.txt",sep=""))
    
    #Rename columns identifying the subject and activity
    names(subject_test)[names(subject_test)=="V1"] <- "Subject"
    names(Y_test)[names(Y_test)=="V1"] <- "Activity.Label"
    
    #Extract appropriate columns from dataset
    test_data <- cbind(subject_test, Y_test, X_test$V1, X_test$V2, X_test$V3, X_test$V4,
                       X_test$V5, X_test$V6, X_test$V41, X_test$V42, X_test$V43, X_test$V44,
                       X_test$V45, X_test$V46, X_test$V81, X_test$V82, X_test$V83, X_test$V84,
                       X_test$V85, X_test$V86, X_test$V121, X_test$V122, X_test$V123,
                       X_test$V124, X_test$V125, X_test$V126, X_test$V161, X_test$V162,
                       X_test$V163, X_test$V164, X_test$V165, X_test$V166, X_test$V201,
                       X_test$V202, X_test$V214, X_test$V215, X_test$V227, X_test$V228,
                       X_test$V240, X_test$V241, X_test$V253, X_test$V254, X_test$V266,
                       X_test$V267, X_test$V268, X_test$V269, X_test$V270, X_test$V271,
                       X_test$V345, X_test$V346, X_test$V347, X_test$V348, X_test$V349,
                       X_test$V350, X_test$V424, X_test$V425, X_test$V426, X_test$V427,
                       X_test$V428, X_test$V429, X_test$V503, X_test$V504, X_test$V516,
                       X_test$V517, X_test$V529, X_test$V530, X_test$V542, X_test$V543)
    #Add descriptive names
    names(test_data)[names(test_data)=="X_test$V1"] <- "Body.Acceleration.X.Mean"
    names(test_data)[names(test_data)=="X_test$V2"] <- "Body.Acceleration.Y.Mean"
    names(test_data)[names(test_data)=="X_test$V3"] <- "Body.Acceleration.Z.Mean"
    names(test_data)[names(test_data)=="X_test$V4"] <- "Body.Acceleration.X.Stdev"
    names(test_data)[names(test_data)=="X_test$V5"] <- "Body.Acceleration.Y.Stdev"
    names(test_data)[names(test_data)=="X_test$V6"] <- "Body.Acceleration.Z.Stdev"
    names(test_data)[names(test_data)=="X_test$V41"] <- "Gravity.Acceleration.X.Mean"
    names(test_data)[names(test_data)=="X_test$V42"] <- "Gravity.Acceleration.Y.Mean"
    names(test_data)[names(test_data)=="X_test$V43"] <- "Gravity.Acceleration.Z.Mean"
    names(test_data)[names(test_data)=="X_test$V44"] <- "Gravity.Acceleration.X.Stdev"
    names(test_data)[names(test_data)=="X_test$V45"] <- "Gravity.Acceleration.Y.Stdev"
    names(test_data)[names(test_data)=="X_test$V46"] <- "Gravity.Acceleration.Z.Stdev"
    names(test_data)[names(test_data)=="X_test$V81"] <- "Body.Acceleration.Jerk.X.Mean"
    names(test_data)[names(test_data)=="X_test$V82"] <- "Body.Acceleration.Jerk.Y.Mean"
    names(test_data)[names(test_data)=="X_test$V83"] <- "Body.Acceleration.Jerk.Z.Mean"
    names(test_data)[names(test_data)=="X_test$V84"] <- "Body.Acceleration.Jerk.X.Stdev"
    names(test_data)[names(test_data)=="X_test$V85"] <- "Body.Acceleration.Jerk.Y.Stdev"
    names(test_data)[names(test_data)=="X_test$V86"] <- "Body.Acceleration.Jerk.Z.Stdev"
    names(test_data)[names(test_data)=="X_test$V121"] <- "Body.Gyroscope.X.Mean"
    names(test_data)[names(test_data)=="X_test$V122"] <- "Body.Gyroscope.Y.Mean"
    names(test_data)[names(test_data)=="X_test$V123"] <- "Body.Gyroscope.Z.Mean"
    names(test_data)[names(test_data)=="X_test$V124"] <- "Body.Gyroscope.X.Stdev"
    names(test_data)[names(test_data)=="X_test$V125"] <- "Body.Gyroscope.Y.Stdev"
    names(test_data)[names(test_data)=="X_test$V126"] <- "Body.Gyroscope.Z.Stdev"
    names(test_data)[names(test_data)=="X_test$V161"] <- "Body.Gyroscope.Jerk.X.Mean"
    names(test_data)[names(test_data)=="X_test$V162"] <- "Body.Gyroscope.Jerk.Y.Mean"
    names(test_data)[names(test_data)=="X_test$V163"] <- "Body.Gyroscope.Jerk.Z.Mean"
    names(test_data)[names(test_data)=="X_test$V164"] <- "Body.Gyroscope.Jerk.X.Stdev"
    names(test_data)[names(test_data)=="X_test$V165"] <- "Body.Gyroscope.Jerk.Y.Stdev"
    names(test_data)[names(test_data)=="X_test$V166"] <- "Body.Gyroscope.Jerk.Z.Stdev"
    names(test_data)[names(test_data)=="X_test$V201"] <- "Body.Acceleration.Magnitude.Mean"
    names(test_data)[names(test_data)=="X_test$V202"] <- "Body.Acceleration.Magnitude.Stdev"
    names(test_data)[names(test_data)=="X_test$V214"] <- "Gravity.Acceleration.Magnitude.Mean"
    names(test_data)[names(test_data)=="X_test$V215"] <- "Gravity.Acceleration.Magnitude.Stdev"
    names(test_data)[names(test_data)=="X_test$V227"] <- "Body.Acceleration.Jerk.Magnitude.Mean"
    names(test_data)[names(test_data)=="X_test$V228"] <- "Body.Acceleration.Jerk.Magnitude.Stdev"
    names(test_data)[names(test_data)=="X_test$V240"] <- "Body.Gyroscope.Magnitude.Mean"
    names(test_data)[names(test_data)=="X_test$V241"] <- "Body.Gyroscope.Magnitude.Stdev"
    names(test_data)[names(test_data)=="X_test$V253"] <- "Body.Gyroscope.Jerk.Magnitude.Mean"
    names(test_data)[names(test_data)=="X_test$V254"] <- "Body.Gyroscope.Jerk.Magnitude.Stdev"
    names(test_data)[names(test_data)=="X_test$V266"] <- "Freq.Body.Acceleration.X.Mean"
    names(test_data)[names(test_data)=="X_test$V267"] <- "Freq.Body.Acceleration.Y.Mean"
    names(test_data)[names(test_data)=="X_test$V268"] <- "Freq.Body.Acceleration.Z.Mean"
    names(test_data)[names(test_data)=="X_test$V269"] <- "Freq.Body.Acceleration.X.Stdev"
    names(test_data)[names(test_data)=="X_test$V270"] <- "Freq.Body.Acceleration.Y.Stdev"
    names(test_data)[names(test_data)=="X_test$V271"] <- "Freq.Body.Acceleration.Z.Stdev"
    names(test_data)[names(test_data)=="X_test$V345"] <- "Freq.Body.Acceleration.Jerk.X.Mean"
    names(test_data)[names(test_data)=="X_test$V346"] <- "Freq.Body.Acceleration.Jerk.Y.Mean"
    names(test_data)[names(test_data)=="X_test$V347"] <- "Freq.Body.Acceleration.Jerk.Z.Mean"
    names(test_data)[names(test_data)=="X_test$V348"] <- "Freq.Body.Acceleration.Jerk.X.Stdev"
    names(test_data)[names(test_data)=="X_test$V349"] <- "Freq.Body.Acceleration.Jerk.Y.Stdev"
    names(test_data)[names(test_data)=="X_test$V350"] <- "Freq.Body.Acceleration.Jerk.Z.Stdev"
    names(test_data)[names(test_data)=="X_test$V424"] <- "Freq.Body.Gyroscope.X.Mean"
    names(test_data)[names(test_data)=="X_test$V425"] <- "Freq.Body.Gyroscope.Y.Mean"
    names(test_data)[names(test_data)=="X_test$V426"] <- "Freq.Body.Gyroscope.Z.Mean"
    names(test_data)[names(test_data)=="X_test$V427"] <- "Freq.Body.Gyroscope.X.Stdev"
    names(test_data)[names(test_data)=="X_test$V428"] <- "Freq.Body.Gyroscope.Y.Stdev"
    names(test_data)[names(test_data)=="X_test$V429"] <- "Freq.Body.Gyroscope.Z.Stdev"
    names(test_data)[names(test_data)=="X_test$V503"] <- "Freq.Body.Acceleration.Magnitude.Mean"
    names(test_data)[names(test_data)=="X_test$V504"] <- "Freq.Body.Acceleration.Magnitude.Stdev"
    names(test_data)[names(test_data)=="X_test$V516"] <- "Freq.Body.Acceleration.Jerk.Magnitude.Mean"
    names(test_data)[names(test_data)=="X_test$V517"] <- "Freq.Body.Acceleration.Jerk.Magnitude.Stdev"
    names(test_data)[names(test_data)=="X_test$V529"] <- "Freq.Body.Gyroscope.Magnitude.Mean"
    names(test_data)[names(test_data)=="X_test$V530"] <- "Freq.Body.Gyroscope.Magnitude.Stdev"
    names(test_data)[names(test_data)=="X_test$V542"] <- "Freq.Body.Gyroscope.Jerk.Magnitude.Mean"
    names(test_data)[names(test_data)=="X_test$V543"] <- "Freq.Body.Gyroscope.Jerk.Magnitude.Stdev"
    #Identify whether data is test or training
    test_data$Test.or.Train <- "Test"
    
    
    
    #Repeat above steps, but for the training data (instead of test)
    names(subject_train)[names(subject_train)=="V1"] <- "Subject"
    names(Y_train)[names(Y_train)=="V1"] <- "Activity.Label"
    train_data <- cbind(subject_train, Y_train, X_train$V1, X_train$V2, X_train$V3, X_train$V4,
                       X_train$V5, X_train$V6, X_train$V41, X_train$V42, X_train$V43, X_train$V44,
                       X_train$V45, X_train$V46, X_train$V81, X_train$V82, X_train$V83, X_train$V84,
                       X_train$V85, X_train$V86, X_train$V121, X_train$V122, X_train$V123,
                       X_train$V124, X_train$V125, X_train$V126, X_train$V161, X_train$V162,
                       X_train$V163, X_train$V164, X_train$V165, X_train$V166, X_train$V201,
                       X_train$V202, X_train$V214, X_train$V215, X_train$V227, X_train$V228,
                       X_train$V240, X_train$V241, X_train$V253, X_train$V254, X_train$V266,
                       X_train$V267, X_train$V268, X_train$V269, X_train$V270, X_train$V271,
                       X_train$V345, X_train$V346, X_train$V347, X_train$V348, X_train$V349,
                       X_train$V350, X_train$V424, X_train$V425, X_train$V426, X_train$V427,
                       X_train$V428, X_train$V429, X_train$V503, X_train$V504, X_train$V516,
                       X_train$V517, X_train$V529, X_train$V530, X_train$V542, X_train$V543)
    names(train_data)[names(train_data)=="X_train$V1"] <- "Body.Acceleration.X.Mean"
    names(train_data)[names(train_data)=="X_train$V2"] <- "Body.Acceleration.Y.Mean"
    names(train_data)[names(train_data)=="X_train$V3"] <- "Body.Acceleration.Z.Mean"
    names(train_data)[names(train_data)=="X_train$V4"] <- "Body.Acceleration.X.Stdev"
    names(train_data)[names(train_data)=="X_train$V5"] <- "Body.Acceleration.Y.Stdev"
    names(train_data)[names(train_data)=="X_train$V6"] <- "Body.Acceleration.Z.Stdev"
    names(train_data)[names(train_data)=="X_train$V41"] <- "Gravity.Acceleration.X.Mean"
    names(train_data)[names(train_data)=="X_train$V42"] <- "Gravity.Acceleration.Y.Mean"
    names(train_data)[names(train_data)=="X_train$V43"] <- "Gravity.Acceleration.Z.Mean"
    names(train_data)[names(train_data)=="X_train$V44"] <- "Gravity.Acceleration.X.Stdev"
    names(train_data)[names(train_data)=="X_train$V45"] <- "Gravity.Acceleration.Y.Stdev"
    names(train_data)[names(train_data)=="X_train$V46"] <- "Gravity.Acceleration.Z.Stdev"
    names(train_data)[names(train_data)=="X_train$V81"] <- "Body.Acceleration.Jerk.X.Mean"
    names(train_data)[names(train_data)=="X_train$V82"] <- "Body.Acceleration.Jerk.Y.Mean"
    names(train_data)[names(train_data)=="X_train$V83"] <- "Body.Acceleration.Jerk.Z.Mean"
    names(train_data)[names(train_data)=="X_train$V84"] <- "Body.Acceleration.Jerk.X.Stdev"
    names(train_data)[names(train_data)=="X_train$V85"] <- "Body.Acceleration.Jerk.Y.Stdev"
    names(train_data)[names(train_data)=="X_train$V86"] <- "Body.Acceleration.Jerk.Z.Stdev"
    names(train_data)[names(train_data)=="X_train$V121"] <- "Body.Gyroscope.X.Mean"
    names(train_data)[names(train_data)=="X_train$V122"] <- "Body.Gyroscope.Y.Mean"
    names(train_data)[names(train_data)=="X_train$V123"] <- "Body.Gyroscope.Z.Mean"
    names(train_data)[names(train_data)=="X_train$V124"] <- "Body.Gyroscope.X.Stdev"
    names(train_data)[names(train_data)=="X_train$V125"] <- "Body.Gyroscope.Y.Stdev"
    names(train_data)[names(train_data)=="X_train$V126"] <- "Body.Gyroscope.Z.Stdev"
    names(train_data)[names(train_data)=="X_train$V161"] <- "Body.Gyroscope.Jerk.X.Mean"
    names(train_data)[names(train_data)=="X_train$V162"] <- "Body.Gyroscope.Jerk.Y.Mean"
    names(train_data)[names(train_data)=="X_train$V163"] <- "Body.Gyroscope.Jerk.Z.Mean"
    names(train_data)[names(train_data)=="X_train$V164"] <- "Body.Gyroscope.Jerk.X.Stdev"
    names(train_data)[names(train_data)=="X_train$V165"] <- "Body.Gyroscope.Jerk.Y.Stdev"
    names(train_data)[names(train_data)=="X_train$V166"] <- "Body.Gyroscope.Jerk.Z.Stdev"
    names(train_data)[names(train_data)=="X_train$V201"] <- "Body.Acceleration.Magnitude.Mean"
    names(train_data)[names(train_data)=="X_train$V202"] <- "Body.Acceleration.Magnitude.Stdev"
    names(train_data)[names(train_data)=="X_train$V214"] <- "Gravity.Acceleration.Magnitude.Mean"
    names(train_data)[names(train_data)=="X_train$V215"] <- "Gravity.Acceleration.Magnitude.Stdev"
    names(train_data)[names(train_data)=="X_train$V227"] <- "Body.Acceleration.Jerk.Magnitude.Mean"
    names(train_data)[names(train_data)=="X_train$V228"] <- "Body.Acceleration.Jerk.Magnitude.Stdev"
    names(train_data)[names(train_data)=="X_train$V240"] <- "Body.Gyroscope.Magnitude.Mean"
    names(train_data)[names(train_data)=="X_train$V241"] <- "Body.Gyroscope.Magnitude.Stdev"
    names(train_data)[names(train_data)=="X_train$V253"] <- "Body.Gyroscope.Jerk.Magnitude.Mean"
    names(train_data)[names(train_data)=="X_train$V254"] <- "Body.Gyroscope.Jerk.Magnitude.Stdev"
    names(train_data)[names(train_data)=="X_train$V266"] <- "Freq.Body.Acceleration.X.Mean"
    names(train_data)[names(train_data)=="X_train$V267"] <- "Freq.Body.Acceleration.Y.Mean"
    names(train_data)[names(train_data)=="X_train$V268"] <- "Freq.Body.Acceleration.Z.Mean"
    names(train_data)[names(train_data)=="X_train$V269"] <- "Freq.Body.Acceleration.X.Stdev"
    names(train_data)[names(train_data)=="X_train$V270"] <- "Freq.Body.Acceleration.Y.Stdev"
    names(train_data)[names(train_data)=="X_train$V271"] <- "Freq.Body.Acceleration.Z.Stdev"
    names(train_data)[names(train_data)=="X_train$V345"] <- "Freq.Body.Acceleration.Jerk.X.Mean"
    names(train_data)[names(train_data)=="X_train$V346"] <- "Freq.Body.Acceleration.Jerk.Y.Mean"
    names(train_data)[names(train_data)=="X_train$V347"] <- "Freq.Body.Acceleration.Jerk.Z.Mean"
    names(train_data)[names(train_data)=="X_train$V348"] <- "Freq.Body.Acceleration.Jerk.X.Stdev"
    names(train_data)[names(train_data)=="X_train$V349"] <- "Freq.Body.Acceleration.Jerk.Y.Stdev"
    names(train_data)[names(train_data)=="X_train$V350"] <- "Freq.Body.Acceleration.Jerk.Z.Stdev"
    names(train_data)[names(train_data)=="X_train$V424"] <- "Freq.Body.Gyroscope.X.Mean"
    names(train_data)[names(train_data)=="X_train$V425"] <- "Freq.Body.Gyroscope.Y.Mean"
    names(train_data)[names(train_data)=="X_train$V426"] <- "Freq.Body.Gyroscope.Z.Mean"
    names(train_data)[names(train_data)=="X_train$V427"] <- "Freq.Body.Gyroscope.X.Stdev"
    names(train_data)[names(train_data)=="X_train$V428"] <- "Freq.Body.Gyroscope.Y.Stdev"
    names(train_data)[names(train_data)=="X_train$V429"] <- "Freq.Body.Gyroscope.Z.Stdev"
    names(train_data)[names(train_data)=="X_train$V503"] <- "Freq.Body.Acceleration.Magnitude.Mean"
    names(train_data)[names(train_data)=="X_train$V504"] <- "Freq.Body.Acceleration.Magnitude.Stdev"
    names(train_data)[names(train_data)=="X_train$V516"] <- "Freq.Body.Acceleration.Jerk.Magnitude.Mean"
    names(train_data)[names(train_data)=="X_train$V517"] <- "Freq.Body.Acceleration.Jerk.Magnitude.Stdev"
    names(train_data)[names(train_data)=="X_train$V529"] <- "Freq.Body.Gyroscope.Magnitude.Mean"
    names(train_data)[names(train_data)=="X_train$V530"] <- "Freq.Body.Gyroscope.Magnitude.Stdev"
    names(train_data)[names(train_data)=="X_train$V542"] <- "Freq.Body.Gyroscope.Jerk.Magnitude.Mean"
    names(train_data)[names(train_data)=="X_train$V543"] <- "Freq.Body.Gyroscope.Jerk.Magnitude.Stdev"
    train_data$Test.or.Train <- "Train"
    
    #Combine test and training datasets
    dataset <- rbind(test_data, train_data)
    
    #Add descriptive Activity field
    dataset$Activity <- ifelse(dataset$Activity.Label == "1", "WALKING",
                               ifelse(dataset$Activity.Label == "2", "WALKING_UPSTAIRS",
                                      ifelse(dataset$Activity.Label == "3", "WALKING_DOWNSTAIRS",
                                             ifelse(dataset$Activity.Label == "4", "SITTING",
                                                    ifelse(dataset$Activity.Label == "5", "STANDING",
                                                           "LAYING")))))
    
    #Calculate averages of each column grouped by each subject and activity
    dataset2 <- ddply(dataset, c("Subject", "Activity"), summarise,
                      Body.Acceleration.X.Mean.Avg = mean(Body.Acceleration.X.Mean),
                      Body.Acceleration.Y.Mean.Avg = mean(Body.Acceleration.Y.Mean),
                      Body.Acceleration.Z.Mean.Avg = mean(Body.Acceleration.Z.Mean),
                      Body.Acceleration.X.Stdev.Avg = mean(Body.Acceleration.X.Stdev),
                      Body.Acceleration.Y.Stdev.Avg = mean(Body.Acceleration.Y.Stdev),
                      Body.Acceleration.Z.Stdev.Avg = mean(Body.Acceleration.Z.Stdev),
                      Gravity.Acceleration.X.Mean.Avg = mean(Gravity.Acceleration.X.Mean),
                      Gravity.Acceleration.Y.Mean.Avg = mean(Gravity.Acceleration.Y.Mean),
                      Gravity.Acceleration.Z.Mean.Avg = mean(Gravity.Acceleration.Z.Mean),
                      Gravity.Acceleration.X.Stdev.Avg = mean(Gravity.Acceleration.X.Stdev),
                      Gravity.Acceleration.Y.Stdev.Avg = mean(Gravity.Acceleration.Y.Stdev),
                      Gravity.Acceleration.Z.Stdev.Avg = mean(Gravity.Acceleration.Z.Stdev),
                      Body.Acceleration.Jerk.X.Mean.Avg = mean(Body.Acceleration.Jerk.X.Mean),
                      Body.Acceleration.Jerk.Y.Mean.Avg = mean(Body.Acceleration.Jerk.Y.Mean),
                      Body.Acceleration.Jerk.Z.Mean.Avg = mean(Body.Acceleration.Jerk.Z.Mean),
                      Body.Acceleration.Jerk.X.Stdev.Avg = mean(Body.Acceleration.Jerk.X.Stdev),
                      Body.Acceleration.Jerk.Y.Stdev.Avg = mean(Body.Acceleration.Jerk.Y.Stdev),
                      Body.Acceleration.Jerk.Z.Stdev.Avg = mean(Body.Acceleration.Jerk.Z.Stdev),
                      Body.Gyroscope.X.Mean.Avg = mean(Body.Gyroscope.X.Mean),
                      Body.Gyroscope.Y.Mean.Avg = mean(Body.Gyroscope.Y.Mean),
                      Body.Gyroscope.Z.Mean.Avg = mean(Body.Gyroscope.Z.Mean),
                      Body.Gyroscope.X.Stdev.Avg = mean(Body.Gyroscope.X.Stdev),
                      Body.Gyroscope.Y.Stdev.Avg = mean(Body.Gyroscope.Y.Stdev),
                      Body.Gyroscope.Z.Stdev.Avg = mean(Body.Gyroscope.Z.Stdev),
                      Body.Gyroscope.Jerk.X.Mean.Avg = mean(Body.Gyroscope.Jerk.X.Mean),
                      Body.Gyroscope.Jerk.Y.Mean.Avg = mean(Body.Gyroscope.Jerk.Y.Mean),
                      Body.Gyroscope.Jerk.Z.Mean.Avg = mean(Body.Gyroscope.Jerk.Z.Mean),
                      Body.Gyroscope.Jerk.X.Stdev.Avg = mean(Body.Gyroscope.Jerk.X.Stdev),
                      Body.Gyroscope.Jerk.Y.Stdev.Avg = mean(Body.Gyroscope.Jerk.Y.Stdev),
                      Body.Gyroscope.Jerk.Z.Stdev.Avg = mean(Body.Gyroscope.Jerk.Z.Stdev),
                      Body.Acceleration.Magnitude.Mean.Avg = mean(Body.Acceleration.Magnitude.Mean),
                      Body.Acceleration.Magnitude.Stdev.Avg = mean(Body.Acceleration.Magnitude.Stdev),
                      Gravity.Acceleration.Magnitude.Mean.Avg = mean(Gravity.Acceleration.Magnitude.Mean),
                      Gravity.Acceleration.Magnitude.Stdev.Avg = mean(Gravity.Acceleration.Magnitude.Stdev),
                      Body.Acceleration.Jerk.Magnitude.Mean.Avg = mean(Body.Acceleration.Jerk.Magnitude.Mean),
                      Body.Acceleration.Jerk.Magnitude.Stdev.Avg = mean(Body.Acceleration.Jerk.Magnitude.Stdev),
                      Body.Gyroscope.Magnitude.Mean.Avg = mean(Body.Gyroscope.Magnitude.Mean),
                      Body.Gyroscope.Magnitude.Stdev.Avg = mean(Body.Gyroscope.Magnitude.Stdev),
                      Body.Gyroscope.Jerk.Magnitude.Mean.Avg = mean(Body.Gyroscope.Jerk.Magnitude.Mean),
                      Body.Gyroscope.Jerk.Magnitude.Stdev.Avg = mean(Body.Gyroscope.Jerk.Magnitude.Stdev),
                      Freq.Body.Acceleration.X.Mean.Avg = mean(Freq.Body.Acceleration.X.Mean),
                      Freq.Body.Acceleration.Y.Mean.Avg = mean(Freq.Body.Acceleration.Y.Mean),
                      Freq.Body.Acceleration.Z.Mean.Avg = mean(Freq.Body.Acceleration.Z.Mean),
                      Freq.Body.Acceleration.X.Stdev.Avg = mean(Freq.Body.Acceleration.X.Stdev),
                      Freq.Body.Acceleration.Y.Stdev.Avg = mean(Freq.Body.Acceleration.Y.Stdev),
                      Freq.Body.Acceleration.Z.Stdev.Avg = mean(Freq.Body.Acceleration.Z.Stdev),
                      Freq.Body.Acceleration.Jerk.X.Mean.Avg = mean(Freq.Body.Acceleration.Jerk.X.Mean),
                      Freq.Body.Acceleration.Jerk.Y.Mean.Avg = mean(Freq.Body.Acceleration.Jerk.Y.Mean),
                      Freq.Body.Acceleration.Jerk.Z.Mean.Avg = mean(Freq.Body.Acceleration.Jerk.Z.Mean),
                      Freq.Body.Acceleration.Jerk.X.Stdev.Avg = mean(Freq.Body.Acceleration.Jerk.X.Stdev),
                      Freq.Body.Acceleration.Jerk.Y.Stdev.Avg = mean(Freq.Body.Acceleration.Jerk.Y.Stdev),
                      Freq.Body.Acceleration.Jerk.Z.Stdev.Avg = mean(Freq.Body.Acceleration.Jerk.Z.Stdev),
                      Freq.Body.Gyroscope.X.Mean.Avg = mean(Freq.Body.Gyroscope.X.Mean),
                      Freq.Body.Gyroscope.Y.Mean.Avg = mean(Freq.Body.Gyroscope.Y.Mean),
                      Freq.Body.Gyroscope.Z.Mean.Avg = mean(Freq.Body.Gyroscope.Z.Mean),
                      Freq.Body.Gyroscope.X.Stdev.Avg = mean(Freq.Body.Gyroscope.X.Stdev),
                      Freq.Body.Gyroscope.Y.Stdev.Avg = mean(Freq.Body.Gyroscope.Y.Stdev),
                      Freq.Body.Gyroscope.Z.Stdev.Avg = mean(Freq.Body.Gyroscope.Z.Stdev),
                      Freq.Body.Acceleration.Magnitude.Mean.Avg = mean(Freq.Body.Acceleration.Magnitude.Mean),
                      Freq.Body.Acceleration.Magnitude.Stdev.Avg = mean(Freq.Body.Acceleration.Magnitude.Stdev),
                      Freq.Body.Acceleration.Jerk.Magnitude.Mean.Avg = mean(Freq.Body.Acceleration.Jerk.Magnitude.Mean),
                      Freq.Body.Acceleration.Jerk.Magnitude.Stdev.Avg = mean(Freq.Body.Acceleration.Jerk.Magnitude.Stdev),
                      Freq.Body.Gyroscope.Magnitude.Mean.Avg = mean(Freq.Body.Gyroscope.Magnitude.Mean),
                      Freq.Body.Gyroscope.Magnitude.Stdev.Avg = mean(Freq.Body.Gyroscope.Magnitude.Stdev),
                      Freq.Body.Gyroscope.Jerk.Magnitude.Mean.Avg = mean(Freq.Body.Gyroscope.Jerk.Magnitude.Mean),
                      Freq.Body.Gyroscope.Jerk.Magnitude.Stdev.Avg = mean(Freq.Body.Gyroscope.Jerk.Magnitude.Stdev))
    
    dataset2
}