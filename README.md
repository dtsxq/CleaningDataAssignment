# CleaningDataAssignment
A repository for the assignment submitted by Damian toward the peer-graded programming assignment which is a part of the 'Getting and Cleaning Data' course on Coursera.

The dataset used for this assignment is [Human Activity Recognition Using Smartphones](https://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones#).

##Files:

* **run_analysis.R** - the script which checks for, and downloads & unpacks the data set should it not be present in the working directory. It then reads the files within the data set folder and:
  * merges the 'train' & 'test' data sets together. 
  * extracts the 'mean' & 'standard deviation (std)' for each measurement.
  * replaces activity code numbers with more descriptive names.
  * labels column names more suitably.
  * from that data set, a new data set (and file) is created which contains the average of each variable for each activity and each subject.
* **CodeBook.md** - describes all the variables created in **run_analysis.R**, as well as all the changes made to the data, and the final **finalDataSet.txt** file creation.
* **finalDataSet.txt** - contains the final tidy data; result of running the **run_analysis.R** script.
