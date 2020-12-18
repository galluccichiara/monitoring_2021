#install packages
install.packages("vegan")

# setwd for Windows
setwd("C:/lab/")
library(vegan)

load("biomes_multivar.RData")

#plot per species matrix
head(biomes)
multivar <- decorana(biomes)
multivar
#we can see how species are related to each other 
plot(multivar)

#biomes names in the graph
#let's draw eclipse
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
#let's add names and arrows
ordispider(multivar, type, col=c("black","red","green","blue"), label = T) 
#in order to anylise in space and in time
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()
