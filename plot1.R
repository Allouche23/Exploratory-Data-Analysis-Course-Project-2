
#plot 1
#in order to make this code work you need to have the following data in your working directory
#summarySCC_PM25.rds" and 
#reading data
data <- readRDS("summarySCC_PM25.rds")

#analyse data
test <- tapply(data$Emissions, data$year, sum)
#create plot
png("plot1.png", width = 480, height = 480)
barplot(test, xlab = "Year", main = "Total Emission per Year", ylab = "Total Emission (in ton) per year" )
dev.off()
