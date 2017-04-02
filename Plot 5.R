## Plot 5

#Set working directory

setwd("C:/Users/Stavros/Desktop/Coursera/Exploratory data analysis/Week 4")

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##merge NEI and SCC

NEISCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)

##Subset for motor vehicle sources and total emissions

OnroadNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

totalemissions <- aggregate(Emissions ~ year, OnroadNEI, sum)

##Plot the graph

png("plot5.png", width=640, height=480)
g <- ggplot(totalemissions, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions in tons")) +
        ggtitle('Total Emissions from motor vehicle sources in Baltimore City from 1999 to 2008')
print(g)
dev.off()