import pandas as pd
d = pd.read_csv("401K.csv")
get_ipython().magic(u'logstart ')
y = d.prate
X = d['mrate']
import statsmodels.api as sm
X = sm.add_constant(X)
r = sm.OLS(y,X)
rf = r.fit()
rf.summary()
b =np.dot(np.linalg.inv(np.dot(X.T,X)),np.dot(X.T,y))
b
