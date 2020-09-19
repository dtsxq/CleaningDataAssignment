library(dplyr)

setwd('C:/Users/damia/Desktop/R/Coursera/Getting and Cleaning Data/ProgrammingAssignment/data/')

# Features include all the different kinds of variables that are present in 
# data files.
features<-read.table('features.txt', col.names=c('n', 'functions'))

# The different activities done by the 30 subjects which were investigated.
activities<-read.table('activity_labels.txt', col.names = c('Code', 'Activity'))

# ID values for what data represents which subject. 9 subjects for the Test study.
subjectTest<-read.table('test/subject_test.txt', col.names = 'Subject')

# 2947 rows of data for the 9 subjects. 
xTest<-read.table('test/X_test.txt', col.names = features$functions)

# 2947 rows of data. Codes represent the different activities done.
yTest<-read.table('test/y_test.txt', col.names = 'Code')

# # ID values for what data represents which subject. 21 subjects for the Train study.
subjectTrain<-read.table('train/subject_train.txt', col.names = 'Subject')

# 7352 rows of data for the 21 subjects. 
xTrain<-read.table('train/X_train.txt', col.names = features$functions)

# 7352 rows of data. Codes represent the different activities done.
yTrain<-read.table('train/y_train.txt', col.names = 'Code')

# Merges Train & Test sets.
xSet<-rbind(xTrain,xTest)
ySet<-rbind(yTrain,yTest)

# Merges subject data for Train & Test sets. Then creates the final overall merged
# data set.
subject<-rbind(subjectTrain,subjectTest)
mergedData<-cbind(subject, ySet, xSet)

# Extracts mean and std data from mergedData, as well as Subject & Code columns.
extractedData<-select(mergedData, Subject, Code, contains('mean'), contains('std'))

# Replace code names for activities with more descriptive names.
replaceFactor<-factor(extractedData$Code, levels=1:6,
                      labels = c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS',
                                 'SITTING', 'STANDING', 'LAYING'))
extractedData$Code<-replaceFactor

# Replace data variables with more suitable names. 
names(extractedData)[2]<-'Activity'
names(extractedData)<-gsub('^t', 'Time', names(extractedData))
names(extractedData)<-gsub('^f', 'Frequency', names(extractedData))
names(extractedData)<-gsub('angle', 'Angle', names(extractedData))
names(extractedData)<-gsub('Acc', 'Accelerometer', names(extractedData))
names(extractedData)<-gsub('Gyro', 'Gyroscope', names(extractedData))
names(extractedData)<-gsub('Mag', 'Magnitude', names(extractedData))
names(extractedData)<-gsub('gravity', 'Gravity', names(extractedData))
names(extractedData)<-gsub('tBody', 'TimeBody', names(extractedData))
names(extractedData)<-gsub('BodyBody', 'Body', names(extractedData))

names(extractedData)<-gsub('(\\.)[Mm]ean(\\.){1,3}', '_Mean', names(extractedData))
names(extractedData)<-gsub('(\\.)[Mm]eanFreq(\\.){1,3}', '_MeanFreq', names(extractedData))
names(extractedData)<-gsub('_MeanX', '_Mean_X', names(extractedData))
names(extractedData)<-gsub('_MeanY', '_Mean_Y', names(extractedData))
names(extractedData)<-gsub('_MeanZ', '_Mean_Z', names(extractedData))
names(extractedData)<-gsub('_MeanFreqX', '_MeanFreq_X', names(extractedData))
names(extractedData)<-gsub('_MeanFreqY', '_MeanFreq_Y', names(extractedData))
names(extractedData)<-gsub('_MeanFreqZ', '_MeanFreq_Z', names(extractedData))

names(extractedData)<-gsub('(\\.)std(\\.){1,3}', '_STD', names(extractedData))
names(extractedData)<-gsub('_STDX', '_STD_X', names(extractedData))
names(extractedData)<-gsub('_STDY', '_STD_Y', names(extractedData))
names(extractedData)<-gsub('_STDZ', '_STD_Z', names(extractedData))

names(extractedData)<-gsub('(\\.){1,2}Gravity(\\.)', '_Gravity', names(extractedData))
names(extractedData)<-gsub('(\\.){1,2}GravityMean(\\.)', '_GravityMean', names(extractedData))
names(extractedData)<-gsub('(\\.)', '_', names(extractedData))

# Average of each variable for each activity and each subject.
finalDataSet<-aggregate(. ~Subject+Activity, extractedData, mean)

write.table(finalDataSet, 'finalDataSet.txt', row.names=F)

