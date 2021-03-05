#multivariate analysis to reduce the dimensionality of the plots and explain most of variability, showing it in just 2 axis
#R_code_multivar.r
install.packages("vegan")
# setwd for Windows
setwd("C:/lab/")
library(vegan)
load("biomes_multivar.RData")
ls()

#plot per species matrix
head(biomes)
#-->reduce the 6axis showed with the function: head(biomes), in 2 axes-->see the space in just 2 dimensions--->we will see how these species are connected each other

#decorana---> Detrended correspondence analysis --> to se relationships among several elements
multivar <- decorana(biomes) 
multivar
#we can see how species are related to each other 
plot(multivar)
head(biomes_types)
--> #now plot are not axes, arrows, but points in the graphs -->  
  #      chestnut beech giant_orb maple_acer rafflesia lichens brown_bear oak lianas  
  #   1      1     0         0          0         0       0          0   0      0
#now is --->        
 #        A1   tcode      type
 #    1   1     1      temperate

#biomes names in the graph:
attach(biomes_types)
#let's draw eclipse
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3) 
#ordiellipse is a "synonym" in some cases of multivariate analysis
#one ordiellipse function is #kind = shape 

#legend function
#show names of biomes types in graph and let's add and arrows
ordispider(multivar, type, col=c("black","red","green","blue"), label = T) 

#save the work and the graph as PDF file
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()

#So now what you are able to do is if you have data with the X&Y, you can do point pattern analysis to monitor the change in time and space of your data.
#if you have plot per species, you can do multivariate analysis like this to see how is it going to change in time and even in space
