import numpy as np
from numpy import *
import scipy as sp
import matplotlib.pyplot as plt
import matplotlib
from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
rc("font", size=22)
from matplotlib.collections import PatchCollection
import matplotlib.path as mpath
import matplotlib.patches as mpatches
import matplotlib.lines as mlines

t=np.arange(-2,2,0.001)
y=sin(2*pi*t)
ys=sin(2*pi*t-2.2)

#fig = plt.figure(figsize=(10,6))
fig = plt.figure()
fig.subplots_adjust(bottom=0.2)
ax=fig.add_subplot(111,aspect='equal')
ax.plot(t,y,'b-',t,ys,'g-',lw=3)
ax.set_ylim([-2,2])
plt.xticks([-2,-1,0,1,2])
c1=mpatches.Circle((-0.5,1.5),radius=0.15,fc='blue',alpha=0.6,ec='black',label='1')
c2=mpatches.Circle((0.9,1.5),radius=0.15,fc='green',alpha=0.6,ec='black',label='2')
c11=mpatches.Circle((-0.5,1.1),radius=0.04,fc='blue',ec='black')
c22=mpatches.Circle((0.9,1.1),radius=0.04,fc='green',ec='black')
arr=mpatches.Arrow(-0.262405,-1.1,0.357,0,color='orange',width=0.1)
ax.add_artist(c1)
ax.add_artist(c2)
ax.add_artist(c11)
ax.add_artist(c22)
ax.add_artist(arr)
plt.text(-0.5, 1.45, "1", ha="center",
        family="sans-serif", size=14)
plt.text(0.9, 1.45, "2", ha="center",
        family="sans-serif", size=14)
plt.text(-0.1, -1.7, r"$\Theta_{12}(f) = k(f)d$", ha="center",
        family="sans-serif", size=22,color='orange')
ax.plot((-0.5,-0.5),(1.35,1.14),'b-',lw=2)
ax.plot((0.9,0.9),(1.35,1.14),'g-',lw=2)
plt.savefig("../pdf_box/phase-shift.pdf",transparent=True)
