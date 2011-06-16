import numpy as np
from numpy import *
import scipy as sp
import matplotlib.pyplot as plt
import matplotlib
from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
rc("font", size=22)
from numpy import fft

t=np.arange(0,1,0.0001)
y=cos(9*2*pi*t)
ind=np.arange(0,len(t),1000)
xx=t[ind]
yy=y[ind]
yy2=cos(2*pi*t)

fig = plt.figure(figsize=(13,5))
fig.subplots_adjust(bottom=0.2)
ax=fig.add_subplot(111)
ax.plot(t,y,'k-',lw=3)
ax.set_xlabel('t [ms]')
ax.set_ylim([-1.1,1.1])
ax.plot(xx,yy,'o',markersize=20,markerfacecolor='red',markeredgecolor='c',alpha=0.7)
ax.plot(t,yy2,'b--',lw=3)
plt.savefig("../pdf_box/aliasing.pdf",transparent=True)
