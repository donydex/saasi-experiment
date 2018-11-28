import os
import numpy as np

import matplotlib.pyplot as plt
import pandas as pd
import time
from pylab import * #导入pylab

def normfun(x,mu,sigma):
#     正态分布
    pdf = np.exp(-((x - mu)**2)/(2*sigma**2)) / (sigma * np.sqrt(2*np.pi))
    return pdf

def dailyPattern(x):
    # x = linspace(0,23,100)
    # cond = [True if (i>8 and i<16) else False for i in x] #使用列表解析的方法
    y=0.6*normfun(x, 6, 1)*(x<8)+normfun(x, 13, 1)*(x>=8)*(x<=16) + 0.8*normfun(x, 18, 1)*(x>16)
    y = 400 * y + 10
    return int(y)

def weekPattern(x):
    y = 0.7*(x<5)+0.9*(x>=5)
    y1 = sin(2*np.pi*x)
    y = 100 * y
    return int(y+y1)