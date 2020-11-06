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
