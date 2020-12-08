# Code Book

## Processing

* **Step 0: Get and Read the data**
Data was downloaded from the source files and read in with names corresponding to the source files. 

* **Step 1: Merge training and test sets to create one data set**
 Test and train set data were combined to created one data set

* **Step 2: Extract only measurements on mean and standard deviationt**
A names variable (allNames) that included the subject, activity and all feature names was created. This variable was subsetted to include only the subject, activity, and variables that included mean and standard deviation (std). This subsetted names variable was then used to extract the corresponding columns in the full data set. The result was saved as the reducedSet.

* **Step 3: Use descriptive activities names for activity measurementst**
The coded values for activity were changed to the activity name. This change was accomplished by indexing the activity variable.

* **Step 4: Appropriately Label the Dataset with Descriptive Variable Namest**
The allNames variable was subsetted in the same manner as the data. The resulting reducedNames variable was processed in a number of steps: capital letters were applied where appropriate, punctuation was removed, abbreviations "t" and "f" were changed to time and frequency. Finally, theses modified names were applied to the reducedSet.

* **Step 5: Create tidy data set with average of each variable, by activity, by subjectt**
The reducedSet from the end of Step 4 was grouped by subject, then by activity, and summarized so that the observations in each row were the means of the variable columns, for that subject/activity. This was accomplished by applying the dply package verbs "group_by" and "summarise_each". The resulting tidy data set was written to a file called "tidyDataset.txt".

## Variables
#### Variables: Environment and data source
`zipUrl`  = URL for zip archive of source data

``
today = today's date, later coerced to data and time
mySystem = description of computer hardware and software used in this analysis


#### Variables: Imported files named according to sources file names
`activity` = six activity codes and corresponding activity names
`features` = feature names for test_x, train_x

`test_subject` = test set subject number
`test_x` = test set feature measurements
`test_y` = test set activity, coded 

`train_subject` = train set subject number
`train_x` = train set feature measurements
`train_y` = train set activity

####Variables: Combined data sets
`test` = test_subject,test_y, test_x combined by columns
`train` = train_subject, train_y, train_x combined by columns
`Data` = test, train combined by rows

Variables: Column names
allNames = set of names corresponding to fullSet, not yet applied 
meanStdColumns = subject, activity, and all features with mean or standard deviation
reducedSet = fullSet subsetted with meanStdColumns
reducedNames = allNames subsetted with meanStdColumns, renamed to R conventions; applied to reducedSet

Variables: Tidy data set
tidyDataset = data set with average of each variable, by activity, by subject
