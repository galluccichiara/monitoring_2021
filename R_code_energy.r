#lecture 15/1
#1) energy flow, about reflectance of nearinfrared and absorption of red

#R_code_energy.r
#rasterdiv package, where there's dataset about NDVI (normalized difference vegetation index)
install.packages("rasterdiv")
library(rasterdiv)
library(raster)
#load data of copernicus NDVI
data(copNDVI)
plot(copNDVI)
#let's remove the blue part and brown part, the image is usually coded from 0 to 100 (the NDVI value)...
#...but let's use a simple manner: 8 bit so from 0 to 2^8 (255)... bit is 1(true) or 0(false)...2 info,2colors
#...let's remove the values which codes are 253-254-255
copNDVI <- reclassify(copNDVI, cbind(253:255, NA)) #NA stays for Not Assigned
plot(copNDVI)
#we have overwrote the previous file
#the greener, the higher biomass level

install.packages("rasterVis")
library(rasterVis)
levelplot(copNDVI)
#the function to do a mean of every level of the raster (composed of pixels) and every mean is a point, linking this point we have a profile (in this case energy potential in world). 
-> #this profile is shown next to the map

#change colors...yellow has the maximum impact to our eyes
clymin <- colorRampPalette(c('yellow','red','blue'))(100) #clyellowminimum, blue max
plot(copNDVI, col=clymin)

clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)

clymax <- colorRampPalette(c('blue','red','yellow'))(100) # 
plot(copNDVI, col=clymax)

#let's put the 2 plots together
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) # 
plot(copNDVI, col=clymax)

dev.off()


plot(copNDVI, col=clymax) 
#let's zoom in a certain part of map
#how to crop in italy, crop function is for geographic subset
ext <- c(0,20,35,55)) #extension declared (xmin,xmax,ymin,ymax)
copNDVI_Italy <- crop(copNDVI, ext) #assign to crop a new name
plot(copNDVI_Italy, col=clymax) #color 
------------------------------------------

# R_code_energy.r

############# DAY 2
# https://earthobservatory.nasa.gov/ ---> to find images for exam

# Deforestation example
library(raster)
library(RStoolbox)
setwd("C:/lab/")
#now we have to import from lab to R the images, if there's only one band/layer the function is raster, but we have also NIRlayer so is brick
defor1 <- brick("defor1_.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
# Exercise: import the defor2_.jpg image
defor2 <- brick("defor2_.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

# Exercise: put images one beside the other with par()
par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

#remember 1bit, then 2bit (00,01,10,11) 4infos,4colors ...3bits the same...exponential infos...8bit=255infos,255colors for each band


# dvi for the first period
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2 #dvi1 name of this case #defor1_.1 is the name of the first layer, the NIR layer ... defor1_.2 is the name of the second, the RED layer
plot(dvi1)

#change color
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

# dvi2 after the cut!
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)

# Exercise: put images one beside the other with par()
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")
dev.off()

# difference biomass before cut and after cut
difdvi <- dvi1 -dvi2
plot(difdvi)
#change color
cldif <- colorRampPalette(c('blue','white','red'))(100) #the reddish, the more change (the more loss of biomass) 
plot(difdvi, col=cldif, main="amount of energy lost!")

#to see this difference in histogram...we have difference and frequency of how much is frequent a certain value in difference
#i.e. x=difference and y=frequency... x=0 -> how many times there are no differences between pixels? y=3 so three pixels have no differences
hist(difdvi, col="red")

####### final par!
# defor1
# defor2
# dvi1
# dvi2
# difdvi
# histogram 
#6 final maps so we need 3 rows and 2 columns
par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi, col="red", main="positive values mean change!")
