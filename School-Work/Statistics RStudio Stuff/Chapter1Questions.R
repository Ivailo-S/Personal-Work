path<- "C:/Users/ivail/Downloads/Ch1-17.csv"
#Q.17:
dataset<- read.csv(path)
summary(dataset$Bad_Spec)
hist(dataset$Bad_Spec, main= "Defective Transducers",xlab = "# Of Defects",ylab= "Frequency of Defects")
#This Histogram produces a positive skew to the graph (i.e. Mean > Median)
#Q.72
PTSD<- c(10, 20, 25, 28, 31, 35, 37, 38, 38, 39, 39, 42, 46)
Healthy<- c(23, 39, 40, 41, 43, 47, 51, 58, 63, 66, 67, 69, 72)
summary(PTSD)
summary(Healthy)
boxplot(PTSD, Healthy,col = "pink", horizontal = TRUE)
#This gives us two boxplots where those suffering from PTSD have significantly reduced receptor bindings,
#heavily skewed negatively to the right while those healthy generally have higher, more varied bindings
#across the spectrum, leaning slightly positively with its mean
