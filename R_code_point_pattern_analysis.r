#first of all install a new package

install.packages("spatstat")
library(spatstat)

# setwd for Windows
setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid

#point patterns analysis

#First of all:
attach(covid)

#let's make a planar point pattern in spatstat
# identify x,y,ranges in our plot
# how to identify ranges? (ranges are lon and lat' minimum and maximum)
# which one we choose? in the summary min and max are the potential range of final density map, so let's make bigger range with higher values (if we use exactly the same range, map will finish exactly in the same points, so we suggest to increase our range in order to have a clearer panorama at global scale)
covid_planar<- ppp(lon,lat,c(-180,180),c(-90,90))


#let's see the density of the covid data, and let's see the most dense are european countries
density_map <- density(covid_planar)
plot(density_map)
#in order to see points in our density map
points(covid_planar)

#change colour of our map, colours changes according to increase of density 
# redefine our colour palette http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
cl <- colorRampPalette(c('yellow','orange','red'))(100) #
plot(density_map,col=cl)

#excercise change the colour
cl <- colorRampPalette(c('lightpink','mediumorchid3','blue'))(100) #
plot(density_map,col=cl)

#install new package
install.packages("rgdal")
