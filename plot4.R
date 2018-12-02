#plot4
#in order to make this code work you need to have the following data in your working directory
#summarySCC_PM25.rds" and Source_Classification_Code.rds
#get the data 
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#prepare the data (merge it)
mergeddata <- merge(data,SCC, bye = SCC)
#subset the data
coal.data <- grepl("coal", mergeddata$Short.Name, ignore.case = TRUE)
datawithcoal <- mergeddata[coal.data,]
#"analyse the data
Emissiondatawithcoal <- aggregate(Emissions ~ year, datawithcoal, sum)
#create the plot 
library(ggplot2)
png("plot4.png", width = 480, height = 480)
g <- ggplot(Emissiondatawithcoal, aes(factor(year),Emissions))
g+geom_bar(stat = "identity", fill = "Blue")+labs(x="Year", y = "Emissions ", title = "Emission from coal")
dev.off()