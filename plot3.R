#plot4
#in order to make this code work you need to have the following data in your working directory
#summarySCC_PM25.rds" and Source_Classification_Code.rds
#get the data 
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the data
Baltimore.data <- subset.data.frame(data, fips == "24510")
#analyse the data
sumbaltimore <- aggregate(Emissions ~ year + type, Baltimore.data, mean)
#create the plot 
png("plot3.png", width = 480, height = 480)
g <- ggplot(sumbaltimore, aes(year, Emissions, color = type))
g + geom_line() + labs(x="Year", y = "Emissions (mean)", title = "Different types of emissions" )
dev.off()