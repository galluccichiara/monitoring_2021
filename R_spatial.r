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

#TO BE CONTINUED..
#LECTURE 2 
#install a new packages
install.packages("ggplot2")
library(ggplot2)

#let's put a new ecological dataframe
#e.g relationship between biofuels and amount of oxydatve enzimes 
#let's make an array of values
biofuels <- c(120, 200,300,570,750) 
oxydative <- c(1200,1300, 21000,34000,50000)

#let's make our dataframe (table: columns + rows) 
d <- data.frame(biofuels,oxydative)

#let's make plot
#first of all closed to parenthesis, name of data-> in this case "d"
ggplot(d, aes(x= biofuels, y=oxydative))

#now we can choose how to set our plot (points, lines)
#if we choose to build points inside the plot
ggplot(d, aes(x= biofuels, y=oxydative))+ geom_point()

#let's to prettify
ggplot(d, aes(x= biofuels, y=oxydative))+ geom_point(col="red")
#since we're using gg package, let's replace size instead of cex in order to increse size of characters. 
ggplot(d, aes(x= biofuels, y=oxydative))+ geom_point(size= 5, col="red")

#let's use line, texting geom_line
ggplot(d, aes(x= biofuels, y=oxydative))+ geom_line(size= 5, col="red")

# let's mix lines+points
ggplot(d, aes(x= biofuels, y=oxydative))+ geom_point (size= 5, col="red") + geom_line ()

# let's make polygon, in order to look how points are scattered from line
ggplot(d, aes(x= biofuels, y=oxydative)) + geom_polygon ()

#### IMPORT DATA FROM AN EXTERNAL SOURCE
#setwd("path/lab")
setwd( "C:/lab/")
# Mac 
# Mac setwd("/Users/yourname/.../lab")

