# plot 6
#in order to make this code work you need to have the following data in your working directory
#summarySCC_PM25.rds" and Source_Classification_Code.rds
#get the data
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Prepare the data
mergeddata <- merge(data,SCC, bye = SCC)
#Subset the data
vechildata <- grepl("vehicle", mergeddata$SCC.Level.Two, ignore.case = TRUE)
datavechil <- mergeddata[vechildata,]

subsetdata <- subset(datavechil, fips == "06037" | fips == "24510",)
subsetdata$fips[subsetdata$fips =="06037"] <- "Los Angeles County"
subsetdata$fips[subsetdata$fips =="24510"] <- "Baltimore City"

#analys the data 
finaldata <- aggregate(Emissions ~ year + fips, subsetdata, sum)

#create the plot
library(ggplot2)
png("plot6.png", width = 480, height = 480)
g <- ggplot(finaldata, aes(year, Emissions))
g <- g + facet_grid(. ~ fips)
g+ geom_line()+ ggtitle("Total Emissions from motor vehicles in Los Angelse and Baltimore")
dev.off()

