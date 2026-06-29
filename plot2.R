# Subset for Baltimore
baltimore_data <- subset(NEI, fips == "24510")
baltimore_emissions <- aggregate(Emissions ~ year, baltimore_data, sum)

png("plot2.png", width = 480, height = 480)

barplot(
  baltimore_emissions$Emissions, 
  names.arg = baltimore_emissions$year,
  xlab = "Year", 
  ylab = "PM2.5 Emissions (Tons)",
  main = "Total PM2.5 Emissions in Baltimore City",
  col = "darkorange"
)

dev.off()
