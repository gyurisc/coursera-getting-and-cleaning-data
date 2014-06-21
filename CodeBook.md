Codebook for Getting and Cleaning data
======================================

This file describes how the script creates the final data file. 

The data source and the project is coming from the following place: 

- [Human Activity Recognition using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )
- [Data Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The following transformation are applied to the data: 

1. The training and test data and labels are loaded in the scripts. 
2. Also both training and test subject data are both loaded. 
3. The training and test files are merged together for the data, labels and subjects.
4. The script loads the features and activity label information.
5. The merged data file is filtered to keep only standard and mean columns.
6. The merged data file column names are also made readable by removing the ( and ) chars from the column names and using _Mean_ and _Standard_ in column names instead of _mean_ and _std_   
7. The activity labels are also fixed to make sure the right capitalisation and removing the _underscore_ name from the column names.
8. The final dataset produced from the initial data has 10299 rows and 66 columns. 

# Description of data structure

- The first line has the column names for each columns
- Each row contains one measurement
- The first field of each line denotes the subject of the measurement. 
- The second field of each line is describing the activity 
- The remaining fields in a line are representing a single measurement for the given subject and activity. 


 

 