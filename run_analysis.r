# Step 1. Merge the training and the test sets to create one data set.
# Setting working directory to point to the location of the git repository root
# e.g setwd("/Users/krisztiangyuris/Desktop/r_workingdir/coursera-getting-and-cleaning-data")

trainSet <- read.table("data/train/X_train.txt")
trainLabels <- read.table("data/train/y_train.txt")
testSet <- read.table("data/test/X_test.txt")
testLabels <- read.table("data/test/y_test.txt")

# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# Step 3. Uses descriptive activity names to name the activities in the data set
# Step 4. Appropriately labels the data set with descriptive variable names. 
# Step 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 