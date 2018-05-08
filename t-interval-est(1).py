import numpy as np 
import math
from scipy.stats import t

i = 0
numsamples = 100000
a = np.empty([numsamples,1])
mu = 0 # mean of population
sigma = 1 # standard deviation of population

n = 100
while n < 105:
    i = 0
    while i < numsamples:
        nums = np.random.normal(mu, sigma, n)
        m = nums.mean() # mean of sample
        s = nums.std() # standard deviation of sample
        x = m + t.ppf(0.025, n-1)*s/math.sqrt(n)
        y = m + t.ppf(0.975, n-1)*s/math.sqrt(n)
        if x <= mu <= y:
            a[i,0] = 0
        else:
            a[i,0] = 1
        i = i + 1
    
    print "n = ", n
    nr = a.sum()
    dr = len(a)

    print "Number of times mu is NOT within 95% CI:" , nr 
    print "Total number of results:", dr
    print "Proportion of times mu is NOT within 95% CI:", nr/dr
    print "\n"
    n = n + 1

