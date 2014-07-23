Datasciencecoursera_Course3
===========================

Data Science Course 3 project
-----------------------------

###How Code is working
** Note: For simpler operation code is doing Part 4 steps right before "Label the activities in the data frame" step

1. Merges the training and the test sets to create one data set
   * Read the X_train.txt, Y_train.txt, subject_train.txt data files and creates data frame for each file
   * Read the X_test.txt, Y_test.txt, subject_test.txt data files and creates data frane for each file
   * Column bind all the _test data frames to create one test data frame
   * Column bind all the _training data frames to create one training data frame
   * Row bind test and training data frames to create one data frame

2. Extracts only the measurements on the mean and standard deviation for each measurement
   * Identify feature names with "-mean" or "-std"
   * Sub set the data frame created in step 1.3. by 2.1
   
3. Uses descriptive activity names to name the activities in the data set
   * Read features and activities data file
   * Remove any special characters from the feature name and create features vector
   * Label the activities in the data frame created in step 2.2 using the 3.2 vector
   
4. Appropriately labels the data set with descriptive variable names
   * Read the features vactor and activity and subject to it and creates new vector cols
   * use this new vector to name columns of the data frame 
   
5. Creates a second, independent tidy data set with the average of each feature variable for each activity and each subject
   * Reshape the data
   * Output the tidy data
   
###How to run the Code
1. Download the data file using the link provided in the assignment
2. UnZip the data file
3. Check out the repository code
4. Change the directory path in all the read.csv commands to use the path where you have stored the data files
5. Run the run_analysis.R command using R
6. The output should stored in your current working directory
