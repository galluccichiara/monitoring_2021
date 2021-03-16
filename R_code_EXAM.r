#source: # https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
#library function= recalling packages
#ncdf4 package (already installed with the function install.packages("ncdf4")) = using to open and read easily binary data files that are portable across platformsand include metadata information in addition to the data sets
#"..." (brackets) = importing data from an external source;
library(ncdf4) 
#raster package (already installed with the function install.packages("raster")) = reading, writing, manipulating, analyzing and modeling of spatial (Geographic Data Analysis and Modeling)
library(raster) #raster package (already installed with the function install.packages("raster")) = using spatial data; 
setwd("C:/lab/") #setwd function= setting a new working directory

#let's import image about Hemispherical Albedo 1km Global V1 during the period: 15/04/2020-15/05/2020 -> this specific timeframe as "reference mean period"
#raster function = import and read data; #albedo <- = giving a name to this data
albedo <- raster("albedo1.nc")
cl <- colorRampPalette (c('green','orange','yellow')) (100) #colorRampPalette = using and edit color schemes, yellow is used for maximum values because it is the colour that has the maximum impact to our eyes, 100 is the number of color in the used color scale; #c= setting things ("c" is for "characters") before the array
#plot = plotting/showing of R objects
plot(albedo, col=cl, main ="ALBEDO 15/04-15/05/20") #main = giving a title

#let's do the same regarding Vegetation Properties - FAPAR 300m V1 during the period: 13/12/2019-31/08/2020
fapar <- raster("fapar.nc")
cl <- colorRampPalette (c('black','yellow','green')) (100)
plot(fapar, col=cl, main ="FAPAR 13/12/2019-31/08/2020")

#let's do the same regarding Vegetation Properties - LAI 300m V1 during the period: 13/12/2019-31/08/2020
lai <- raster("lai.nc")
cl <- colorRampPalette (c('black','yellow','green')) (100)
plot(lai, col=cl, main ="LAI 13/12/2019-31/08/2020")

#focus on a specific area in order to analyse the correlation-> this area, whose extent may be overlapped to Europe extent, is representative in order to understand my case study
ext <- c(0,50,40,60) #ext = defining minimum and maximum of x, y variables
EUALBEDO <- crop (albedo, ext) #crop= zooming in on a specific part of the map (the specific area analyzed), it's for geographic subset; #,ext = the extension previously declared
cl <- colorRampPalette (c('green','blue','yellow')) (100) 
plot(EUALBEDO, col=cl, main ="EU.ALBEDO 15/04-15/05/20")

#let's do the same with FAPAR in order to obtain plot having the same extent
ext <- c(0,50,40,60) 
EUFAPAR <- crop (fapar, ext)
cl <- colorRampPalette (c('brown','yellow','red')) (100)
plot(EUFAPAR, col= cl, main="EU.FAPAR 13/12/2019-31/08/2020")

#let's do the same with LAI
ext <- c(0,50,40,60)
EULAI <- crop (lai, ext)
cl <- colorRampPalette (c('black','yellow','green')) (100)
plot(EULAI, col= cl, main="EU.LAI 13/12/2019-31/08/2020")

#let's graphically compare the three plots and let's locate the plot regarding EU.ALBEDO in-between EU.FAPAR and EU.LAI respectively in order to have a clearer overall picture about albedo-fapar and albedo-lai correlationship
par(mfrow=c(1,3)) #par = setting graphical parameters => par(mfrow = c (nrows,ncolumns) = creating a matrix of nrows, ncolumns to plot the two obtained maps together and compare them
plot(EUFAPAR, col=cl,main="EU.FAPAR 13/12/2019-31/08/2020") 
plot(EUALBEDO, col=cl,main="EU.ALBEDO 15/04-15/05/20")
plot(EULAI,col=cl, main="EU.LAI 13/12/2019-31/08/2020")

# With regards to Albedo values, since I chose the products observed during the period bounded btw 15/04 and 15/05/20 as reference example, I would like to 

# carica lista di Albedo da 13/12 a 31/08 
# stack
# dif tra primo e ultimo mese
# multivariate analysis 
dif <- EUFAPAR-EULAI
plot(dif)


#the outcomes show the huge amount of NO2 in January decreased during the following two months due to the main causes already described in the introduction: COVID-19, level of pollution, market crisis
#how to compute the difference between these two maps
difNO2 <- Taranto_jan_NO2 - Taranto_mar_NO2
cldif <- colorRampPalette (c('blue','black','yellow')) (100) #where the new map is more yellow, it means there's a decrease of NO2 level 
plot(difNO2, col=cldif)


#cosa notiamo + aggiusta colori 
#???? funzione salvataggio
