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

# Plot line chart of Sub metering data (plot3.png)

## Reset parameters
dev.off()
## Plot sub-metering line chart
with(df, {
  plot(Time, Sub_metering_1, col="black", main="", type="n",  
              ylab = "Energy sub metering", xlab="")
  lines(Time,Sub_metering_1, col="black")
  lines(Time,Sub_metering_2, col="red")
  lines(Time,Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
  }
)

## Save chart with required sizes.
dev.copy(png, file="plot3.png", width = 480, height = 480, units = "px")
dev.off()


