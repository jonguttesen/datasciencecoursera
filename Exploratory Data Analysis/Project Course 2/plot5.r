library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plot5SCC <- SCC[grepl("On-Road", SCC$EI.Sector),]
plot5NEISCC <- merge(x=NEI, y=plot5SCC, by.x="SCC", by.y="SCC")

plot5NEISCC <- plot5NEISCC[(plot5NEISCC$fips =="24510"),]

png("plot5.png", width = 1024, height = 1024)

g <- ggplot(plot5NEISCC, aes(factor(year)))

#ylim1 = boxplot.stats(plot5NEISCC$Emissions)$stats[c(1, 5)]

#g + facet_grid(type~.) + geom_bar(aes(weight=Emissions, group=factor(type),fill=type), position="dodge") + labs(x="Year", y="Emissions (tons)", title="Baltimore city emissions from motor vehicles", subtitle="Summary statistics" )

g + facet_grid(.~EI.Sector) + geom_bar(aes(weight=Emissions, group=factor(EI.Sector),fill=EI.Sector)) + labs(x="Year", y="Emissions (tons)", title="Baltimore city emissions from motor vehicles", subtitle="Summary statistics" )

#g + geom_boxplot(outlier.shape = NA) + labs(x="Year", y="Emissions (tons)", title="Baltimore city emissions from motor vehicles", subtitle="Summary statistics" )

dev.off()