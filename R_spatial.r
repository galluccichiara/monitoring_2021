# R spatial

#firs of all let's put in R the installed package in order to recall it
library (sp)

data(meuse)
head(meuse)

# Explain to R that we basically we have coordinates of dataset
coordinates(meuse) = ~x+y

# to show dataset in space, how they are scattled in the field 
plot(meuse)

#we can see spread of our datas (e.g where zinc is higher in the field)
#spplot is used to plot elements like zinc, lead etc spread in space, to see the concentration of zinc in space
#column are written in " "
spplot(meuse,"zinc")

#put the title of plot
spplot(meuse,"zinc", main= "concentration of zinc")

#let's try to plot the concentration of copper 
spplot(meuse,"copper", main= "concentration of copper")

#let's try to plot the concentration of copper and zinc, it's an arrey (set of arguments)
spplot(meuse, c("copper","zinc"))

#rather than distinguishing concentration of datas through different colours, we can make use bubbles and their different size highlight the difference in concentrarion
bubble(meuse,"zinc") 

#do the same for copper
bubble(meuse, "copper")

#change the data
bubble(meuse, "lead", col="red")
