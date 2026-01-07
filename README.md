# AMS315-Project1
Part A
Part A is worth 40 points. The model for the Part A assignment is a first data and
statistical processing task that a newly hired statistician might be given. Your report should
address the issues that your future supervisor would want to know about: how many
observations, fraction of missing data in independent variable and dependent variable, and
imputation of missing data.
The two files for part A each contain a column for subject ID and a column for either the
dependent variable value or the independent variable value. Your first task is to sort the two files
by subject ID and merge them. You should not just use “cut and paste” to merge your data.
Second, you are expected to deal with missing data. Your report should contain the count of the
number of subject IDs that had at least one independent variable value or dependent variable
value. It should also include the count of the number of subject IDs that had an independent
variable value, the count of the number of subject IDs that had a dependent variable value, the
count of the number of subject IDs that had both an independent and dependent variable value,
and the count of the number of subject IDs that had at least one independent variable value or
dependent variable value.
Your second task is to impute the missing values. There are many of missing data
procedures. Often a statistical package has imputation algorithms in the software. For example, R
has a package called MICE that has several options. You may not choose listwise deletion or
mean imputation (or its equivalent median imputation). Specify your choice in your report.
Often, the choice of imputation method has little effect on the results if the fraction of missing
data is 30% or less.
Part B
Part B is worth 60 points. The data file for part B contains one line for each subject ID.
The line will contain the subject ID, the value of the independent variable, and the value of the
dependent variable. A transformation of either IV or DV or both may be required. You should
read the textbook (Chapter 11.1) for suggestions on fitting a model. An approximate lack of fit
(LOF) test should be applied. It is your responsibility to find repeated (or near repeated)
independent variable values. That is, you will have very few exact repeats of an independent
variable value. You should bin near repeated data into one level. For example, suppose that 𝑥1 =
1.01, 𝑥2 = 1.02, 𝑥3 = 1.03 and 𝑦1 = 2, 𝑦2 = 3, 𝑦3 = 4. While there are not exactly repeated x
values, you could bin these points into one group of nearly repeated points. That is, choose the
average x-value as the value of x after binning. Then your binned data would be 𝑥1 = 1.02, 𝑥2 =
1.02, 𝑥3 = 1.02 and 𝑦1 = 2, 𝑦2 = 3, 𝑦3 = 4. Now perform a LOF test on the data set after
binning all near repeated values. There is software in R that performs an approximate lack of fit
test. Often a transformation does not improve the apparent extent to which the data satisfies the
assumptions of Chapter 11. Please check the r-squared of the data as given to the r-squared of the
data after you transform it. Also, please check the residual plot of the data. It may be helpful to
apply these checks to the data in part A.
