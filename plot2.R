#plot4
#in order to make this code work you need to have the following data in your working directory
#summarySCC_PM25.rds" and 
#get the data 
data <- readRDS("summarySCC_PM25.rds")
#subset the data 
Baltimore.data <- subset.data.frame(data, fips == "24510")
#analyse the data
Baltimore.test <- tapply(Baltimore.data$Emissions, Baltimore.data$year, sum)
#create the plot
png("plot2.png", width = 480, height = 480)
barplot(Baltimore.test, xlab = "Year", main = "Baltimore Total Emission per Year", ylab = " Total Emission (in ton) per year")
dev.off()