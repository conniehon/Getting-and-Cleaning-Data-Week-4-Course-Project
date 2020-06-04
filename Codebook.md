## Codebook

**Background of the original data:**

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

After downloading a zip file and unzipping it, the original datasets comprised of: 

Six .txt element datasets 
1. X_test.txt
2. y_test.txt
3. subject_test.txt
4. X_train.txt
5. y_train.txt
6. subject_train.txt

One document of the variable names, 

7. features.txt

One document of one variable and its labels.

8. activity_labels.txt

When combined, they formed a total 10,299 observations across 563 variables, from 30 data subjects.

**Repo commits**

Subsequently these were tidied, cleaned and summarized into what you see committed to the repo:

1. tidydata.txt (180 observations of 81 variables from 30 data subjects)
2. run_analysis.R (code)

**More on the tidied dataset:**

The dataset contains the average of each variable, grouped by the activity, followed by the subject.

**The subjects are:**

A group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

**The types of activity are:**

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

**The variable types are:**

[1] "Activity"                                                 
[2] "Subject"                                                  
[3] "TimeDomainBodyAccelerometerMeanX"                         
[4] "TimeDomainBodyAccelerometerMeanY"                         
[5] "TimeDomainBodyAccelerometerMeanZ"                         
[6] "TimeDomainBodyAccelerometerStandardDeviationX"            
[7] "TimeDomainBodyAccelerometerStandardDeviationY"            
[8] "TimeDomainBodyAccelerometerStandardDeviationZ"            
[9] "TimeDomainGravityAccelerometerMeanX"                      
[10] "TimeDomainGravityAccelerometerMeanY"                      
[11] "TimeDomainGravityAccelerometerMeanZ"                      
[12] "TimeDomainGravityAccelerometerStandardDeviationX"         
[13] "TimeDomainGravityAccelerometerStandardDeviationY"         
[14] "TimeDomainGravityAccelerometerStandardDeviationZ"         
[15] "TimeDomainBodyAccelerometerJerkMeanX"                     
[16] "TimeDomainBodyAccelerometerJerkMeanY"                     
[17] "TimeDomainBodyAccelerometerJerkMeanZ"                     
[18] "TimeDomainBodyAccelerometerJerkStandardDeviationX"        
[19] "TimeDomainBodyAccelerometerJerkStandardDeviationY"        
[20] "TimeDomainBodyAccelerometerJerkStandardDeviationZ"        
[21] "TimeDomainBodyGyroscopeMeanX"                             
[22] "TimeDomainBodyGyroscopeMeanY"                             
[23] "TimeDomainBodyGyroscopeMeanZ"                             
[24] "TimeDomainBodyGyroscopeStandardDeviationX"                
[25] "TimeDomainBodyGyroscopeStandardDeviationY"                
[26] "TimeDomainBodyGyroscopeStandardDeviationZ"                
[27] "TimeDomainBodyGyroscopeJerkMeanX"                         
[28] "TimeDomainBodyGyroscopeJerkMeanY"                         
[29] "TimeDomainBodyGyroscopeJerkMeanZ"                         
[30] "TimeDomainBodyGyroscopeJerkStandardDeviationX"            
[31] "TimeDomainBodyGyroscopeJerkStandardDeviationY"            
[32] "TimeDomainBodyGyroscopeJerkStandardDeviationZ"            
[33] "TimeDomainBodyAccelerometerMagnitudeMean"                 
[34] "TimeDomainBodyAccelerometerMagnitudeStandardDeviation"    
[35] "TimeDomainGravityAccelerometerMagnitudeMean"              
[36] "TimeDomainGravityAccelerometerMagnitudeStandardDeviation" 
[37] "TimeDomainBodyAccelerometerJerkMagnitudeMean"             
[38] "TimeDomainBodyAccelerometerJerkMagnitudeStandardDeviation"
[39] "TimeDomainBodyGyroscopeMagnitudeMean"                     
[40] "TimeDomainBodyGyroscopeMagnitudeStandardDeviation"        
[41] "TimeDomainBodyGyroscopeJerkMagnitudeMean"                 
[42] "TimeDomainBodyGyroscopeJerkMagnitudeStandardDeviation"    
[43] "FrequencyBodyAccelerometerMeanX"                          
[44] "FrequencyBodyAccelerometerMeanY"                          
[45] "FrequencyBodyAccelerometerMeanZ"                          
[46] "FrequencyBodyAccelerometerStandardDeviationX"             
[47] "FrequencyBodyAccelerometerStandardDeviationY"             
[48] "FrequencyBodyAccelerometerStandardDeviationZ"             
[49] "FrequencyBodyAccelerometerMeanFrequencyX"                 
[50] "FrequencyBodyAccelerometerMeanFrequencyY"                 
[51] "FrequencyBodyAccelerometerMeanFrequencyZ"                 
[52] "FrequencyBodyAccelerometerJerkMeanX"                      
[53] "FrequencyBodyAccelerometerJerkMeanY"                      
[54] "FrequencyBodyAccelerometerJerkMeanZ"                      
[55] "FrequencyBodyAccelerometerJerkStandardDeviationX"         
[56] "FrequencyBodyAccelerometerJerkStandardDeviationY"         
[57] "FrequencyBodyAccelerometerJerkStandardDeviationZ"         
[58] "FrequencyBodyAccelerometerJerkMeanFrequencyX"             
[59] "FrequencyBodyAccelerometerJerkMeanFrequencyY"             
[60] "FrequencyBodyAccelerometerJerkMeanFrequencyZ"             
[61] "FrequencyBodyGyroscopeMeanX"                              
[62] "FrequencyBodyGyroscopeMeanY"                              
[63] "FrequencyBodyGyroscopeMeanZ"                              
[64] "FrequencyBodyGyroscopeStandardDeviationX"                 
[65] "FrequencyBodyGyroscopeStandardDeviationY"                 
[66] "FrequencyBodyGyroscopeStandardDeviationZ"                 
[67] "FrequencyBodyGyroscopeMeanFrequencyX"                     
[68] "FrequencyBodyGyroscopeMeanFrequencyY"                     
[69] "FrequencyBodyGyroscopeMeanFrequencyZ"                     
[70] "FrequencyBodyAccelerometerMagnitudeMean"                  
[71] "FrequencyBodyAccelerometerMagnitudeStandardDeviation"     
[72] "FrequencyBodyAccelerometerMagnitudeMeanFrequency"         
[73] "FrequencyBodyAccelerometerJerkMagnitudeMean"              
[74] "FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation" 
[75] "FrequencyBodyAccelerometerJerkMagnitudeMeanFrequency"     
[76] "FrequencyBodyGyroscopeMagnitudeMean"                      
[77] "FrequencyBodyGyroscopeMagnitudeStandardDeviation"         
[78] "FrequencyBodyGyroscopeMagnitudeMeanFrequency"             
[79] "FrequencyBodyGyroscopeJerkMagnitudeMean"                  
[80] "FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation"     
[81] "FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency" 
