generateTidyData <- function(){
# Loading activity labels
activityLabels <- read.table("activity_labels.txt")[,2]

# Loading data column names i.e. the features in the dataset
features <- read.table("features.txt")[,2]

# Extracting only the measurements on the mean and standard deviation for each measurement
extractFeatures <- grepl("mean|std", features)

# Loading and processing X_test & y_test data
XTest <- read.table("L:\\TechVDOs\\R\\getncleandata\\UCI HAR Dataset\\test\\X_test.txt")
YTest <- read.table("L:\\TechVDOs\\R\\getncleandata\\UCI HAR Dataset\\test\\y_test.txt")
subjectTest <- read.table("L:\\TechVDOs\\R\\getncleandata\\UCI HAR Dataset\\test\\subject_test.txt")

names(XTest) = features

# Extracting only the measurements on the mean and standard deviation for each measurement
XTest = XTest[,extractFeatures]

# Loading activity labels
YTest[,2] = activityLabels[YTest[,1]]
names(YTest) = c("activityID", "activityLabel")
names(subjectTest) = "subject"

# Binding the subject id, activity id, activity label and corresponding features
testData <- cbind(as.data.table(subjectTest), YTest, XTest)

# Loading and processing X_train & y_train data
XTrain <- read.table("L:\\TechVDOs\\R\\getncleandata\\UCI HAR Dataset\\train\\X_train.txt")
yTrain <- read.table("L:\\TechVDOs\\R\\getncleandata\\UCI HAR Dataset\\train\\y_train.txt")
subjectTrain <- read.table("L:\\TechVDOs\\R\\getncleandata\\UCI HAR Dataset\\train\\subject_train.txt")

names(XTrain) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
XTrain = XTrain[,extractFeatures]

# Loading activity data
yTrain[,2] = activityLabels[yTrain[,1]]
names(yTrain) = c("activityID", "activityLabel")
names(subjectTrain) = "subject"

# Binding the subject id, activity id, activity label and corresponding features
trainData <- cbind(as.data.table(subjectTrain), yTrain, XTrain)

# Merging test and train data into a single dataset
allData = rbind(testData, trainData)

idLabels   = c("subject", "activityID", "activityLabel")
dataLabels = setdiff(colnames(data), idLabels)
meltData      = melt(allData, id = idLabels, measure.vars = dataLabels)

# Applying mean function to dataset using dcast function
tidyData   = dcast(meltData, subject + activityLabel ~ variable, mean)

write.table(tidyData, file = "tidyData.txt")
}