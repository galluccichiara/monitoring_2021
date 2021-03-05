library(ncdf4)
library(raster)
setwd("C:/lab/")
albedo <- raster("c_gls_ALBH_202001240000_GLOBE_PROBAV_V1.5.1.nc")

library(ncdf4)
library(raster)
setwd("C:/lab/")
soilwater<-raster("c_gls_SSM1km_202005200000_CEURO_S1CSAR_V1.1.1.nc")


library(ncdf4)
library(raster)
setwd("C:/lab/")
crioEuropa <- raster("c_gls_SCE500_202001050000_CEURO_MODIS_V1.0.1.nc")

library(ncdf4)
library(raster)
setwd("C:/lab/")
waterbo<-raster("c_gls_WB100_202010010000_GLOBE_S2_V1.0.1.nc")

library(ncdf4)
library(raster)
setwd("C:/lab/")
fapar <- raster("c_gls_FAPAR300_202008100000_GLOBE_PROBAV_V1.0.1.nc")
clfapar <- colorRampPalette(c('black','yellow','white'))(100) #
plot(fapar, col=clfapar)

library(ncdf4)
library(raster)
setwd("C:/lab/")
facover <- raster("c_gls_FCOVER300_202007310000_GLOBE_PROBAV_V1.0.1.nc")


library(ncdf4)
library(raster)
setwd("C:/lab/")
lai <- raster("c_gls_LAI-RT6_202001310000_GLOBE_PROBAV_V2.0.1.nc")


crio <- raster("c_gls_SCE_202001060000_NHEMI_VIIRS_V1.0.1.nc")
clcrio <- colorRampPalette(c('yellow','orange','red'))(100) #
plot(crio, col=clcrio)
