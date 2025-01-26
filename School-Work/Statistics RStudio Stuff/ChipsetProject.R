
install.packages("BSDA")
library(ggplot2)
library(BSDA)

path<- "C:/Users/ivail/Documents/TRU Documents/Statistics RStudio Stuff/chip_dataset.csv" #Make sure that this refers to the right place, dummy

dataset<- read.csv(path) #Sets the variable 'dataset' to be assigned to the file in question

print(dataset) # Prints the concurrent dataset, fun.

summary(dataset) #Just a brief overview of the data field printed into the console

data.mean.trim<- mean(dataset$Freq..MHz., trim=0.15) #An over the top way to set up the mean

median(dataset$Freq..MHz.) # Median via referring to the ‘Freq’ column of the excel table

hist(dataset$Freq..MHz., main="CPU Performance", xlab="Frequency (MHz)", ylab="# of CPUs",col = "pink") #Histogram of Data

sd(dataset$Freq..MHz.) #Standard Deviation

std<- sd(dataset$Freq..MHz.) #Sets a variable for our standard deviation

vari<- (std*std)

vari #Totally legit way to get variance

label=c("Power Usage (Watts)","Processor Size (nm)","Die size (mm squared)") 

boxplot(dataset$TDP..W., dataset$Process.Size..nm., dataset$Die.Size..mm.2., main="CPU Performance", col = "pink", names = label) #Creates a boxplot for our dataset, what a surprise

options(max.print=10000) #Increases the number of lines the console can support

Limit <- sapply(dataset$Freq..MHz., function(x) sum(x >= 1000)) # A certain number of CPUs that surpass a certain frequency threshold

m = sum(Limit) #Summarizes whatever on earth the above gives out to a singular integer that I can use
m

#Now I can do confidence interval stuff!

n<- 4854           # Sample size

p<- (m/n)       # Sample proportion, usually the ratio of things that work over the total sample size

q<- (1-p)         # Literally just doing the inverse to the sample proportion

prob<- 0.95      # Confidence Interval percentage, typically on one end (ex. 90% CI gives you 0.95 here)

margin<- qnorm(prob)*sqrt((p*q)/n)  #And all this just does the math necessary, the margin, and the boundaries

margin # Prints margin

lowerint<- (p-margin) # Gives the lower limit

upperint<- (p+margin) # And upper limit

lowerint #You get the idea by now with these two

upperint

z.test(dataset$Freq..MHz., mu = data.mean.trim, sigma.x= std, conf.level = 0.99) # One sample Z-test with a 99% conf. interval

linregress <-ggplot(dataset, aes(y=dataset$Freq..MHz., x=dataset$Release.Date)) + geom_point() # A funky way to set up a linear regression chart

linregress # Prints out the chart

linregress <- linregress + geom_smooth(method = "lm", col = "black") # Now we insert a trendline with the mess of data we have

linregress # Again print

linregress <-ggplot(dataset, aes(y=dataset$Process.Size..nm., x=dataset$Release.Date)) + geom_point() # A funky way to set up a linear regression chart

linregress # Prints out the chart

linregress <- linregress + geom_smooth(method = "lm", col = "black") # Now we insert a trendline with the mess of data we have

linregress # Again print

cor(dataset$Freq..MHz.,dataset$Release.Date) # Some basic correlation mishaps

cor(dataset$Process.Size..nm.,dataset$Release.Date)

summary(model) #Just here for arbitrary reasons


