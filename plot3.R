library(ggplot2)
library(dplyr)
library(magrittr)

SSC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

Baltimore_source <- NEI %>%
                    filter(fips == "24510") %>%
                    group_by(type,year) %>%
                    summarise(emission = sum(Emissions))


png("plot3.png")
ggplot(Baltimore_source,aes(type,emission)) + geom_bar(stat = "identity",fill = "blue") + facet_grid(.~year)
dev.off()