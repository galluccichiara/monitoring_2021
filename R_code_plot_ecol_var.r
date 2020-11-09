# R code for plotting the relationship among ecological variables 

#install.package is used to install packages
install.packages("sp")
library(sp)

# data is used to recall datasets 
data(meuse)

#look in the set
meuse

#View (capital letter) is used to see more clearly dataset (in a table)
View(meuse)

#head is used 
head(meuse)

#mean of all the variables 
summary(meuse)

#plot cadmium against zinc
plot(cadmium, zinc)
Error in h(simpleError(msg, call)) : 
  error in evaluating the argument 'x' in selecting a method for function 'plot': oggetto "cadmium" non trovato
> 
#how to explain R that cadmium is inside a dataset? let's we use dollar 
#dollar is a symbol which links "cadmium" to dataset "meuse"

plot(meuse$cadmium,meuse$zinc)

#instead of using dollars we can use a function "attach function" to use variables in our dataset
attach(meuse)
plot(cadmium,zinc)

plot(cadmium,lead)

#if i want to make a plot with all variables related all toghether
#trivial (cadmium,lead/cadmium,zinc..) i can observe the relationship between two variables one by one
#pairs(meuse) if i want to observer them in a scattlered vision 

pairs(meuse)

#recall the package sp, recall the dataset meuse
library(sp)
data(meuse)

#see all variables in graphs or in table 
pairs(meuse) 
head(meuse)

#cadmium copper lead zinc
#pairs soil valiables 
#how to explain to R that we want to use from colomn number 3 to column 6 (check looking table shown thought head(meuse)
#using [] to select columns and , : 
#in this way we are making use of columns and not rows. 
#remark: column counting start from 1 instead from 0
pairs(meuse[,3:6])

#when it doesn't work refresh R with this code dev.off()

#i can replace number columns using names of columns 
pairs(~ cadmium + copper + lead + zinc, data=meuse) 
# tildle is going to be done by Alt + 126

#let's pretiffy (abbellire) the graph
#colours
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="pink") 

#change symbols
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17) 

#increase size 
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17, cex=3)

#let's analyse if increasing a variable, even other variable is going to increase
#let's analyse their relationship 
