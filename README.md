# Getting-and-Cleaning-Data
Coursera Data Science Course

The R script "run_analysis.R" is annotated to make it easier for you to understand. I have included all the data files
for the project elsewhere in this repository. I found it easier to complete the steps a bit out of order. So, hopefully
you don't have trouble following along! I included the requirement I completed from the directions in the following form: (#1).

##Step 1: Loading the test and training datasets into R
  I read all the datasets into R using the read.table command; however, I was unsure how to create a relative path. So, the
  code specifies a local path --which may be problematic if you try to run the code (sorry).

##Step 2: Merge the X_test and X_train datasets together.
  1. I merged the X_test and X_train datasets into a new dataset called Xdata using the rbind command.
  2. I created a list of variable names from "features.txt" and attached them to Xdata using the colnames command.

##Step 3: Extract columns of means and std
  1.I extracted columns from Xdata that included the strings "mean" and/or "std" in their name using the grepl command and 
      saved this in a new dataset called XdataNew. (#2)

##Step 4: Merge Y_test and Y_train/subject_test and subject_train
  1. I merged the y_test and y_train datasets into a new dataset called Ydata using the rbind command.
  2. I labeled the column in Ydata "Activity" using the colnames command.
  3. I replaced the numeric codes with descriptive activity names by creating a list of activity names called ActivityLabel. 
      Then, I attached ActivityLabel to Ydata. (#3)
  4. Similarly, I merged the subject_test and subject_train datasets in a new dataset called STdata using the rbind command.
  5. I labeled the column "ID" to reflect that this data identifies each subject.

##Step 5: Create one dataset
  1. I merged XdataNew, Ydata, and STdata to create a single dataset called Samsungdata using the cbind command. This dataset
      included a subject ID, the activity, and all columns with "mean" and "std" in their name. (#1)

##Step 6: Descriptive Variable Names
  1. I made the variable names easier to read by removing any special characters line "-" or "()" using the gsub command. (#4)

##Step 7: Tidy dataset of averages
  1. I reshaped Samsungdata using the melt and dcast commands then saved the altered data in a dataset called SSData3.
  2. I saved the data in a text file called SSData3.txt using the write.table command.

