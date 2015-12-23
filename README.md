## Getting and Cleaning Data Course Assignment

### Included Files
* README.md
* Codebook.md
* run_analysis.R
* tidy.txt (Uploaded to Coursera)

### Methodology Used
1. Created data frames from both the test and training data sets (X_train/X_test)
2. Created vectors for the subjects (using subject_test/subject_train.txt resp.)
3. Created vectors for the activity numbers (using y_test/y_train.txt resp.)
4. Read in activity_labels.txt and used it with the vectors from step 3 to create labeled factors
5. Created a vector for the measurement column headings (from features.txt)
6. Created variables in the data frames for subject and activity using the respective vectors created earlier
7. Used rbind to concatenate into a single data frame (allVals)
8. Created the tidy data frame using the aggregate function (as can be seen in the code).
9. Even though the average of the means and standard deviations were used in the tidy data set, the column heading for the measurements remain the same as in the source data set.
