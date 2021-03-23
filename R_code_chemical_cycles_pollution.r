#chemical cycling -> level of NO2, with satelitte Sentinel of ESA
#extract png files from EN.zip to lab folder
library(raster)
setwd("C:/lab/")

#import to R one png file, one by one (images since jan2020 until mar2020)
EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

#Otherwise all together:
rlist <- list.files(pattern="EN")
rlist
list_rast <- lapply(rlist,raster) #lapply=apply the raster fuction to the list of file
ENstack <- stack(list_rast)

#let's plot the data
#color
cl <- colorRampPalette(c('red','orange','yellow'))(100) #  #yellow: eyes attraction!
#rows and columns
par(mfrow=c(1,2))
plot(EN01, col=cl) #jan 2020
plot(EN13, col=cl) #mar 2020
# in order to show up in full size
dev.off()
#let's see the difference between the two periods
difno2 <- EN01 - EN13
cldif <- colorRampPalette(c('blue','black','yellow'))(100) # 
plot(difno2, col=cldif)

#do a video with images (https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/)
#just copy and paste all the images (this not produce a video, just to see differences between periods)
##VIDEO LIKE
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

#to create a video 
# https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/

#let's plot all the images together (making rows and columns)
par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

# Otherwise let's produce a stack(with a list of data we can put all together in one image)
#the otuput is the same,but in this case we plot more easily all images with just one line)
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
plot(EN, col=cl)

#plot(RGB)
dev.off()
plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")

#what we can see is that while the media is more or less the same, the maximum value for each changes. 
boxplot(ENstack,horizontal=T,axes=T,outline=F)
#where's red, it means that the level of NO2 is higher in march than in jan
dev.off()
boxplot(EN,horizontal=T,axes=T,outline=F)
#info in the graph: median values remain, more or less, the same / the maximum values decrease from jan to mar
#let's change colour and give names (label) to axys for this reason "xLAB", it means labelling x axys.  
boxplot(EN,horizontal=T,axes=T,outline=F, col="red",xlab="NO2 - 8bit", ylab="Period")) #lab because they are labeled
