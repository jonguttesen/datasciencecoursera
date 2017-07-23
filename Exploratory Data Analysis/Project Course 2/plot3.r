library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data1 <- NEI[( (NEI$year==1999 | NEI$year==2008) & NEI$fips =="24510"),]
#data1 <- NEI[(NEI$fips =="24510"),]


#data1 <- tapply(NEI$Emissions, NEI$year, sum)

png("plot3.png", width = 1024, height = 1024)

g <- ggplot(data1, aes(factor(year)))

g + facet_grid( . ~ type ) + geom_bar(aes(weight=Emissions, group=factor(type),fill=type), position="dodge") + labs(x="year", y="Emissions (tons)", title="Baltimore City pm2.5 emission sources by type")

dev.off()