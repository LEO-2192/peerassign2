library(ggplot2)
library(dplyr)
library(magrittr)

NEI <- readRDS("summarySCC_PM25.rds")
SSC <- readRDS("Source_Classification_Code.rds")

ssc_vehicle <- subset(SSC, grepl("Vehicles",SSC$EI.Sector,ignore.case = TRUE))

NEI_vehicle <- NEI %>%
                filter(SCC %in% ssc_vehicle$SCC)

NEI_LA_BA <- NEI_vehicle %>%
                filter(fips %in% c("24510","06037")) %>%
                group_by(year,fips) %>%
                summarise(emission = sum(Emissions))

png("plot6.png",width = 480,height = 480)

ggplot(NEI_LA_BA,aes(year,emission)) + geom_bar(stat = "identity",fill = "magenta") +
    facet_grid(.~ fips) + xlab("year") + ylab("Emissions of Vehicles sources of LA & BALTIMORE") +
    ggtitle("LA-BALTIMORE MOTOR-VEHICLE EMISSION GRAPH")

dev.off()