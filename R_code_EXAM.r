#source: # https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
#library function= recalling packages
#ncdf4 package (already installed with the function install.packages("ncdf4")) = using to open and read easily binary data files that are portable across platformsand include metadata information in addition to the data sets
#"..." (brackets) = importing data from an external source;
library(ncdf4) 
#raster package (already installed with the function install.packages("raster")) = reading, writing, manipulating, analyzing and modeling of spatial (Geographic Data Analysis and Modeling)
library(raster) #raster package (already installed with the function install.packages("raster")) = raster function used for importing,read and model spatial data analysis 
setwd("C:/lab/") #setwd function= setting a new working directory

#instead of importing all files referring Albedo one by one, let's import them all together
rlist<-list.files(pattern="c_gls_ALDH_")
rlist # to recall the list files
list_rast <- lapply(rlist,raster) #lapply=apply the raster fuction to the list of file regarding Surface Albedo
ALBstack<- stack(list_rast) #stack function is used to transform data available as separate columns in a data frame or list into a single column 

#let's plot in a single overview all plots referring Albedo and let's set up them in 3 rows and 3 columns 
par(mfrow=c(3,3))
cl <- colorRampPalette(c('green','orange','yellow')) (100) #colorRampPalette = using and edit color schemes, yellow is used for maximum values because it is the colour that has the maximum impact to our eyes, 100 is the number of color in the used color scale; #c= setting things ("c" is for "characters") before the array
plot(ALBstack,col =cl, main=c ("ALBEDO 25-09-19/25-10-19", "ALBEDO 26-10-19/25-11-19", "ALBEDO 26-11-19/25-12-19", "ALBEDO 26-12-19/25-01-20", "ALBEDO 26-01-20/25-02-20", "ALBEDO 26-02-20/25-03-20", "ALBEDO 26-03-20/25-04-20 ","ALBEDO 26-04-20/25-05-20", "ALBEDO 26-05-20/25-06-20"))
#plot = plotting/showing  R objects
#main = giving a title

#my analysis focuses on a specific timeframe (from 13/10/2019 to 30/06/2020, but there is a mismatch in timeframe btw Albedo Data and LAI/FAPAR Data
#Let's perform a pathway of selection in order to choose the most suitable Albedo output taken as sample reference in the Albedo Data Collection
boxplot(ALBstack,horizontal=T,axes=T,outline=F, col="sienna1",xlab="Albedo", ylab="Period",names=c ("01", "02", "03", "04", "05", "06", "07", "08", "09")) 
#x- and y-lab means labelling axys -> x- and y-axys annotation
#info about the comparaison among the 9 boxplots: the minimum, maximum and mean values of each ones diversifies because they change according to the related month we are dealing with.
#x- and y-lab means labelling axys -> x- and y-axys annotation 
#names=c function numbers the boxplots 

#Let's take the boxplot 05 as sample reference because firstly, it is the median output and secondly, it assumes, including Albedo 06, a wider range of values which may result in a more accurate comparison. 
ALB05 <- raster("c_gls_ALDH_05.nc")
cl <- colorRampPalette (c('green','chocolate3','darkblue')) (100)
plot(ALB05, col=cl,main ="ALBEDO 26-01-20/25-02-20") 

#lackness: Albedo 05 plot has very low resolution quality exactly in the case study area, so let’s check through dif function the equality btw Albedo 05 and 06 in terms of values 
#let’s graphically verify how much they diversify from one each other.
difALB <- ALB06 - ALB05
cldif<- colorRampPalette(c('red','wheat','red'))(100)
plot(difALB, col=cldif, main= "Difference Alb06 - Alb05")
#as we can observe exactly where the colour red is much more intense, Alb05 and Alb06 show different values for a specific area, but in this case no significant diversification occurs, especially in the case study area.

#Let's plot Albedo 06
ALB06 <- raster("c_gls_ALDH_06.nc")
cl <- colorRampPalette (c('green','chocolate3','darkblue')) (100)
plot(ALB06, col=cl,main ="ALBEDO 26-02-20/25-03-20") 

#let's do the same regarding Vegetation Properties - FAPAR 300m V1 during the period: 13/10/2019-30/06/2020
fapar <-raster("c_gls_FAPAR300_202005100000_GLOBE_PROBAV_V1.0.1.nc")
cl <- colorRampPalette (c('burlywood4','yellow','green4')) (100)
plot(fapar, col=cl, main ="FAPAR 13/10/2019-30/06/2020")

#let's do the same regarding Vegetation Properties - LAI 300m V1 during the period: 13/10/2019-30/06/2020
lai <- raster("c_gls_LAI300_202005100000_GLOBE_PROBAV_V1.0.1.nc")
cl <- colorRampPalette (c('burlywood4','yellow','green4')) (100)
plot(lai, col=cl, main ="LAI 13/10/2019-30/06/2020")

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

#CONCLUSIONS:
#This specific geographic area demonstrates that where Albedo maintains a low level, this is not necessarily due to high values of LAI
#High level of FAPAR compensates for this deficiency
#Despite the green and alive elements of the canopy doesn’t provide a high level of LAI due to their typology and quantity of canopy, the fraction of the solar radiation absorbed by live leaves for the photosynthesis activity is significantly intense anyway.





