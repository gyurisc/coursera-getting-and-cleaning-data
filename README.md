This repository is contains the course project for the **Getting and Cleaning Data** for coursera.org. 

To run the script make sure that your working directory points to the root of this repository e.g *setwd("/Users/krisztiangyuris/Desktop/r_workingdir/coursera-getting-and-cleaning-data")*

After downloading the data from here: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

you need to extract the data in the *data* folder in order for the script to work. 

After getting the data you need to run the **run_analysis.r** script to produce the data. If everything works fine you should see the following output: 

[1] "Loading data..."
[1] "Combining test and train data."
[1] "Extracting and renaming."
[1] "Adding activity names."
[1] "Writing out final data set"

The script should produce the following files: 

final_data.txt  
final_data_average.txt 

Where the final_data.txt is the final tidy data set with readable column names and the final_data_average.txt is the data containing the average of each variable for each activity and each subject. 