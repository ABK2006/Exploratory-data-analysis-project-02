# Subset LA on-road data
la_data <- subset(NEI, fips == "06037" & type == "ON-ROAD")
la_data$city <- "Los Angeles"
vehicles_baltimore$city <- "Baltimore"

# Combine datasets
combined_data <- rbind(vehicles_baltimore, la_data)
city_emissions <- aggregate(Emissions ~ year + city, combined_data, sum)

png("plot6.png", width = 640, height = 480)

g <- ggplot(city_emissions, aes(x = factor(year), y = Emissions, fill = city)) +
  geom_bar(stat = "identity") +
  facet_grid(. ~ city) +
  labs(x = "Year", y = "PM2.5 Emissions (Tons)", title = "Motor Vehicle Emissions: Baltimore vs. LA") +
  theme_minimal()

print(g)
dev.off()
