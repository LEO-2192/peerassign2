library(ggplot2)
library(dplyr)
library(magrittr)


NEI <- readRDS("summarySCC_PM25.rds")
SSC <- readRDS("Source_Classification_Code.rds")

coal_sources <- subset(SSC, grepl("Coal",SSC$Short.Name,ignore.case = TRUE))

NEI_coal <- subset(NEI, NEI$SCC %in% coal_sources$SCC)

by_year <- NEI_coal %>%
            group_by(year) %>%
            summarise(coal_emission = sum(Emissions))

png("plot4.png")

barplot(by_year$coal_emission,names.arg = by_year$year,col = "green",border = "black",xlab = "year",ylab = "Coal-Related Emissions")
dev.off()