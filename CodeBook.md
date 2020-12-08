# Code Book

## Processing

* **Step 0: Get and Read the data**
Data was downloaded from the source files and read in with names corresponding to the source files. 

* **Step 1: Merge training and test sets to create one data set**
 `test` and `train` set data were combined to created one data set (`data`)

* **Step 2: Extract only measurements on mean and standard deviation**
Subset, keeeping mean and std columns; also keep subject, activity columns 

* **Step 3: Use descriptive activity names to name the activities in the data set**
Use indexing to apply activity names to corresponding activity number

* **Step 4: Appropriately label the data set with descriptive variable names**
Use series of substitutions to rename variables.

* **Step 5:  Create a second, independent tidy set with the average of each variable for each activity and each subject**
Create tidy data set and write tidy data to output file

## Variables
#### Data source
`zip.url`  = URL for zip archive of source data


#### Tables
`activity_labels` = six activity codes and corresponding activity names

`features` = feature names for `test_x`, `train_x`

`test_subject` = test set subject number

`test_x` = test set feature measurements

`test_y` = test set activity

`train_subject` = train set subject number

`train_x` = train set feature measurements

`train_y` = train set activity


#### Combined data sets
`test` = `test_subject`,`test_y`, `test_x` combined by columns

`train` = `train_subject`, `train_y`, `train_x` combined by columns

`data` = `test`, `train` combined by rows


#### Column names
`names.group` = set of names corresponding to `data`

`mean_std_columns` = subject, activity, and all features with mean or standard deviation

`reduced_data` = `data` subsetted with `mean_std_columns`

`reduced_names` = `names.group` subsetted with `mean_std_columns`


#### Tidy data set
`tidy.data` = data set with average of each variable, by activity, by subject

`validate` = call to read in tidy data set produced and validate steps
