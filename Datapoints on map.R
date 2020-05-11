library(ggplot2)
library("sf")                 
library("rnaturalearth")
library("rnaturalearthdata")
library(ggspatial)
library(ggrepel)
library(rgeos)
#designating file for CO2.data callback
CO2.data <- read.csv("3-24.csv") 

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

###Basic Map generation

# Looking at first rows
head(CO2.data)
# scatterplot

#ggplot() + geom_sf(data = world) + geom_point(data = CO2.data, aes(y = LAT, x = LONG, alpha = CO), size = .5)

print( summary( CO2.data))

Latmin <- 25.0
Latmax <- 40.0
Longmin <- -90.0
Longmax <- -100.0
# & LONG >= Longmin & LONG <= Longmax & LAT >= Latmin & LAT <= Latmax
xxx <- subset( CO2.data, CO >= 1.0E18 )
xxx <- subset( xxx,  LONG <= Longmin )
xxx <- subset( xxx,  LONG >= Longmax )
xxx <- subset( xxx,  LAT <= Latmax )
xxx <- subset( xxx,  LAT >= Latmin )
print( summary( xxx))

ggplot() + geom_sf(data = world) + 
  coord_sf(xlim = c(Longmax, Longmin), ylim = c(Latmin, Latmax), expand = FALSE) + 
  geom_point(data = xxx, aes(y = LAT, x = LONG, alpha = 1/5)) + scale_fill_gradient(low="white", high="blue")
