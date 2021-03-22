library(ncdf4) 
library(raster)
setwd("C:/lab/")

rlist <- list.files(pattern="c_gls_ALDH_")
rlist
list_rast <- lapply(rlist,raster) 
ALDHstack <- stack(list_rast)

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








