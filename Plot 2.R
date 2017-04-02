##Plot 2

#Set working directory

setwd("C:/Users/Stavros/Desktop/Coursera/Exploratory data analysis/Week 4")

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset for Baltimore City

BCNEI  <- NEI[NEI$fips=="24510", ]

##Subset for total emissions per year for B.C

totalemissions <- aggregate(Emissions ~ year, BCNEI, sum)

##Plot the total emissions in the B.C per year

png('plot2.png')
barplot(height=totalemissions$Emissions, names.arg=totalemissions$year, 
        xlab="years", ylab=expression('total PM'[2.5]*' emission in tons'),
        ylim=c(0,4000),main=expression('Total PM'[2.5]*' emissions in Baltimore City from 1999 to 2008'))

dev.off()