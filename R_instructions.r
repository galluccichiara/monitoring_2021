# hashtag for comments

primates <- c(3, 5, 9, 15, 40)
primates
#c is sort of set of things ("c" is for "characters") before the array --> c(3,5,9,15,40) is an array [data]

crabs <- c(199, 70, 30, 10, 5)
# <- [the arrow] is to give name to data set
#now if i put the name of the data set, R then shows data set 

#first plot in R between primates and crabs data
#everything in the parenthesis is called "argument"
#plot function (x,y)
plot(primates, crabs)

#change the color of the plot --> col="name of the color"
#pch is point of character, to change shape of point in plot --> pch="number of the code"
plot(primates, crabs, col="red", pch=19)

#cex is character exageration, to change dimension of point in plot
plot(primates, crabs, col="red", pch=19, cex=2)

#main, to give a title to the plot [with brackets]
plot(primates, crabs, col="red", pch=19, cex=2, main="my first ecological graph in R!")

#make a table in R, table in R are called "data.frame"
data.frame(primates, crabs)
#give a name to dataframe
ecoset <- data.frame(primates, crabs)

#mean of the primates data
(3+5+9+15+40)/5 and copy in R

#simpler manner to compute mean
#summary of data.frame, to know several statistical info
summary <- ecoset
---------------

#install.packages is used to install packages
install.packages("sp")
library(sp)

#data is used to recall datasets
data(meuse)

#View (with V not v) ... Invoke a spreadsheet-style data viewer on a matrix-like R object.
View(meuse)

#exercise: plot zinc (y) against cadmium (x)
see an error --> plot(cadmium, zinc)
Error in h(simpleError(msg, call)) : 
  error in evaluating the argument 'x' in selecting a method for function 'plot': oggetto "cadmium" non trovato
  
  #$ link elements and dataset
  not error: plot(meuse$cadmium, meuse$zinc)
  
  #if you attach is not necessary $ --> just once, then you have to #deattach to stop it
attach(meuse)
plot(cadmium,zinc)

#pairs --> scatterplot matrices (to compare all the elements)
pairs(meuse)

#head is used to see the first data
head(meuse)


--------
9/11
#LECTURE ON ECOLOGICAL
#how to recall sp packages and data meuse
library(sp)
data(meuse)
pairs(meuse)
head(meuse)

#cadmium, copper, lead, zinc
#pairs with soil variables
#from column 3 to column 6
pairs(meuse[,3:6])

dev.off() --> close window

#let's use the names of column
pairs(~ cadmium + copper + lead + zinc, data=meuse)
#tilde is going to be done by alt+126

#let's prettify the graphs
#exercise: just use cadmium, lead, zinc
pairs(~ cadmium + lead + zinc, data=meuse)

#exercise: change the color
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red")
#for the future change colours of single panels by the par ()function

#exercise: change the symbol to filled triangles: pch
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17)

#nice page
#https://statisticsglobe.com/r-pairs-plot-example/t

#exercise: increase size of triangles
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17, cex=3)
