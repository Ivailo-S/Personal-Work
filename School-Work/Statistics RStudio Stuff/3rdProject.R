#Question 1:

x1 <- c(1,2,4,8,16) #General dataset

p1 <- c(0.05,0.10,0.35,0.40,0.10) #Probability Percentages

mu1 <- sum(x1 * p1) #The sum of the two to give you the expected value of 'x'

var1 <- sum((x1 - mu1)^2*p1) #The variance expected from the value of 'x'

std1 <- sqrt(var1) #Just the standard deviation expected from 'x'

print(mu1) #Expected value E(x)

print(var1) #Variance V(x)

print(std1) #Standard Deviation

#Question 2:

x2 <- c(1,2,3,4)

p2 <- c(0.2,0.4,0.3,0.1)

mu2 <- sum(x2 * p2)

var2 <- sum((x2 - mu2)^2*p2)

std2 <- sqrt(var2)

print(mu2) #Expected value E(x)

print(var2) #Variance V(x)

print(std2) #Standard Deviation

plot(x2,p2, type = "h", lwd = 5,  main = "Discrete Probability Distribution Chart", xlab = "x", ylab = "Probability")
abline(v=mu2, col = "red", lwd = 5)
abline(v=var2, col = "pink", lwd = 5)

