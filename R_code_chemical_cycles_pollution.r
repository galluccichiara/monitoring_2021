library(raster)
setwd("C:/lab/")

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

#Otherwise:
# rlist <- list.files(pattern="EN")
# rlist
# list_rast <- lapply(rlist,raster)
# ENstack <- stack(list_rast)

cl <- colorRampPalette(c('red','orange','yellow'))(100) #
par(mfrow=c(1,2)) #multiframe anaylisis 1 row, 2 columns
plot(EN01, col=cl)
plot(EN13,col =cl)

# in order to show up in full size
dev.off()
difno2 <- EN01 - EN13
cldif <- colorRampPalette(c('blue','black','yellow'))(100) # 
plot(difno2, col=cldif)

#video like
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

# Otherwise make a stack (but the otuput is the same,but in this case we plot more easily all images with just one line, prima li impilo (stuck) uno sopra l'altro e poi plot)
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
plot(EN, col=cl)

#plot(RGB)
dev.off()
plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")

#what we can see is that while the media is more or less the same, the maximum value for each changes. 
boxplot(EN,horizontal=T,axes=T,outline=F)
dev.off()
boxplot(EN,horizontal=T,axes=T,outline=F)
#let's change colour and give names (label) to axys for this reason "xLAB", it means labelling x axys.  
boxplot(EN,horizontal=T,axes=T,outline=F, col="red",xlab="NO2 - 8bit", ylab="Period")

