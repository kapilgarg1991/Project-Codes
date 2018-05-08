import numpy as np 
import math

i = 0
n = 500 #sample size
numsamples = 50000 # number of samples
a = np.empty([numsamples,1])
mu = 7 # mean
sigma = 4 # standard deviation

while n < 105:
    i = 0
    while i < numsamples:
        a[i,0] = np.random.normal(mu, sigma, n).mean()
        i = i + 1
    n = n + 1
    print ("n = " + str(n))
    print ("mean of distribution of sample means = ", a.mean())
    print ("standard deviation of distribution of sample means = ", a.std())
    print ("standard deviation as per formula sqrt(1/n):", str(sigma*np.sqrt(float(1/n))))
    n = n + 1

