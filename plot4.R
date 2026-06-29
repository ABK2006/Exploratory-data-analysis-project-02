# Find coal combustion-related SCC codes using regex
coal_matches <- grepl("comb", SCC$SCC.Level.One, ignore.case = TRUE) &
                grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE)
coal_scc <- SCC[coal_matches, "SCC"]

# Subset NEI data and aggregate
coal_data <- subset(NEI, SCC %in% coal_scc)
coal_emissions <- aggregate(Emissions ~ year, coal_data, sum)

png("plot4.png", width = 480, height = 480)

g <- ggplot(coal_emissions, aes(x = factor(year), y = Emissions / 10^5)) +
  geom_bar(stat = "identity", fill = "darkred") +
  labs(x = "Year", y = "PM2.5 Emissions (10^5 Tons)", title = "US Coal Combustion Emissions")

print(g)
dev.off()
