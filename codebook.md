The source data can be obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The description of the data collection process and description of the data can be found at this site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The R script run_analysis.r will do the following. 

1. Merges the training and test sets to create one data set called tidydata.txt.  The output file contains 10299 observations with 68 variables.  The first column is the subject (participant in the research) id (1 to 30) and the last column is the activity which the subject is doing when the data is captured.  

2. Variables 2 to 67 are labelled according to the original field names found in the file features.txt, only the fields with mean() and std() (mean and standard deviation) were preserved for the purpose of this project.  

3. The activity field contains 6 activities which the subject is doing while data is captured by their smartphone.  The activities are found in the activity_labels.txt file and are namely: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS 
