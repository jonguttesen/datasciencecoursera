## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data1 <- NEI[( (NEI$year==1999 | NEI$year==2008) & NEI$fips =="24510"),]


data2 <- tapply(data1$Emissions, data1$year, sum)

png("plot2.png", width = 1024, height = 1024)
#barplot(data2)
barplot(data2, main = "Total PM2.5 emission Baltimore City", xlab = "Year", ylab = "Emission (tons)" )
dev.off()