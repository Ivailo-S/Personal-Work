dpois(3,5) #Standard Poisson Calculation

ppois(3,5) #Cumulative Poisson Calculation

dbinom(2,3,0.5) #Standard Binomial Probability

pbinom(2,3,0.5) #Cumulative Binomial Probability

#First Assignment: Binomial Probabilities

dbinom(x,n,p) #Just general formatting

dbinom(3,8,0.35) #a)

dbinom(5,8,0.60) #b)
 
dbinom(3,7,0.60) + dbinom(4,7,0.60) + dbinom(5,7,0.60) #c)

1 - dbinom(0,9,0.1) #d)

#Question 48:

dbinom(0,25,0.05) + dbinom(1,25,0.05) + dbinom(2,25,0.05) #a), you can also write this as pbinom(2,25,0.05)

1 - dbinom(0,25,0.05) - dbinom(1,25,0.05) - dbinom(2,25,0.05) - dbinom(3,25,0.05) - dbinom(4,25,0.05) #b)

dbinom(1,25,0.05) + dbinom(2,25,0.05) + dbinom(3,25,0.05) + dbinom(4,25,0.05) #c)

dbinom(0,25,0.05) #d)

(25*0.05) #e), the expected value is just how many times it takes for the percentage to be guarunteed

sqrt(25 * 0.05 * 0.95) #And this is for the standard deviation

#Now the Poisson Distribution:

#1. 3.	A bookstore sells an average of 10 books per hour. 
#What is the probability that it sells more than 15 books in a given hour?

1 - ppois(15,10) #In the most basic sense

#2.	A call center receives an average of 3 calls every 10 minutes. 
#What is the probability that the call center will receive exactly 6 calls in the next 20 minutes?

dpois(3,3) #Since the avg. times are different from each other

#3. 5.	On average, 12 customers enter a shop every hour. 
#What is the probability that exactly 8 customers will enter the shop in a 30-minute period?

dpois(8,6) #Same goes for this

#4 7.	It has been reported in LA Time that 1 in 200 people (so 5 in a 1000) carry the defective gene that causes 
#inherited colon cancer. In a sample of 1000 individuals. Use Poisson distribution to find the 
#probability of at least 8 carry the gene.

1 - ppois(7,5)
