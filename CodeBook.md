Introduction

The script run_analysis.R

•	downloads the data from UCI Machine Learning Repository

•	merges the training and test sets to create one data set

•	replaces activity values in the dataset with descriptive activity names

•	extracts only the measurements (features) on the mean and standard deviation for each measurement

•	appropriately labels the columns with descriptive names

•	creates a second, independent tidy dataset with an average of each variable for each each activity and each subject. In other words, same type of measurements for a particular subject and activity are averaged into one value and the tidy data set contains these mean values only. The processed tidy data set is also exported as csv file.


Variables

•	x_train, x_test,y_train, y_test, subject_train and subject_test contain the data from the downloaded files.

•	X, Y and S merge the previous datasets to further analysis.

•	features contains the correct names for the X dataset, then is applied to the column names stored inmean_and_std_features, a numeric vector used to extract the desired data.

•	In similar manner we take with activity names through the activities variable.

•	X, Y and S are merged in a big dataset. To form all_data Lastly, averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.


