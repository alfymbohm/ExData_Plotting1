# Initial setup
## Set working directory and clear environment
## * NOTE: INSERT YOUR OWN WORKING DIRECTORY IN setwd() BELOW

setwd("/Users/Alfy/Documents/Programming/Data science/Courses/exploratory-analysis/ExData_Plotting1")
rm(list=ls())

# Read the R object file from the previously generated .rds file 
## * NOTE: See plot1.R and comments therein for an explanation of the generating process

## Check if data file available, if not issue a warning.
if (!("hh_cons_small.rds" %in% dir(getwd()))){
  warning(paste0("There is no pre-processed subset of data in the working directory.\n",
    "Please make sure you already ran plot1.R before running this script."))
}

## Read the data
df<-readRDS("hh_cons_small.rds")

# Plot line chart of Global Active Power (plot2.png)

## Reset parameters
dev.off()
## Plot relevant line chart
with(df, {
  plot(Time, Global_active_power, main="", xlab = "", type = "n",
              ylab = "Global Active Power (kilowatts)")
  lines(Time, Global_active_power, col = "black")
})

## Save chart with required sizes.
dev.copy(png, file="plot2.png", width = 480, height = 480, units = "px")
dev.off()


