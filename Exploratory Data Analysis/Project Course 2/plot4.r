library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#coalSCC <- SCC[(grepl("[Coal]", SCC$Short.Name) & grepl("[Fuel Comb]", SCC$EI.Sector)),]
coalSCC <- SCC[(grepl("[Coal] [Comb]", SCC$Short.Name)),]

NEISCC <- merge(x=NEI, y=coalSCC, by.x="SCC", by.y="SCC")

#data1 <- NEI[( (NEI$year==1999 | NEI$year==2008) & NEI$fips =="24510"),]

png("plot4.png", width = 1024, height = 1024)

#g <- ggplot(NEISCC, aes(x=factor(year), y = Emissions))
g <- ggplot(NEISCC, aes(factor(year)))

#ylim1 = boxplot.stats(NEISCC$Emissions)$stats[c(1, 5)]

g + geom_bar(aes(weight=Emissions, group=factor(EI.Sector),fill=EI.Sector)) + labs(x="Year", y="Emissions (tons)", title="PM2.5 emissions from coal combustion", subtitle="Summary statistics" )


#g + geom_boxplot() + coord_cartesian(ylim = ylim1*1.05) + labs(x="Year", y="Emissions (tons)", title="Coal emissions from fuel combustion", subtitle="Summary statistics" )

dev.off()