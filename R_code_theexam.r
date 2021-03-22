library(ncdf4) 
library(raster)
setwd("C:/lab/")

rlist <- list.files(pattern="c_gls_ALDH_")
rlist
list_rast <- lapply(rlist,raster) 
ALDHstack <- stack(list_rast)

par(mfrow=c(3,3))
plot(ALDHstack)

par(mfrow=c(3,3))
cl <- colorRampPalette (c('green','orange','yellow')) (100)
plot(c_gls_ALDH_01.nc, col=cl, main ="ALBEDO 25-09-19/25-10-19)
plot(c_gls_ALDH_02.nc, col=cl, main ="ALBEDO 26-10-19/25-11-19)
plot(c_gls_ALDH_03.nc, col=cl, main ="ALBEDO 26-11-19/25-12-19)
plot(c_gls_ALDH_04.nc, col=cl, main ="ALBEDO 26--19/22-10-19)



