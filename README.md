# Coursera.org Getting And Cleaning Data Project 1 

The data used in this was from from the Human Activity Recognition Using Smartphones Dataset

Both the test and train datasets (in the data/test and the data/train) directories were merged with identifers and labels created into a single dataset. The activitiy identifers were replaced with more meaningful names (such as walking etc rather than the original integer identifier). From th originan data set only the mean and the standard deviatun were kept and summarised futher by getting the mean for each subject activity pair.

The final data set is called tidy2.txt.

codebook.md contnains the variable description but the naming convention used is:
Mean{timeOrFreq}{measurement}{meanOrStd}{XYZ}
timeOrFreq: either Time or Frequency, the type of measurement
measurement:  one of the original measurement features
meanOrStd: either Mean or StdDev, a mean or standard deviation variable
XYZ: X, Y, or Z, axis along which the measurement was taken, or nothing, for magnitude measurements
