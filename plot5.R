library(dplyr)
library(magrittr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SSC <- readRDS("Source_Classification_Code.rds")

ssc_motor_vehicle <- subset(SSC, grepl("Vehicles",SSC$EI.Sector,ignore.case = TRUE))

NEI_vehicles <- NEI %>% 
                filter(SCC %in% ssc_motor_vehicle$SCC)
NEI_baltimore <- NEI_vehicles %>%
                    filter(fips == "24510") %>%
                    group_by(year) %>%
                    summarise(emission = sum(Emissions))

png("plot5.png")

ggplot(NEI_baltimore,aes(year,emission)) + geom_bar(stat = "identity",fill = "red")

dev.off()
                