library(dplyr)
library(magrittr)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
ssc <- readRDS("Source_Classification_Code.rds")

by_year <- NEI %>%
            group_by(year) %>%
            summarise(year_wise_emission = sum(Emissions))

png("plot1.png")

barplot(by_year$year_wise_emission,names.arg = by_year$year,border = "black",col = "blue",ylab = "Emissions/year",xlab = "Year")
dev.off()