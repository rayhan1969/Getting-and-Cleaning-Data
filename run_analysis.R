setwd("C:/Users/ALIENWARE/Desktop/Ray/Run_Analysis/UCI HAR Dataset/train")

library(plyr)
# Step 1
# Combine the training and test sets to create one bigger data set
#x,y,subject

x_train <- read.table("X_train.txt")
x_test <- read.table("X_test.txt")


y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")

subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")




# combined to form  X
X <- rbind(x_train, x_test)


# combined to form Y
Y <- rbind(y_train, y_test)


# combined to form S
S <- rbind(subject_train, subject_test)


# Step 2
# Pull out only the measurements on the standard deviation and mean for each measurement


features <- read.table("features.txt")


# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])


# subset the desired columns
X <- X[, mean_and_std_features]


# correct the column names
names(X) <- features[mean_and_std_features, 2]


# Step 3
# To name the activities in the data set use descriptive activity


activities <- read.table("activity_labels.txt")


# update values with appropriate activity names
Y[, 1] <- activities[Y[, 1], 2]


# correct column name
names(Y) <- "activity"


# Step 4
# Label the data set with descriptive variable names


# correct column name
names(S) <- "subject"


# bind all the data in a single data set
all_data <- cbind(X, Y, S)


# Step 5
# Create another independent tidy data set with the average of each variable
# for each activity and each subject


# 66 <- 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))


write.table(averages_data, "data_set_with_the_averages.txt", row.name=FALSE)
