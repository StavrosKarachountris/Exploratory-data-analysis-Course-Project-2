##Plot 1

#Set working directory

setwd("C:/Users/Stavros/Desktop/Coursera/Exploratory data analysis/Week 4")

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset the total emissions per year

totalemissions <- aggregate(Emissions ~ year, NEI, sum)

##Plot the total emissions in the US per year

png('plot1.png')
barplot(height=totalemissions$Emissions, names.arg=totalemissions$year, 
        xlab="years", ylab=expression('total PM'[2.5]*' emission in tons'),
        ylim=c(0,8000000),main=expression('Total PM'[2.5]*' emissions in the US from 1999 to 2008'))

dev.off()