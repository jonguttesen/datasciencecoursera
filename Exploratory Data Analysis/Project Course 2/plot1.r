## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data1 <- tapply(NEI$Emissions, NEI$year, sum)

png("plot1.png", width = 1024, height = 1024)
barplot(data1, main = "Total PM2.5 emission", xlab = "Year", ylab = "Emission (tons)" )
dev.off()