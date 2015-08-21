## Explanation of processing flow

1. Read in training data along with variable names of feature vector
2. Construct data frame with training data with subject and activity in the first two columns followed by the feature vector
3. Read in test data
4. Construct data frame with test data with subject and activity in the first two columns followed by the feature vector
5. Combine training and test data frames together into a single data frame
6. Get all column names with "mean"
7. Remove column names with "meanFreq" from the previous set
8. Extract columns with only "mean"
9. Extract columns with "std" in the column name
10. Construct data frame using subject, activity, and mean and std columns
11. Read in file that maps numeric activity value to descriptive string value
12. Replace numeric activity value with descriptive string value in data frame
13. Loop through every subject/activity pair and construct average of each mean and std feature column
14. Construct new data frame with subject, activity, and average of each mean and std feature column
15. Write new data frame out to file, averageData.txt

## Codebook for averageData.txt

averageData.txt contains 68 columns of data

First two columns are subject and activity respectively
  subject: numeric value from 1 - 30 indicating which subject this record measured
  activity: string indicating what activity was taking place during this measurement
  
The next 66 columns contain averages of each subject/activity combination for the 66 mean and std values of the different measurements in the raw data

The following is copied from the desciption of the raw data:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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

Columns 3-68 in averageData.txt:                   
[3] "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"          
[5] "tBodyAcc.mean...Z"           "tBodyAcc.std...X"           
[7] "tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
[9] "tGravityAcc.mean...X"        "tGravityAcc.mean...Y"       
[11] "tGravityAcc.mean...Z"        "tGravityAcc.std...X"        
[13] "tGravityAcc.std...Y"         "tGravityAcc.std...Z"        
[15] "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"      
[17] "tBodyAccJerk.mean...Z"       "tBodyAccJerk.std...X"       
[19] "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
[21] "tBodyGyro.mean...X"          "tBodyGyro.mean...Y"         
[23] "tBodyGyro.mean...Z"          "tBodyGyro.std...X"          
[25] "tBodyGyro.std...Y"           "tBodyGyro.std...Z"          
[27] "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"     
[29] "tBodyGyroJerk.mean...Z"      "tBodyGyroJerk.std...X"      
[31] "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
[33] "tBodyAccMag.mean.."          "tBodyAccMag.std.."          
[35] "tGravityAccMag.mean.."       "tGravityAccMag.std.."       
[37] "tBodyAccJerkMag.mean.."      "tBodyAccJerkMag.std.."      
[39] "tBodyGyroMag.mean.."         "tBodyGyroMag.std.."         
[41] "tBodyGyroJerkMag.mean.."     "tBodyGyroJerkMag.std.."     
[43] "fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
[45] "fBodyAcc.mean...Z"           "fBodyAcc.std...X"           
[47] "fBodyAcc.std...Y"            "fBodyAcc.std...Z"           
[49] "fBodyAccJerk.mean...X"       "fBodyAccJerk.mean...Y"      
[51] "fBodyAccJerk.mean...Z"       "fBodyAccJerk.std...X"       
[53] "fBodyAccJerk.std...Y"        "fBodyAccJerk.std...Z"       
[55] "fBodyGyro.mean...X"          "fBodyGyro.mean...Y"         
[57] "fBodyGyro.mean...Z"          "fBodyGyro.std...X"          
[59] "fBodyGyro.std...Y"           "fBodyGyro.std...Z"          
[61] "fBodyAccMag.mean.."          "fBodyAccMag.std.."          
[63] "fBodyBodyAccJerkMag.mean.."  "fBodyBodyAccJerkMag.std.."  
[65] "fBodyBodyGyroMag.mean.."     "fBodyBodyGyroMag.std.."     
[67] "fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.std.." 