# Step 1. Merge the training and the test sets to create one data set.
# Setting working directory to point to the location of the git repository root
# e.g setwd("/Users/krisztiangyuris/Desktop/r_workingdir/coursera-getting-and-cleaning-data")

# Loading files
print("Loading data...")
trainData <- read.table("data/train/X_train.txt")
trainLabels <- read.table("data/train/y_train.txt")
trainSubject <- read.table("data/train/subject_train.txt")

testData <- read.table("data/test/X_test.txt")
testLabels <- read.table("data/test/y_test.txt")
testSubject <- read.table("data/test/subject_test.txt")

activityLabels <- read.table("data/activity_labels.txt")
features <- read.table("data/features.txt")

# combining test and set data
print("Combining test and train data.")
allData <- rbind(trainData, testData)
allLabels <- rbind(trainLabels, testLabels)
allSubject <- rbind(trainSubject, testSubject)

# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
print("Extracting and renaming.")
meanstdIndexes <- grep("mean\\(\\)|std\\(\\)", features[,2])
allData <- allData[, meanstdIndexes]

names(allData) <- gsub("\\(\\)", "", features[meanstdIndexes, 2])
names(allData) <- gsub("mean", "Mean", names(allData))
names(allData) <- gsub("std", "Standard", names(allData))

# Step 3. Uses descriptive activity names to name the activities in the data set
print("Adding activity names.")
activityLabels[, 2] <- tolower(activityLabels[,2]) 
activityLabels[, 2] <- gsub("_u", "U", activityLabels[,2])
activityLabels[, 2] <- gsub("_d", "D", activityLabels[,2]) 
substr(activityLabels[, 2], 1,1) <- toupper(substr(activityLabels[, 2], 1, 1))
al <- activityLabels[allLabels[, 1], 2]
allLabels[, 1] <- al
names(allLabels) <- "activity"

# Step 4. Appropriately labels the data set with descriptive variable names. 
names(allSubject) <- "subject"

print("Writing out final data set")
finalData <- cbind(allSubject, allLabels, allData)
write.table(finalData, "final_data.txt")

# Step 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
print("Creating the final average data")
activityLength <- dim(activityLabels)[1]
subjectLength <- length(table(allSubject))
columnLength = dim(finalData)[2]

tmp <- matrix(NA, nrow = activityLength*subjectLength, ncol = columnLength)
finalDataAvg <- as.data.frame(tmp)
colnames(finalDataAvg) <- colnames(finalData)

r <- 1
for(i in 1:subjectLength)
{
  for(j in 1:activityLength)
  {
    finalDataAvg[r, 1] <- i
    activity <- activityLabels[j, 2]
    finalDataAvg[r, 2] <- activity
    subjectVector <- i == finalData$subject
    activityVector <- activity == finalData$activity
    finalDataAvg[r, 3:columnLength] <- colMeans(finalData[subjectVector&activityVector, 3:columnLength])
    r <- r + 1
  }
}

write.table(finalDataAvg, "final_data_average.txt")