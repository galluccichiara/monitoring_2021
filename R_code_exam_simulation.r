#R code for the exam
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

#nc data: we need library
#https://cran.r-project.org/web/packages/ncdf4/index.html

install.packages("ncdf4") 
library(ncdf4)
library(raster)
setwd("C:/lab/") 

#importing images of temperature of soil in January
tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
#raster function in this case show just 1 layer (T of soil in Jan)
plot(tjan)
#change colorramppalette 
cltjan <- colorRampPalette(c('black','grey','light grey'))(100) #
plot(tjan, col=cltjan)

#importing images of temperature of soil in October
toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(toct, col=cltjan)
cltoct <- colorRampPalette(c('blue','yellow','red'))(100) #

#difference in temperature
dift <- tjan - toct
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(dift, col=cldif)
#the reddish, the higher difference / the blueish, the lower difference
