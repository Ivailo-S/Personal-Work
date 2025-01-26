library(ggplot2)

path<- "C:/Users/ivail/Downloads/chip_dataset.csv" #Make sure that this refers to the right place, dummy

dataset<- read.csv(path) #Sets the variable 'dataset' to be assigned to the file in question

print(dataset) # Prints the concurrent dataset, fun.

summary(dataset) #Just a brief overview of the data field printed into the console

data.mean.trim<- mean(dataset$Freq, trim=0.15) #An over the top way to set up the mean

median(dataset$Freq..MHz.) # Median via referring to the 'strength' column of the excel table

hist(dataset$Freq..MHz., main="Histogram Data", xlab="Strength Values", ylab="Frequency") #Histogram of Data

sd(dataset$strength) #Standard Deviation

std<- sd(dataset$strength) #Sets a variable for our standard deviation

boxplot(dataset$strength) #Creates a boxplot for our dataset, what a surprise

Test1<- c(69, 51, 46, 99, 123, 35, 86)
Test2<- c(243,199, 203, 176, 216, 150, 185)

boxplot(Test1, Test2, dataset$Freq..MHz.,  horizontal = TRUE, col = "pink") #Now you have 3 horizontal boxplots, wowee
