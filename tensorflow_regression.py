import pandas as pd 
import numpy as np 
import statsmodels.api as sm
import tensorflow as tf

housing = pd.read_csv("housing.csv")
X = housing[['housing_median_age','total_rooms','total_bedrooms']]
X = sm.add_constant(X)
X = X.as_matrix()
y = housing['median_house_value']
y = y.as_matrix()
X = tf.Variable(X, dtype=tf.float32, name="X")
y = tf.constant(y.reshape(-1, 1), dtype=tf.float32, name="y")
XT = tf.transpose(X)

theta = tf.matmul(tf.matmul(tf.matrix_inverse(tf.matmul(XT, X)),XT),y)
init = tf.global_variables_initializer()
with tf.Session() as sess:
	init.run()
    theta_value = theta.eval()

theta_value
