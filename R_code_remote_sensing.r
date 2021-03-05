#lecture 21/12
#r code for remote sensing data analysis to monitor ecosystem changes in space and time
#So what we learned today was that satellite images are composed by different bands and we can use these bands to see the color with different manner
#wavelenght: the distance from one pick to the other one; the higher the wavelenghts, the lower the frequency / how the light is spread / blue-green-red lights (rainbow)
#human just see wavelenght lights from blue until red...there's ULTRAVIOLET, INFRARED wavelenghts...
#DVI (Difference Vegetation Index) = NIR(nearinfrared reflectance) - RED (red reflectance) = in healthy leaf is 100-0= 100

#satellite images actually as matrices of numbers, with reflectance of different objects in the field and that reference can be converted to color.
#each color actually is a number. This number is how much the light is reflected by the different options.



#lecture 8/1
library(raster) #raster is data made by pixels
library(RStoolbox) #used for remote sensing data analaysis

# no library?
install.packages(c("raster","RStoolbox"))

setwd("C:/lab/")
#let's consider 4 bands (blue,green,red,nearinfrared)
p224r63_2011 <- brick("p224r63_2011_masked.grd") #p stays for "path" and r for "row"
#brick is the function to download in r all of the data (multi-band/layer)
p224r63_2011
plot(p224r63_2011)
cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)

#the 4 bands in a graph with 2 rows and 2 columns 
par(mfrow=c(2,2))

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb)
#$ to change the color of just one band, in this case the blue band (in general $ links things in R)

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_2011$B3_sre, col=clr)

clnir <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_2011$B4_sre, col=clnir)

dev.off()
#RGB is how human see, 3 bands without nearinfrared
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin") #stretch the image to see better...in a linear manner ("Lin") 

#eliminate a band to use the nearinfrared component 
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") #nearinfrared in the red component

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") #nir in the green component

plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin") #nir in the blue 

#see in the same graph this images
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
#the aim is to see SOMETHING NEW
