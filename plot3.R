png("plot3.png", width = 640, height = 480)

g <- ggplot(baltimore_data, aes(x = factor(year), y = Emissions, fill = type)) +
  geom_bar(stat = "identity") +
  facet_grid(. ~ type) +
  labs(x = "Year", y = "Total PM2.5 Emission (Tons)", title = "Baltimore Emissions by Source Type") +
  theme_minimal()

print(g)
dev.off()
