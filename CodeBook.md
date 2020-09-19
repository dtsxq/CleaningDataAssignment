
# **Code Book**

The run_analysis.R script cleans and prepares data from the data set: [Human Activity Recognition Using Smartphones](https://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones#).

This script does the following things:

* **1.** Downloads the raw data set, unzips it into the folder *'UCI HAR Dataset'*, then reads the files. The following files were assigned to these variables:
  * 'features.txt' assigned to the *features* variable. Contains the features data taken from the accelerometer and gyroscope. **Dimensions: 561 rows, 2 columns**.
  * 'activity_labels.txt' assigned to the *activities* variable. These are the activities that were performed by the subjects in this study. **Dimensions: 6 rows, 2 columns**.
  * 'subject_test.txt' assigned to the *subjectTest* variable. This variable contains data on 9 of the total 30 subjects that were being recorded. Identifies which recorded observations belong to which subject. **Dimensions: 2,947 rows, 1 column**.
  * 'X_test.txt' assigned to the *xTest* variable. This variable contains the features data of the 9 test subjects. **Dimensions: 2,947 rows, 561 columns**.
  * 'y_test.txt' assigned to the *yTest* variable. This variable contains the activity codes for the activities done by the 9 test subjects. **Dimensions: 2,947 rows, 1 column**.
  * 'subject_train.txt' assigned to the *subjectTrain* variable. This variable contains data on 21 of the total 30 subjects that were being recorded. Identifies which recorded observations belong to which subject. **Dimensions: 7,352 rows, 1 column.**
  * 'X_train.txt' assigned to the *xTrain* variable. This variable contains the features data of the 21 train subjects. **Dimensions: 7,352 rows, 561 columns**.
  * 'y_train.txt' assigned to the *yTrain* variable. This variable contains the activity codes for the activities done by the 21 train subjects. **Dimensions: 7,352 rows, 1 column**.
  <p>&nbsp;</p>
  
* **2.** Merges the training and test sets to create the one 'mergedData' data set. The following variables have been created:
  * The *xSet* variable is a data frame made up of merged *xTrain* & *xTest* data frame variables. **Dimensions: 10,299 rows, 561 columns**.
  * The *ySet* variable is a data frame made up of merged *yTrain* & *yTest* data frame variables. **Dimensions: 10,299 rows, 1 column**.
  * The *subjectData* variable is a data frame made up of merged *subjectTrain* & *subjectTest* variables. **Dimensions: 10,299 rows, 1 column**.
  * The *mergedData* variable is a data frame made up of column bound *subjectData*, *ySet*, & *xSet* variables. **Dimensions: 10,299 rows, 563 columns**.
  <p>&nbsp;</p>

* **3.** Extracts the mean and standard deviation for each measurement, making up the 'extractedData' data set. The following have been created:
  * The *extractedData* contains all the features which include **mean** & **standard deviation (std)** values, along with subject & activity data. **Dimensions: 10,299 rows, 88 columns**.
  <p>&nbsp;</p>

* **4.** Assigns more descriptive activity names (instead of the code numbers) to the 'extractedData' data set. The following is done:
  * The code numbers in the 'Code' column in *extractedData* are replaced with more descriptive and easily understandable activity names. These can be found in the *activities* variable.
  <p>&nbsp;</p>

* **5.** Labels the variable names in *extractedData* with more descriptive and easy to understand names. The variable names have been changed in the following way:
  * 'Code' column name has been changed to 'Activity'.
  * All variables that started with a 't' had the 't' changed to 'Time'.
  * All variables that started with a 'f' had the 'f' changed to 'Frequency'.
  * 'angle' column name has been changed to 'Angle'.
  * 'Acc' column name has been changed to 'Accelerometer'.
  * 'Gyro' column name has been changed to 'Gyroscope'.
  * 'Mag' column name has been changed to 'Magnitude'.
  * 'gravity' column name has been changed to 'Gravity'.
  * All variables that contained a 'tBody' had the 'tBody' changed to 'TimeBody'.
  * All variables that contained 'BodyBody' had the 'BodyBody' changed to 'Body' (removed the repeat).
  * All variables that contained a full stop ('.'), followed by 'M/mean', followed by a sequence of full stops ('.') ranging from 1-3 of them, had that matched string changed to '_Mean'.
  * All variables that contained a full stop ('.'), followed by 'M/meanFreq', followed by a sequence of full stops ('.') ranging from 1-3 of them, had that matched string changed to '_MeanFreq'.
  * All variables containing '_Mean', followed by either a 'X/Y/Z', were replaced with '_Mean_' followed by 'X/Y/Z' (added an underscore between 'Mean' and the final letter X/Y/Z).
  * All variables containing '_MeanFreq', followed by either a 'X/Y/Z', were replaced with '_MeanFreq_' followed by 'X/Y/Z' (added an underscore between 'MeanFreq' and the final letter X/Y/Z).
  * All variables that contained a full stop ('.'), followed by 'std', followed by a sequence of full stops ('.') ranging from 1-3 of them, had that matched string changed to '_STD'.
  All variables containing '_STD', followed by either a 'X/Y/Z', were replaced with '_STD_' followed by 'X/Y/Z' (added an underscore between 'STD' and the final letter X/Y/Z).
  * All variables that contained a sequence of full stops ('.') ranging from 1-2 of them, followed by 'Gravity', followed by a full stop ('.'), had that matched string changed to '_Gravity'.
  * All variables that contained a sequence of full stops ('.') ranging from 1-2 of them, followed by 'GravityMean', followed by a full stop ('.'), had that matched string changed to '_GravityMean'.
  * Any remaining full stops ('.') in the column names were replaced with an underscore ('_').
  <p>&nbsp;</p>

* **6.** Finally, creates the 'finalDataSet.txt' file which is a tidy data set containing the average of each variable for each activity and each subject. This is done in the following way:
  * The *finalDataSet* variable is created. This is a tidy data set which contains the average of each variable for each activity and each subject. **Dimensions: 180 rows, 88 columns**.
  * The *finalDataSet* data frame is exported as the 'finalDataSet.txt' file.
  <p>&nbsp;</p>


