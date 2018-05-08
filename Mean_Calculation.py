import numpy as np 
import math
from scipy.stats import norm 

i = 0
numsamples = 100000
a = np.empty([numsamples,1])
mu = 0
sigma = 1

n = 100
while n < 105:
    i = 0
    while i < numsamples:
        m = np.random.normal(mu, sigma, n).mean()
        #x = m - 1.96/math.sqrt(n)
        #equivalently
        x = m + norm.ppf(0.025)*sigma/math.sqrt(n)
        #y = m + 1.96/math.sqrt(n)
        #equivalently
        y = m + norm.ppf(0.975)*sigma/math.sqrt(n)        
        if x <= mu <= y:
            a[i,0] = 0
        else:
            a[i,0] = 1
        i = i + 1
	
    print ("n = ", n)
    nr = a.sum()
    dr = len(a)

    print ("Number of times mu is NOT within 95% CI:" , nr )
    print ("Total number of results:", dr)
    print ("Proportion of times mu is NOT within 95% CI:", nr/dr)
    print ("\n")
    n = n + 1

