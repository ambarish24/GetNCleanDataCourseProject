generateTidyData <- function(){
# Loading activity labels
activityLabels <- read.table("activity_labels.txt")[,2]

# Loading data column names i.e. the features in the dataset
features <- read.table("features.txt")[,2]

# Extracting only the measurements on the mean and standard deviation for each measurement
extractFeatures <- grepl("mean|std", features)

# Loading and processing X_train & y_train data
XTrain <- read.table(normalizePath("./train/X_train.txt", winslash="\\"))
yTrain <- read.table(normalizePath("./train/y_train.txt", winslash="\\"))
subjectTrain <- read.table(normalizePath("./train/subject_train.txt", winslash="\\"))

names(XTrain) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
XTrain = XTrain[,extractFeatures]

# Loading activity data
yTrain[,2] = activityLabels[yTrain[,1]]

names(yTrain) = c("activityID", "activityLabel")
names(subjectTrain) = "subject"

# Binding the subject id, activity id, activity label and corresponding features
trainData <- cbind(as.data.table(subjectTrain), yTrain, XTrain)

# Loading and processing X_test & y_test data
XTest <- read.table(normalizePath("./test/X_test.txt", winslash="\\"))
YTest <- read.table(normalizePath("./test/y_test.txt", winslash="\\"))
subjectTest <- read.table(normalizePath("./test/subject_test.txt", winslash="\\"))

names(XTest) = features

# Extracting only the measurements on the mean and standard deviation for each measurement
XTest = XTest[,extractFeatures]

# Loading activity labels
YTest[,2] = activityLabels[YTest[,1]]

names(YTest) = c("activityID", "activityLabel")
names(subjectTest) = "subject"

# Binding the subject id, activity id, activity label and corresponding features
testData <- cbind(as.data.table(subjectTest), YTest, XTest)

# Merging test and train data into a single dataset
allData = rbind(testData, trainData)

idLabels   = c("subject", "activityID", "activityLabel")
dataLabels = setdiff(colnames(data), idLabels)
meltData   = melt(allData, id = idLabels, measure.vars = dataLabels)

# Applying mean function to dataset using dcast function
tidyData   = dcast(meltData, subject + activityLabel ~ variable, mean)

write.table(tidyData, file = "tidyData.txt", row.name=FALSE)
<<<<<<< HEAD
}
=======
}
>>>>>>> origin/master
