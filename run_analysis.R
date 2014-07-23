library(reshape2)
# Part 1: Merges the training and the test sets to create one data set
# 1.1: Load X, Y and subject training data files 
Xtraining <- read.csv("/Users/mzodge/Workspaces/R/UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
Ytraining <- read.csv("/Users/mzodge/Workspaces/R/UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
Subtraining <- read.csv("/Users/mzodge/Workspaces/R/UCI HAR Dataset/train/subject_train.txt", sep = " ", header = FALSE)

# 1.2: Load X, Y and subject test data files 
Xtest <- read.csv("/Users/mzodge/Workspaces/R/UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
Ytest <- read.csv("/Users/mzodge/Workspaces/R/UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
Subtest <- read.csv("/Users/mzodge/Workspaces/R/UCI HAR Dataset/test/subject_test.txt", sep = " ", header = FALSE)

# 1.3: Merge training and test data sets
test <- cbind(Xtest, Ytest, Subtest)
training <- cbind(Xtraining, Ytraining, Subtraining)
mz <- rbind(test, training)

# Doing part 4 first for easier operation
# Part 4: Appropriately labels the data set with descriptive variable names
# 4.1: Read features and activities data file
features <- read.csv("/Users/mzodge/Workspaces/R/UCI HAR Dataset/features.txt", sep = " ", header = FALSE)
activities <- read.csv("/Users/mzodge/Workspaces/R/UCI HAR Dataset/activity_labels.txt", sep = " ", header = FALSE)

# 4.2: Remove any special characters
features <- gsub("-", ".", gsub("[\\(\\)]", "", as.character(features$V2)))

# 4.3: Set the column names
cols <- c(features, "activity", "subject")
colnames(mz) <- cols

# Part 2: Extracts only the measurements on the mean and standard deviation for each measurement

# 2.1: Extract means and standard deviations
msd <- subset(mz, select = cols[grep("mean\\.|mean$|std\\.|std$|activity|subject", cols)])

# Part 3: Uses descriptive activity names to name the activities in the data set
# 3.1: Label activites
for (i in 1:6) {
  mz$activity[mz$activity == i] <- as.character(activities$V2[[i]])
}

# Part 5: Creates a second, independent tidy data set with the average of each feature variable for each activity and each subject
# 5.1: Reshape data
mlt <- melt(msd, id=c("subject", "activity"), measure.vars=colnames(msd)[1:66])
tidy <- dcast(mlt, subject + activity ~ variable, mean)

# 5.2: Output tidy data set
write.csv(tidy, "OutputTidyData.csv")
