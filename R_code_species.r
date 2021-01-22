
# if any errors come out: install.packages("sdm")
library(sdm)
library(raster)
library(rgdal)

file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)
species
plot(species)

#change point character 
plot(species, pch=17)
#let'see the presence and the absence 
species$Occurrence

#the points in blue are the presences, the absences are in red
plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)

#obtain the list of files (elevation, temperature, vegetation and precipitation)
path <- system.file("external", package="sdm")
# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

preds <- stack(lst)
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

#each single plot (ELEVATION)
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

#let's make the model 
datasdm <- sdmData(train=species, predictors=preds)
datasdm
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=17)
#i valori del modello spiegano la probabilità di trovare una specie e infatti questo è in linea con le previsioni perchè dove le specie avevano occurance 1 hanno alta probabilità nel modello, le specie che avevano occurance 0 bassa. PROBABILITY OF DISTRIBUTION 

# add to the stack
s1 <- stack(preds,p1)
plot(s1, col=cl)

#Model combines temperature, vegetation, precipitation and occurence in order to check the spatial distribution, there is high probability where yellow and red space, blue colours low probability to find species. 
