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

# Plot panel of different charts

## Reset parameters
dev.off()
Sys.info()
## Activate a quartz window if in Mac. This helps keep the formatting correct, while working in RStudio for Mac.
if(Sys.info$sysname="Darwin"){
  quartz("plot1")
  }

## Set up panel
par(mfrow = c(2,2), bg = "transparent", mar=c(4.5,4.5,3,1))

## Plot line chart of Global Active Power
with(df, {
  plot(Time, Global_active_power, main="", xlab = "", type = "n",
       ylab = "Global Active Power (kilowatts)")
  lines(Time, Global_active_power, col = "black")
})

## Plot line chart of Voltage
with(df, {
  plot(Time, Voltage, main="", xlab = "datetime", type = "n",
       ylab = "Voltage")
  lines(Time, Voltage, col = "black")
})

## Plot line chart of Energy sub metering
with(df, {
  plot(Time, Sub_metering_1, col="black", main="", type="n",  
              ylab = "Energy sub metering", xlab="")
  lines(Time,Sub_metering_1, col="black")
  lines(Time,Sub_metering_2, col="red")
  lines(Time,Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), bty = "n", seg.len = 2,
         legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), cex=1)
  }
)

## Plot line chart of global reactive power
with(df, {
  plot(Time, Global_reactive_power, main="", xlab = "datetime", type = "n")
  lines(Time, Global_reactive_power, col = "black")
})

# Save chart with required sizes.
dev.copy(png, file="plot4.png", width = 480, height = 480, units = "px")
# Shut down all graphics
graphics.off()


