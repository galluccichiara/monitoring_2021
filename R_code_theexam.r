library(ncdf4) 
library(raster)
setwd("C:/lab/")

rlist <- list.files(pattern="c_gls_ALDH_")
rlist
list_rast <- lapply(rlist,raster) 
ALBstack <- stack(list_rast)

par(mfrow=c(3,3))
cl <- colorRampPalette (c('green','orange','yellow')) (100)
plot(c_gls_ALDH_01.nc, col=cl, main ="ALBEDO 25-09-19/25-10-19")
plot(c_gls_ALDH_02.nc, col=cl, main ="ALBEDO 26-10-19/25-11-19")
plot(c_gls_ALDH_03.nc, col=cl, main ="ALBEDO 26-11-19/25-12-19")
plot(c_gls_ALDH_04.nc, col=cl, main ="ALBEDO 26-12-19/25-01-20")
plot(c_gls_ALDH_05.nc, col=cl, main ="ALBEDO 26-01-20/25-02-20")
plot(c_gls_ALDH_06.nc, col=cl, main ="ALBEDO 26-02-20/25-03-20")
plot(c_gls_ALDH_07.nc, col=cl, main ="ALBEDO 26-03-20/25-04-20")
plot(c_gls_ALDH_08.nc, col=cl, main ="ALBEDO 26-04-20/25-05-20")
plot(c_gls_ALDH_09.nc, col=cl, main ="ALBEDO 26-05-20/25-06-20")

difALB <- ("c_gls_ALDH_09.nc" - "c_gls_ALDH_01.nc")
cldif<- colorRampPalette(c('green','orange','yellow'))(100) # 
plot(difALB, col=cldif)

boxplot(ALBstack,horizontal=T,axes=T,outline=F,xlab="Albedo", ylab="Period")

albedo <- raster("ALBEDO")
cl <- colorRampPalette (c('green','orange','yellow')) (100) 
plot(albedo, col=cl, main ="ALBEDO PERIODO") 


fapar <- raster("fapar.nc")
cl <- colorRampPalette (c('black','yellow','green')) (100)
plot(fapar, col=cl, main ="FAPAR 13/12/2019-31/08/2020")


lai <- raster("lai.nc")
cl <- colorRampPalette (c('black','yellow','green')) (100)
plot(lai, col=cl, main ="LAI 13/12/2019-31/08/2020")


ext <- c(0,50,40,60) 
EUALBEDO <- crop (albedo, ext) 
cl <- colorRampPalette (c('green','blue','yellow')) (100) 
plot(EUALBEDO, col=cl, main ="EU.ALBEDO 15/04-15/05/20")


ext <- c(0,50,40,60) 
EUFAPAR <- crop (fapar, ext)
cl <- colorRampPalette (c('brown','yellow','red')) (100)
plot(EUFAPAR, col= cl, main="EU.FAPAR 13/12/2019-31/08/2020")

ext <- c(0,50,40,60)
EULAI <- crop (lai, ext)
cl <- colorRampPalette (c('black','yellow','green')) (100)
plot(EULAI, col= cl, main="EU.LAI 13/12/2019-31/08/2020")


par(mfrow=c(1,3))
plot(EUFAPAR, col=cl,main="EU.FAPAR 13/12/2019-31/08/2020") 
plot(EUALBEDO, col=cl,main="EU.ALBEDO 15/04-15/05/20")
plot(EULAI,col=cl, main="EU.LAI 13/12/2019-31/08/2020")

plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")









