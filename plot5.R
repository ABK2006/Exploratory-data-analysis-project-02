# A straightforward way to isolate vehicles is looking at "ON-ROAD" types
vehicles_baltimore <- subset(baltimore_data, type == "ON-ROAD")
veh_balt_emissions <- aggregate(Emissions ~ year, vehicles_baltimore, sum)

png("plot5.png", width = 480, height = 480)

g <- ggplot(veh_balt_emissions, aes(x = factor(year), y = Emissions)) +
  geom_bar(stat = "identity", fill = "forestgreen") +
  labs(x = "Year", y = "PM2.5 Emissions (Tons)", title = "Baltimore Motor Vehicle Emissions")

print(g)
dev.off()
