##Plot 3

#Set working directory

setwd("C:/Users/Stavros/Desktop/Coursera/Exploratory data analysis/Week 4")

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

##Subset for Baltimore City

BCNEI  <- NEI[NEI$fips=="24510", ]

##Subset for total emissions by type per year for B.C

totalemissions <- aggregate(Emissions ~ year + type, BCNEI, sum)

##Plot the total emissions in B.C by type per year

png("plot3.png")
g <- ggplot(totalemissions, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions in tons")) +
        ggtitle('Total Emissions in Baltimore City by type from 1999 to 2008')
print(g)

dev.off()