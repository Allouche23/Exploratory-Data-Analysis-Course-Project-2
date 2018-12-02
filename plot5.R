#Plot 5
#in order to make this code work you need to have the following data in your working directory
#summarySCC_PM25.rds" and Source_Classification_Code.rds
#get the data 
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#prepare the data (merge it)
mergeddata <- merge(data,SCC, bye = SCC)
#subset the data
vechildata <- grepl("vehicle", mergeddata$SCC.Level.Two, ignore.case = TRUE)
datavechil <- mergeddata[vechildata,]
subvehicle<- subset(datavechil,fips == "24510" )
finaldata <- aggregate(Emissions ~ year, subvehicle, sum)
#create the plot
library(ggplot2)
png("plot5.png", width = 480, height = 480)
g <- ggplot(finaldata, aes(factor(year),Emissions))
g+geom_bar(stat = "identity", fill = "Blue")+labs(x="Year", y = "Emissions ", title = "Emission Vehicles in Baltimore")
dev.off()