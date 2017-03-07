library(ggplot2)
library(dplyr)
library(magrittr)

NEI <- readRDS("summarySCC_PM25.rds")
SSC <- readRDS("Source_Classification_Code.rds")

Baltimore <- NEI %>%
                filter(fips == "24510") %>%
                group_by(year) %>%
                summarise(year_wise_emission = sum(Emissions))
png("plot2.png")
barplot(Baltimore$year_wise_emission,names.arg = Baltimore$year,col = "purple",border = "red",xlab = "year",ylab = "Baltimore Emission")
dev.off()