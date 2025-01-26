# Normal Distribution Stuff

x<- seq(-10,10,0.2) # Increments up by 0.2 from - 10 to 10 sequentially

y<-pnorm(x,mean=2.5,sd=2) # Lets you set up the mean, standard deviation, and your sequence 'x'

plot(x,y) #Let's you just graph what you made, which looks kinda nice

# Cumulative Distribution Stuff (AKA To find X, not to find the actual probability)

p<- seq(0,1,0.02) # Increments up by 0.02 starting from 0 to 1

x<-qnorm(p,mean=3,sd=0.05) # Set up the qnorm stuff

plot(p,x) # Plots it

# Normalization Graph

y<- rnorm(500) #Just gets randomized values to the norm

hist(y) #Graphs it as a histogram

# Exponential Distribution

x<-seq(0,10,0.1) # Just a simple sequence generator for the exponential function to follow

y<-pexp(x,rate=0.5) # General exponential function

plot(x,y) #Plots it

y<-pexp(x,rate=0.5, lower.tail = FALSE) # And if you give it a false hediff for the tail, it inverts it the other way

plot(x,y) #Plots it again

# Cumulative Exponential Distribution

p<-seq(0,1,0.05) # Same old

x<-qexp(p,rate = 0.5) # Same old, but with 'q'

plot(p,x) # Same old

# Now if you do your questions in the computer machine (wowee)

y<-pexp(100,rate = 0.01386) #The animal travelling 100km question probability
y

y<-pnorm(50,mean = 46.8,sd = 1.75) #The moped top speed probability
y
