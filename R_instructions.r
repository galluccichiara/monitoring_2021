#set of dataset
(3,5,9,15,40)

#name of the set (arrey of different charachters (c))
primates<-c(3,5,9,15,40)

#make a plot(name of set 1,name of set 2) they're called arguments of plot function
plot(primates,crabs)

#change colours' plot
plot(primates,crabs,col= "red")

#change point form and size, check number on internet about kind point
plot(primates,crabs,col= "red",pch=19)

#character exageration, number of times to exagerate size of points, 2 means doubling
plot(primates,crabs,col="red",pch=19,cex=2)

#title of the graph
plot(primates,crabs,col="red",pch=19,cex=2, main="my first ecological graph in R!"

#create a dataframe (table) arguments are columns (variables), arrey of characters are rows
ecoset<-data.frame(primates,crabs) 

#mean
(3+5+9+15+40)/5

#statistic info for each columns
summary(ecoset)
