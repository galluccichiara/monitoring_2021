#first of all install a new package

install.packages("spatstat")
library(spatstat)

# setwd for Windows
setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid

#point patterns analysis (for density and value map)

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
library(rgdal)

#let's download file
#after downloaded it, let's explain to R
coastlines<-readOGR("ne_10m_coastline.shp")

#let's make once again plot
cl <- colorRampPalette(c('lightpink','mediumorchid3','blue'))(100)
plot(density_map, col = cl)
points(covid_planar)
plot(coastlines, add = TRUE)

#now let's move from open circle point to full circle point (pch=19)
# or let's make size smaller (cex=0-5)

cl <- colorRampPalette(c('lightpink','mediumorchid3','blue'))(100)
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)

#let's save figure in lab
png("figure1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) #
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

#now let's deal with predict number of cases which have not measure instead of density of cases
#let's interpolate case data
marks(covid_planar) <-cases
cases_map <- Smooth(covid_planar)

#let's make our plot after interpolated our data
plot(cases_map, col = cl)
points(covid_planar)
plot(coastlines, add = T)


