# original data

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


# Transformations

1. merge train and test  data
2. associate colomn description basing on  ```features.txt```
3. subset data and keep only mean and standard deviation measurement refering to the colomn names
4. clean colomn names : capital leters for Mean and Std, remove special characters as ( ' -
5. associate IDs of activities by merging ```test/y_test.txt``` and ```train/y_train.txt```
6. read ```activity_labels.txt``` to associate for each activity ID an activity label
7. merge ```test/subject_test.txt``` and ```train/subject_train.txt``` to associate a subject ID for each measurement
8. reshape data to calculate the average of each variable for each activity and each subject
9. write the tidy data

# Variables

**ActivityID**  
the activity ID performed by each person: 1,2,3,4,5,6 

**ActivityName**  
the activity name performed by each person. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
          
**SubjectID**     
the subject ID of who performed the activity for each window sample.
**tBodyAccMeanX**  
**tBodyAccMeanY**  
**tBodyAccMeanZ**   
the average of means of 3-axial body acceleration signal (time domain for t)      
**tBodyAccStdX**  
**tBodyAccStdY**   
**tBodyAccStdZ** 
the average of standard deviations of 3-axial body acceleration signal (time domain for t)              
**tGravityAccMeanX**
**tGravityAccMeanY**         
**tGravityAccMeanZ**
the average of means of  3-axial gravity acceleration signal (time domain for t)  
**tGravityAccStdX** 
**tGravityAccStdY**
**tGravityAccStdZ**
the average of standard deviations of 3-axial gravity acceleration signal(time domain for t)           
**tBodyAccJerkMeanX**
**tBodyAccJerkMeanY**
**tBodyAccJerkMeanZ**
the average of means of 3-axial body Jerk signal (time domain for t)  
**tBodyAccJerkStdX**
**tBodyAccJerkStdY**         
**tBodyAccJerkStdZ**
the average of standard deviations of 3-axial body Jerk signal (time domain for t)  
**tBodyGyroMeanX**
**tBodyGyroMeanY**
**tBodyGyroMeanZ**
the average of means of 3-axial body gyroscope signal (time domain for t)  
**tBodyGyroStdX**            
**tBodyGyroStdY**           
**tBodyGyroStdZ**
the average of standard deviations of 3-axial body gyroscope signal (time domain for t)
**tBodyGyroJerkMeanX**       
**tBodyGyroJerkMeanY**       
**tBodyGyroJerkMeanZ**
the average of means of 3-axial body gyroscope Jerk signal (time domain for t)
**tBodyGyroJerkStdX**        
**tBodyGyroJerkStdY**        
**tBodyGyroJerkStdZ**
the average of standard deviations of 3-axial body gyroscope Jerk signal (time domain for t)
**tBodyAccMagMean**
the average of means of body acceleration  magnitude signal (time domain for t)
**tBodyAccMagStd**           
the average of standard deviations of body acceleration  magnitude signal (time domain for t)
**tGravityAccMagMean**
the average of means of gravity acceleration  magnitude signal (time domain for t)
**tGravityAccMagStd**        
the average of standard deviations of gravity acceleration  magnitude signal (time domain for t)
**tBodyAccJerkMagMean**     
the average of means of body acceleration Jerk magnitude signal (time domain for t)
**tBodyAccJerkMagStd**       
the average of standard deviations of body acceleration Jerk magnitude signal (time domain for t)
**tBodyGyroMagMean**
the average of means of body gyroscope magnitude signal (time domain for t)
**tBodyGyroMagStd**          
the average of standard deviations of body gyroscope magnitude signal (time domain for t)
**tBodyGyroJerkMagMean**    
the average of means of body gyroscope Jerk magnitude signal (time domain for t)
**tBodyGyroJerkMagStd**      
the average of standard deviations of body gyroscope Jerk magnitude signal (time domain for t)
**fBodyAccMeanX**            
**fBodyAccMeanY**            
**fBodyAccMeanZ**           
**fBodyAccStdX**             
**fBodyAccStdY**             
**fBodyAccStdZ**             
**fBodyAccJerkMeanX**       
**fBodyAccJerkMeanY**        
**fBodyAccJerkMeanZ**        
**fBodyAccJerkStdX**         
**fBodyAccJerkStdY**        
**fBodyAccJerkStdZ**         
**fBodyGyroMeanX**           
**fBodyGyroMeanY**           
**fBodyGyroMeanZ**          
**fBodyGyroStdX**            
**fBodyGyroStdY**            
**fBodyGyroStdZ**            
**fBodyAccMagMean**         
**fBodyAccMagStd**           
**fBodyBodyAccJerkMagMean**  
**fBodyBodyAccJerkMagStd**   
**fBodyBodyGyroMagMean**    
**fBodyBodyGyroMagStd**      
**fBodyBodyGyroJerkMagMean** 
**fBodyBodyGyroJerkMagStd**  
the same variables as above applied to frequency domain (f)