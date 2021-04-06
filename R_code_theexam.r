#source: # https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
#library function= recalling packages
#ncdf4 package (already installed with the function install.packages("ncdf4")) = using to open and read easily binary data files that are portable across platforms and include metadata information in addition to the data sets
#"..." (brackets) = importing data from an external source;
library(ncdf4) 
#raster package (already installed with the function install.packages("raster")) = reading, writing, manipulating, analyzing and modeling of spatial (Geographic Data Analysis and Modeling)
library(raster)  #raster package (already installed with the function install.packages("raster")) = using spatial data;
setwd("C:/lab/") #setwd function= setting a new working directory

# Let's start the pathway of selection for the most suitable product to take as reference in the Albedo Data Collection

#import to R list of Albedo files naming ""c_gls_ALDH_" all together (images since 25/09/19 until 25/06/20)
rlist <- list.files(pattern="c_gls_ALDH_")
rlist #recall the list in order to see all files
list_rast <- lapply(rlist,raster) #apply raster function to listi of files in order to import and read data
ALBstack<- stack(list_rast) #let's produce a stack (a list of data put all together) and name it

#Otherwise import to R one by one and name them. The otuput is the same,but in the previous case we cam plot more easily all images with just one line
#ALB01 <- raster("c_gls_ALDH_01.nc")
#ALB02 <- raster("c_gls_ALDH_02.nc")
#ALB03 <- raster("c_gls_ALDH_03.nc")
#ALB04 <- raster("c_gls_ALDH_04.nc")
#ALB05 <- raster("c_gls_ALDH_05.nc")
#ALB06 <- raster("c_gls_ALDH_06.nc")
#ALB07 <- raster("c_gls_ALDH_07.nc")
#ALB08 <- raster("c_gls_ALDH_08.nc")
#ALB09 <- raster("c_gls_ALDH_09.nc")

#Using par function (), let's put images one beside the other in order to more easily compare and to understand their chronological sequence
par(mfrow=c(3,3)) #the first number in () refers to number of rows and the second one to number of columns
#colorRampPalette = using and edit color schemes, yellow is used for maximum values because it is the colour that has the maximum impact to our eyes, 100 is the number of color in the used color scale; #c= setting things ("c" is for "characters") before the array
cl <- colorRampPalette (c('green','orange','yellow')) (100)
#plot = plotting/showing of R objects
#main = giving a title
plot(ALBstack,col =cl, main=c ("ALBEDO 25-09-19/25-10-19", "ALBEDO 26-10-19/25-11-19", "ALBEDO 26-11-19/25-12-19", "ALBEDO 26-12-19/25-01-20", "ALBEDO 26-01-20/25-02-20", "ALBEDO 26-02-20/25-03-20", "ALBEDO 26-03-20/25-04-20","ALBEDO 26-04-20/25-05-20", "ALBEDO 26-05-20/25-06-20"))

#Otherwise import to R one by one
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

#The boxplot function shows how the distribution of a numerical variable y (in this case period-> different months) differs across the unique levels of a second variable, x (in this case Albedo)
boxplot(ALBstack,horizontal=T,axes=T,outline=F, col="sienna1",xlab="Albedo", ylab="Period",names=c ("01", "02", "03", "04", "05", "06", "07", "08", "09"))
#horizontal= true, logical indicating if the boxplots should be horizontal; default FALSE means vertical boxes.
#axes = true, it means axes are graphically shown. 
#if outline is false, the outliers are not drawn
#lab function labels x and y axis (x- and y-axis annotation)
#names are group labels for each boxplot

#Comments on the outcome boxplots: as we can notice, each boxplot diversifies more or less from each other (both regarding the media and the range of the min and max values) because it depends on the month they refer to. The data concerning Albedo cover a monthly timeframe, while those referring to FAPAR and LAI cover a wider timeframe (7 months), so the most suitable product in the Albedo Data Collection taken as sample might be that one referring to boxplot number 5° (26-01-20/25-02-20), because it is the median product (the central product among Albedo products). In addition, Albedo products of Boxplots 5 and 6 assume a wider range of values and therefore they allow for a more accurate comparaison;
 
#Let's take as sample reference Albedo n°5 -> ALBEDO 26-01-20/25-02-20
ALB05 <- raster("c_gls_ALDH_05.nc")
cl <- colorRampPalette (c('green','chocolate3','darkblue')) (100)
plot(ALB05, col=cl,main ="ALBEDO 26-01-20/25-02-20") 
#Plotting ALB05 makes me realise its low quality resolution exactly in the specific area (my case study area comparable to the Eurorpean extent) where we are going to focus on; for this reason, let's switch ALB05 and ALB06 which are pretty equal concerning range of values that their boxplots assume.
ALB06 <- raster("c_gls_ALDH_06.nc")
cl <- colorRampPalette (c('green','chocolate3','darkblue')) (100)
plot(ALB06, col=cl,main ="ALBEDO 26-01-20/25-02-20") 

#let's check through dif function their equality in terms of values. 
difALB <- ALB06 - ALB05
cldif<- colorRampPalette(c('red','wheat','red'))(100)
plot(difALB, col=cldif, main= "Difference Alb06 - Alb05") #exactly where the colour red is much more intense, Alb05 and Alb06 show different values for a specific area, but in this case no significant diversification occurs, especially in the case study area.


#let's import image regarding Vegetation Properties - FAPAR 300m V1 during the period: 13/10/19-30/06/20
fapar <- raster("c_gls_FAPAR300_202005100000_GLOBE_PROBAV_V1.0.1.nc")
cl <- colorRampPalette (c('burlywood4','yellow','green4')) (100)
plot(fapar, col=cl, main ="FAPAR 13/10/2019-30/06/2020")

#let's do the same regarding Vegetation Properties - LAI 300m V1 during the period: 13/10/19-30/06/20
lai <- raster("c_gls_LAI300_202005100000_GLOBE_PROBAV_V1.0.1.nc")
cl <- colorRampPalette (c('burlywood4','yellow','green4')) (100)
plot(lai, col=cl, main ="LAI 13/10/2019-30/06/2020")

#focus on a specific area in order to analyse the correlation-> this area, whose extent may be overlapped to Europe extent, is representative in order to understand my case study
ext <- c(0,50,40,60)  #ext = defining minimum and maximum of x, y variables
EUALBEDO <- crop (albedo, ext) #crop= zooming in on a specific part of the map (the specific area analyzed), it's for geographic subset; #,ext = the extension previously declared
cl <- colorRampPalette (c('green','chocolate3','darkblue')) (100) 
plot(EUALBEDO, col=cl, main ="EU.ALBEDO 26-01-20/25-02-20")

#let's do the same with FAPAR in order to obtain plot having the same extent
ext <- c(0,50,40,60) 
EUFAPAR <- crop (fapar, ext)
cl <- colorRampPalette (c("burlywood4","yellow","green4")) (100)
plot(EUFAPAR, col= cl,main="EU.FAPAR 13/10/2019-30/06/2020")

#let's do the same with LAI
ext <- c(0,50,40,60)
EULAI <- crop (lai, ext)
cl <- colorRampPalette (c("burlywood4","yellow","green4")) (100)
plot(EULAI, col= cl, main="EU.LAI 13/10/2019-30/06/2020")

#let's graphically compare the three plots and let's locate the plot regarding EU.ALBEDO in-between EU.FAPAR and EU.LAI respectively in order to have a clearer overall picture about albedo-fapar and albedo-lai correlationship
par(mfrow=c(1,3)) #par = setting graphical parameters => par(mfrow = c (nrows,ncolumns) = creating a matrix of nrows, ncolumns to plot the two obtained maps together and compare them
cl <- colorRampPalette (c("burlywood4","yellow","green4")) (100)
plot(EUFAPAR, col=cl,main="EU.FAPAR 13/10/2019-30/06/2020") 
cl <- colorRampPalette (c('green','chocolate3','darkblue')) (100) 
plot(EUALBEDO, col=cl,main="EU.ALBEDO 15/04-15/05/20")
cl <- colorRampPalette (c("burlywood4","yellow","green4")) (100)
plot(EULAI,col=cl, main="EU.LAI 13/10/2019-30/06/2020")

#???????????????????
plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")
plotRGB(ALB, blue=ALB01, red=ALB05, yellow=ALB09, stretch="lin")









