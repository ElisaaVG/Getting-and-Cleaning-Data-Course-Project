
# STEP 0 - Get and Read the data
#*******************************************************************************
library(dplyr)
# download and unzip the file containing data 
zip.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zip.url, destfile = "data.zip")
unzip("data.zip")

#Read Activity and Feature Labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 
features <- read.table("./UCI HAR Dataset/features.txt")               

#Read Test data 
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")

#Read Train data
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")


# STEP 1 - Merge training and test sets to create one data set
#*******************************************************************************

#Combine test and train sets into one data set
test  <- cbind(test_subject,test_y, test_x)
train <- cbind(train_subject, train_y, train_x)
data <- rbind(test, train)


# STEP 2 - Extract only measurements on mean and standard deviation
#*******************************************************************************

#Subset, keeeping mean and std columns
names.group <- c("subject", "activity", as.character(features$V2))
mean_std_columns <- grep("subject|activity|[Mm]ean|std", names.group, value = FALSE)
reduced_data <- data[ ,mean_std_columns]


# STEP 3 - Use descriptive activity names to name the activities in the data set
#*******************************************************************************

#Use indexing to apply activity names to corresponding activity number
names(activity_labels) <- c("activityNumber", "activityName")
reduced_data$V1.1 <- activity_labels$activityName[reduced_data$V1.1]


# STEP 4 - Appropriately label the data set with descriptive variable name
#*******************************************************************************

#Use series of substitutions to rename variables
reduced_names <- names.group[mean_std_columns]    # Names after subsetting
reduced_names <- gsub("mean", "Mean", reduced_names)
reduced_names <- gsub("std", "Std", reduced_names)
reduced_names <- gsub("gravity", "Gravity", reduced_names)
reduced_names <- gsub("[[:punct:]]", "", reduced_names)
reduced_names <- gsub("^t", "time", reduced_names)
reduced_names <- gsub("^f", "frequency", reduced_names)
reduced_names <- gsub("^anglet", "angleTime", reduced_names)
names(reduced_data) <- reduced_names  # Apply new names to dataframe


# STEP 5 -  Create a second, independent tidy set with the average of each 
#variable for each activity and each subject
#*******************************************************************************

#Create tidy data set
tidy.data <- reduced_data %>% group_by(activity, subject) %>% 
  summarise_all(funs(mean))

#Write tidy data to output file
write.table(tidy.data, file = "tidy_data.txt", row.names = FALSE)

# Call to read in tidy data set produced and validate steps
validate <- read.table("tidy_data.txt")
View(validate)