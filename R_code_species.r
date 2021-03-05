#speciesdistributionmodel
#to link ecosystem components (environmental condition) to a specie
#starting with in-situ data, then see how species are distribuited over space based on these environmental conditions
#Occurence: presence (1) or absence (0) of species ..abscence isn't sure
#we see the links between presence of species related to the layers referred to environmental conditions (GeneralizedLinearModel= model of these layers)
#is used to predict the possibility/probability of the presence of a specie, based on its environmental conditions : PERCEPTION
#is used to understand why a specie is there : UNDERSTANDING
#Environmental conditions (variables used to predict the presence): temperature, elevation, precipitation, vegetation
# if any errors come out: install.packages("sdm")
library(sdm)
library(raster)
library(rgdal) #spatial data for importing shapefile
#system.file function of R to catch files into a certain library #import species data

file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)
species
#let's see the info (spatialpointsdataframe, features, extent, variables(name,min,max))
plot(species)

#change point character 
plot(species, pch=17)
#let'see the presence and the absence 
species$Occurrence#$ to link

#the points in blue are the presences, the absences are in red
plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)

#obtain the list of files (elevation, temperature, vegetation and precipitation)
# predictors: look at the path
path <- system.file("external", package="sdm")
# list the predictors ###the aim is to predict with previous image/data the possible values 
lst <- list.files(path=path,pattern='asc$',full.names = T) #listfiles function to list files of a folder ##pattern is the rule how to see the file (asc file (a standard extension) + $ (all the asc data)
lst
preds <- stack(lst) #stack to have all files(=layers=env.conditions) of the list
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

#now let's plot one by one single layers
#single plot 
#(ELEVATION)
plot(preds$elevation, col=cl, main='elevation')
points(species[species$Occurrence == 1,], pch=17)
#TEMPERATURE
plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)
#PRECIPITATION
plot(preds$precipitation, col=cl, main='precipitation')
points(species[species$Occurrence == 1,], pch=17)
#VEGETATION
plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,], pch=17)

#IF WE WANT TO CHANGE POINT COLOUR
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], col='blue', pch=17)

# add to the stack
s1 <- stack(preds,p1)
plot(s1, col=cl)
#point data + predictors -> model
#first, let's explain to R which are the data with #sdmData function
datasdm <- sdmData(train=species, predictors=preds) #train is training set, the in-situ data
datasdm #show info
#let's build the model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm") #tilde ~ says that "occurence is = to..." ###glm generalized linear model
# make the raster output layer, the final prediction
p1 <- predict(m1, newdata=preds) #predict function
#plot the output
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=17)
# add to the stack, show the 4 layers and the speciesdistributionmodel all together
s1 <- stack(preds,p1) #preds is the name of the stack of the 4 layers, #p1 is the sdm
plot(s1, col=cl)

#Model combines temperature, vegetation, precipitation and occurence in order to check the spatial distribution, there is high probability where yellow and red space, blue colours low probability to find species. 
##i valori del modello spiegano la probabilità di trovare una specie e infatti questo è in linea con le previsioni perchè dove le specie avevano occurance 1 hanno alta probabilità nel modello, le specie che avevano occurance 0 bassa. PROBABILITY OF DISTRIBUTION 
