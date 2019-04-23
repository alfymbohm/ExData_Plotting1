# Readme
## alfymbohm's Plotting Assignment 1 for Exploratory Data Analysis

The repo contains: 
* 4 .R files:
	* *plot1.R,*
	* *plot2.R*,
	* *plot3.R* and
	* *plot4.R*
* 4 .png files, the output of the respective R files above, containing the required plots.
* *hh_cons_small.rds*, an R object that contains the household power consumption dataset, already subsetted to exclude all dates but the relevant ones (1 and 2 Feb 2007)
* this readme.
* as well as all the original repo files (the *figure* folder and *README.md*)

The code in the R scripts is designed to be fully portable, but plot1.R should be run before all the others. The first part of the script *plot1.R* downloads the assignment data to a parallel folder *data*, and selects only the data from the relevant dates (1/2/2007, and 2/2/2007), saving it in a separate .rds object, the hh_cons_small.rds file in the repository main directory.

The *data* folder containing the raw, full dataset is not a part of the GitHub repository, due to its size.