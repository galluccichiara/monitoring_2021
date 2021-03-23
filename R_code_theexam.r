library(ncdf4) 
library(raster)
setwd("C:/lab/")

rlist <- list.files(pattern="c_gls_ALDH_")
rlist
list_rast <- lapply(rlist,raster) 
ALBstack<- stack(list_rast)

#ALB01 <- raster("c_gls_ALDH_01.nc")
#ALB02 <- raster("c_gls_ALDH_02.nc")
#ALB03 <- raster("c_gls_ALDH_03.nc")
#ALB04 <- raster("c_gls_ALDH_04.nc")
#ALB05 <- raster("c_gls_ALDH_05.nc")
#ALB06 <- raster("c_gls_ALDH_06.nc")
#ALB07 <- raster("c_gls_ALDH_07.nc")
#ALB08 <- raster("c_gls_ALDH_08.nc")
#ALB09 <- raster("c_gls_ALDH_09.nc")

par(mfrow=c(3,3))
cl <- colorRampPalette (c('green','orange','yellow')) (100)
plot(ALBstack,col =cl, main=c ("ALBEDO 25-09-19/25-10-19", "ALBEDO 26-10-19/25-11-19", "ALBEDO 26-11-19/25-12-19", "ALBEDO 26-12-19/25-01-20", "ALBEDO 26-01-20/25-02-20", "ALBEDO 26-02-20/25-03-20", "ALBEDO 26-03-20/25-04-20","ALBEDO 26-04-20/25-05-20", "ALBEDO 26-05-20/25-06-20"))

#par(mfrow=c(3,3))
#cl <- colorRampPalette (c('green','orange','yellow')) (100)
#plot(ALB01, col=cl, main ="ALBEDO 25-09-19/25-10-19")
#plot(ALB02, col=cl, main ="ALBEDO 26-10-19/25-11-19")
#plot(ALB03, col=cl, main ="ALBEDO 26-11-19/25-12-19")
#plot(ALB04, col=cl, main ="ALBEDO 26-12-19/25-01-20")
#plot(ALB05, col=cl, main ="ALBEDO 26-01-20/25-02-20")
#plot(ALB06, col=cl, main ="ALBEDO 26-02-20/25-03-20")
#plot(ALB07, col=cl, main ="ALBEDO 26-03-20/25-04-20")
#plot(ALB08, col=cl, main ="ALBEDO 26-04-20/25-05-20")
#plot(ALB09, col=cl, main ="ALBEDO 26-05-20/25-06-20")


boxplot(ALBstack,horizontal=T,axes=T,outline=F, col="sienna1",xlab="Albedo", ylab="Period",names=c ("01", "02", "03", "04", "05", "06", "07", "08", "09"))



albedo <- raster("c_gls_ALDH_05.nc")
cl <- colorRampPalette (c('green','chocolate3','darkblue')) (100) 
plot(albedo, col=cl,main ="ALBEDO 26-01-20/25-02-20") 

ALB05 <- raster("c_gls_ALDH_05.nc")
ALB06 <- raster("c_gls_ALDH_06.nc")
difALB <- ALB06 - ALB05
cldif<- colorRampPalette(c('red','wheat','red'))(100)
plot(difALB, col=cldif, main= "Difference Alb06 - Alb05")

albedo <- raster("c_gls_ALDH_06.nc")
cl <- colorRampPalette (c('green','chocolate3','darkblue')) (100) 
plot(albedo, col=cl,main ="ALBEDO 26-02-20/25-03-20") 

fapar <- raster("c_gls_FAPAR300_202005100000_GLOBE_PROBAV_V1.0.1.nc")
cl <- colorRampPalette (c('burlywood4','yellow','green4')) (100)
plot(fapar, col=cl, main ="FAPAR 13/10/2019-30/06/2020")


lai <- raster("c_gls_LAI300_202005100000_GLOBE_PROBAV_V1.0.1.nc")
cl <- colorRampPalette (c('burlywood4','yellow','green4')) (100)
plot(lai, col=cl, main ="LAI 13/10/2019-30/06/2020")


ext <- c(0,50,40,60) 
EUALBEDO <- crop (albedo, ext) 
cl <- colorRampPalette (c('green','chocolate3','darkblue')) (100) 
plot(EUALBEDO, col=cl, main ="EU.ALBEDO 26-01-20/25-02-20")


ext <- c(0,50,40,60) 
EUFAPAR <- crop (fapar, ext)
cl <- colorRampPalette (c("burlywood4","yellow","green4")) (100)
plot(EUFAPAR, col= cl,main="EU.FAPAR 13/10/2019-30/06/2020")

ext <- c(0,50,40,60)
EULAI <- crop (lai, ext)
cl <- colorRampPalette (c("burlywood4","yellow","green4")) (100)
plot(EULAI, col= cl, main="EU.LAI 13/10/2019-30/06/2020")


par(mfrow=c(1,3))
cl <- colorRampPalette (c("burlywood4","yellow","green4")) (100)
plot(EUFAPAR, col=cl,main="EU.FAPAR 13/10/2019-30/06/2020") 
cl <- colorRampPalette (c('green','chocolate3','darkblue')) (100) 
plot(EUALBEDO, col=cl,main="EU.ALBEDO 15/04-15/05/20")
cl <- colorRampPalette (c("burlywood4","yellow","green4")) (100)
plot(EULAI,col=cl, main="EU.LAI 13/10/2019-30/06/2020")

#???????????????????
plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")
plotRGB(ALB, blue=ALB01, red=ALB05, yellow=ALB09, stretch="lin")









