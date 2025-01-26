n<- 1000           # Sample size
p<- (250/n)       # Sample proportion, usually the ratio of things that work over the total sample size
q<- (1-p)         # Literally just doing the inverse to the sample proportion
prob<- 0.975      # Confidence Interval percentage, typically on one end (ex. 95% CI gives you 0.975 here)
margin<- qnorm(prob)*sqrt((p*q)/n)  #And all this just does the math necessary, the margin, and the boundaries
margin
lowerint<- (p-margin)
upperint<- (p+margin)
lowerint
upperint
