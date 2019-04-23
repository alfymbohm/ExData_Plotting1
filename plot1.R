# Initial setup
## Set working directory and clear environment
## * NOTE: INSERT YOUR OWN WORKING DIRECTORY BELOW

setwd("/Users/Alfy/Documents/Programming/Data science/Courses/exploratory-analysis/ExData_Plotting1")
rm(list=ls())

# Generate data for this and other scripts (see explanation below)
# * NOTE: This is the first .R file of the assignment, and generates the 2-day subset 
# * dataset from the full dataset for all the other .R files.
# * The full dataset is downloaded and unzipped locally to a data folder, parallel to the working directory
# * The full dataset is not committed to the GitHub repo, as it is too large (100MB)
# * Only the subsetted dataset saved as an RData file is committed to the repo and is used in later scripts.

## Set up folders and download the data file to parallel data folder. 
## * NOTE: Directory path manipulation works for MacOS or Unix only.
## Set up folder structure, if not yet present
parent_dir <- dirname(getwd())
data_dir <- paste0(parent_dir, "/data")

## Declare the download function
download_data <- function(target_path) {
  ## Download and unzip data
  data_sourceURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zip_path <- paste0(data_dir,"/household_power_consumption.zip")
  download.file(data_sourceURL, zip_path)
  unzip(zip_path, exdir = target_path)
}

dir(parent_dir)
!("data" %in% dir(parent_dir))
!("household_power_consumption.txt" %in% dir(data_dir))

if (!("data" %in% dir(parent_dir))) {
  dir.create(data_dir)
  download_data(data_dir)
} else {
  ## If there are no rightly named text files, proceed with download
  if (!("household_power_consumption.txt" %in% dir(data_dir))){
    download_data(data_dir)
  }
}

data_path <-paste0(data_dir,"/household_power_consumption.txt")

## If there is no hh_cons_small.rds file in the working directory,
## Read the data file from the local copy of the text file, replacing question marks with NAs

if(!("hh_cons_small.rds"%in%dir(getwd()))){
  df_large<-read.delim(data_path, sep = ";", header = TRUE, 
                       na.strings="?", stringsAsFactors = FALSE)
  
  # Select the relevant records
  ## Subset the data based on string dates for 1st and 2nd Feb 2007
  df<-subset(df_large, Date == "1/2/2007" | Date == "2/2/2007")
  
  ## Check that all is well
  table(df$Date)
  
  ## Convert the dates data, from factor to actual dates
  df$Time <- with(df, as.POSIXlt(paste(Date,Time), format = "%d/%m/%Y %H:%M:%S"))
  df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
  
  ## Write the subsetted and edited dataset to a separate .RData file, to be committed to the GitHub repo.
  saveRDS(df, file = "hh_cons_small.rds")
} else {
  df<-readRDS("hh_cons_small.rds")
}


## Remove main dataset and all other variables
suppressWarnings(
  rm(list=c("df_large", "data_dir", "data_path", "data_sourceURL", "parent_dir", "zip_path", "download_data"))
)

# Plot histogram of Global active power (plot1.png)
## Reset parameters
dev.off()
## Plot the histogram
par(bg = "transparent")
with(df, hist(Global_active_power, col="red", main="Global Active Power", 
              xlab = "Global Active Power (kilowatts)"))

## Save chart with required sizes.
dev.copy(png, file="plot1.png", width = 480, height = 480, units = "px")
dev.off()

