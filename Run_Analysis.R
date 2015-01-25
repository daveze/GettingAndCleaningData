#read and merge the data

#read the train and test data

#read the xData
xTrain <- read.table("data/train/X_train.txt")
xTest <- read.table("data/test/X_test.txt")

#read the features data
features<- read.table("data/features.txt")


#merge trainging and test data
#nrow(xTrain) 7352
#nrow(xTest) 2947
xData = rbind(xTrain,xTest)
#check the rbind coutn correct
#nrow(data)
#ncol(data)
#name the data using features
ncol(features)
features <- features[,2]
names(xData)<-features

#Get only those with  feature names matching mean() or std():
fMatch <- grep("(mean|std)\\(\\)", names(xData))
xData<- xData[, fMatch]


#read the y DAta
yTrain <- read.table("data/train/y_train.txt")
yTest <- read.table("data/test/Y_test.txt")
yData<- rbind(yTrain, yTest)[, 1]

#add meaningful names
activityNames <-
  c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
activities <- activityNames[yData]

# Label data set with appropriate variable names
# t -> time, f-> frequency
# mean()-> mean
# std->stdDev
# remove redundant dashes
# renam BodyBody to Body
names(xData) <- gsub("^t", "Time", names(xData))
names(xData) <- gsub("^f", "Frequency", names(xData))
names(xData) <- gsub("-mean\\(\\)", "Mean", names(xData))
names(xData) <- gsub("-std\\(\\)", "StdDev", names(xData))
names(xData) <- gsub("-", "", names(xData))
names(xData) <- gsub("BodyBody", "Body", names(xData))


# Add activities and subject with nice names
subjectTrain <- read.table("data/train/subject_train.txt")
subjectTest  <- read.table("data/test/subject_test.txt")
subjects <- rbind(subjectTrain, subjectTest)[, 1]

tidy <- cbind(Subject = subjects, Activity = activities, xData)
#From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

library(plyr)
# get the column meands  for all except the subject and activity columns
limitedColMeans <- function(xData) { colMeans(xData[,-c(1,2)]) }
tidy2<- ddply(tidy, .(Subject, Activity), limitedColMeans)
names(tidy2)[-c(1,2)] <- paste0("Mean", names(tidy2)[-c(1,2)])

# Write file
write.table(tidy2, "tidy2.txt", row.names = FALSE)


