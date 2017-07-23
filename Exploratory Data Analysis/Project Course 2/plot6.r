library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plot6SCC <- SCC[grepl("On-Road", SCC$EI.Sector),]
plot6NEISCC <- merge(x=NEI, y=plot6SCC, by.x="SCC", by.y="SCC")

plot6NEISCC <- plot6NEISCC[((plot6NEISCC$fips =="24510") | (plot6NEISCC$fips =="06037") ) ,]

plot6NEISCC$Scaled <- scale( plot6NEISCC$Emissions, center = TRUE, scale = TRUE)

png("plot6.png", width = 1024, height = 1024)

g <- ggplot(plot6NEISCC, aes(factor(year)))

#ylim1 = boxplot.stats(plot6NEISCC$Emissions)$stats[c(1, 5)]

g + facet_grid(.~fips) + geom_bar(aes(weight=Scaled, fill=fips)) + labs(x="Year", y="Scaled emissions", title="Baltimore city vs LA emissions from motor vehicles", subtitle="Summary statistics" ) 
#g + geom_bar(aes(weight=Scaled)) + labs(x="Year", y="Scaled emissions by std.dev", title="Baltimore city vs LA emissions from motor vehicles", subtitle="Summary statistics" ) 
dev.off()