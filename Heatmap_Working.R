#install.packages("ggmap")
library(ggplot2)
library(reshape2)
library(ggmap)
CO2.data <- read.csv("4-14.csv") 

# prepare data in long format
#df <- melt(fld$z, na.rm = TRUE)
#names(df) <- c("x", "y", "Rain")
#df$Lon <- fld$x[df$x]
#df$Lat <- fld$y[df$y]

#write = TRUE
#register_google(key = "AIzaSyBgCuwbxj8gTKbiCxGBzCKT2FjF5oWwjjY")

print( summary( CO2.data))

Latmin <- 25.0
Latmax <- 40.0
Latave <- (Latmin + Latmax)/2

Longmin <- -90
Longmax <- -100.0
Longave <- (Longmin + Longmax)/2
Longave

# & LONG >= Longmin & LONG <= Longmax & LAT >= Latmin & LAT <= Latmax
xxx <- subset( CO2.data, CO >= 1.0E18 )
xxx <- subset( xxx,  LONG <= Longmin )
xxx <- subset( xxx,  LONG >= Longmax )
xxx <- subset( xxx,  LAT <= Latmax )
xxx <- subset( xxx,  LAT >= Latmin )
xxx <- subset(xxx, SCALE = Scale)
print( summary( xxx))
xxx$LAT <- round(xxx$LAT, 0)
xxx$LONG <- round(xxx$LONG, 0)
CO2min <- 1.5e+18
CO2max <- 2.9e+18


#America1 <- get_map(location = c(lon = Longave, lat = Latave),
#                    zoom = 8,
#                    maptype = "toner",
#                    source = "stamen")

summary(xxx)

head(CO2.data)
head(xxx)

ggplot(data = xxx, aes(x = LONG, y = LAT, z = CO)) +
   geom_tile(aes(fill = CO)) +
  coord_sf(xlim = c(Longmax, Longmin), ylim = c(Latmin, Latmax), expand = FALSE) +
  stat_contour() +
  ggtitle("CO2 Data") +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_fill_continuous(name = "CO2 pp/cm3",
                     low = "blue", high = "red",
                     limits = c(1.5e+18, 2.8e+18)) +

  theme(plot.title = element_text(size = 25, face = "bold"),
        legend.title = element_text(size = 15),
        axis.text = element_text(size = 15),
        axis.title.x = element_text(size = 20, vjust = -0.5),
        axis.title.y = element_text(size = 20, vjust = 0.2),
        legend.text = element_text(size = 10))

hlatmin <-29
hlatmax <- 30
hlongmin <- -95
hlongmax <- -96
hou <- subset(CO)
hou <- subset( hou, CO >= 1.0E18 )
hou <- subset( hou,  LONG <= hlongmin )
hou <- subset( hou,  LONG >= hlongmax )
hou <- subset( hou,  LAT <= hlatmax )
hou <- subset( hou,  LAT >= hlatmin )

print( summary( hou))
