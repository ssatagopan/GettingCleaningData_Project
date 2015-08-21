# Assumption of working directory is that it's in root location of UCI HAR Data directory (./UCI HAR Data/)

# Read in names of feature vector
var_names <- read.table("features.txt", sep = "")

# Read in training data and assign column names as variable names read earlier
features_train <- read.table("./train/X_train.txt", header = FALSE, sep = "", col.names = var_names$V2)
subject_train <- read.table("./train/subject_train.txt", header = FALSE, sep = "")
activity_train <- read.table("./train/Y_train.txt", header = FALSE, sep = "")

# Construct data frame with training data set with subject and activity as first two columns and feature vector as the rest
cNames <- c("subject","activity",names(features_train))
trainingData <- data.frame(subject_train$V1, activity_train$V1, features_train)
names(trainingData) <- cNames

# Cleaning up temporary variables
rm(features_train)
rm(subject_train)
rm(activity_train)

# Read in test data
features_test <- read.table("./test/X_test.txt", header = FALSE, sep = "", col.names = var_names$V2)
subject_test <- read.table("./test/subject_test.txt", header = FALSE, sep = "")
activity_test <- read.table("./test/Y_test.txt", header = FALSE, sep = "")

# Construct data frame with test data set with subject and activity as first two columns and feature vector as the rest
testData <- data.frame(subject_test$V1, activity_test$V1, features_test)
names(testData) <- cNames

# Cleaning up temporary variables
rm(features_test)
rm(subject_test)
rm(activity_test)
rm(cNames)

# Combining training and test data sets
allData <- rbind(trainingData, testData)

# Get index of all column names with "mean" in the name and remove those with meanFreq in name
meanCols <- grep("mean",names(allData))
meanFreqCols <- grep("meanFreq",names(allData))
meanCols <- setdiff(meanCols,meanFreqCols)

# Get index of all column names with "std" in the name
stdCols <- grep("std",names(allData))

# Set index of columns to keep, subject, activity, and mean and std columns
selectCols <- c(1,2,meanCols,stdCols)
selectCols <- sort(selectCols)

# Extract data set with just subject, activity, and mean and std per measurement
selectData <- allData[,selectCols]

# Cleaning up temporary variables
rm(trainingData)
rm(testData)
rm(meanCols)
rm(stdCols)
rm(meanFreqCols)
rm(selectCols)

# Read in mapping between activity index and activity string
activityMap <- read.table("./activity_labels.txt", header = FALSE, sep = "", col.names = c("index","activityName"))

# In data set, replace numeric value of activity with corresponding activity string
actNums <- selectData$activity
for (i in activityMap$index) {
    activity <- as.character(activityMap$activityName[i])
    actIndex <- grep(i,actNums)
    actNums[actIndex] <- rep(activity, length(actIndex))
}
selectData$activity <- actNums

# Cleaning up temporary variables
rm(actNums)
rm(actIndex)
rm(activity)

# For each subject/activity pair, construct data set of averages of measurement means and std's
subjectList <- unique(selectData$subject)
activityList <- unique(selectData$activity)
avgData <- data.frame()
for (sub in subjectList) {
    for (act in activityList) {
        chosenData <- subset(selectData, subject == sub & activity == act)
        means <- lapply(chosenData[,3:length(names(chosenData))],mean)
        avgDataTemp <- data.frame(subject = sub, activity = act, means)
        avgData <- rbind(avgData, avgDataTemp)
    }
}

# Cleaning up temporary variables
rm(avgDataTemp)
rm(means)
rm(chosenData)
rm(subjectList)
rm(activityList)

# write text file of average data set
write.table(avgData, row.names = FALSE, file = "averageData.txt", sep = ",", col.names = TRUE, quote = FALSE)