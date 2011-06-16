import numpy as np
from numpy import *
import scipy as sp
import matplotlib.pyplot as plt
import matplotlib
from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
rc("font", size=15)
from numpy import fft
# generate the basis of time
t=np.arange(-10,10,0.0001)
id0=(t>=0).nonzero()
id0=array(id0)
id1=(t<=1).nonzero()
id1=array(id1)
y=zeros(len(t))
y[id0[0,0]:id1[0,-1]]=1

yk=np.fft.fft(y)
f=np.fft.fftshift(np.fft.fftfreq(len(y)))
yk=concatenate((yk[len(f)/2:],yk[:len(f)/2]))

labels=['-3/T','-2/T','-1/T','0','1/T','2/T','3/T']
aa=arange(-0.0003,0.0003,0.0001)

fig = plt.figure(figsize=(10,5.96))


ax=fig.add_subplot(211)
#plt.subplot(211)
ax.plot(t,y,'b-',linewidth=3)
ax.set_ylim([-0.2,1.2])
ax.set_xlim([-0.5,1.5])
lab=['0','T']
plt.xticks([0,1],lab)
plt.yticks([0,1],['0','1'])
ax.set_xlabel('t')
plt.grid(True)

ax=fig.add_subplot(212)
ax.plot(f,abs(yk),'b-',linewidth=3)
ax.set_xlim([-0.0003,0.0003])
plt.xticks(aa,labels)
plt.yticks([0,1e4],[' ',' '])
ax.set_xlabel('f')
ax.grid(True)
plt.savefig("../pdf_box/box-function.pdf")


## ora la hanning window
y=zeros(len(t))
y[id0[0,0]:id1[0,-1]]=0.5*(1-cos(2*pi*t[id0[0,0]:id1[0,-1]]))
yk=np.fft.fft(y)
f=np.fft.fftshift(np.fft.fftfreq(len(y)))
yk=concatenate((yk[len(f)/2:],yk[:len(f)/2]))

labels=['-3/T','-2/T','-1/T','0','1/T','2/T','3/T']
aa=arange(-0.0003,0.0003,0.0001)

fig = plt.figure(figsize=(10,5.96))


ax=fig.add_subplot(211)
#plt.subplot(211)
ax.plot(t,y,'b-',linewidth=3)
ax.set_ylim([-0.2,1.2])
ax.set_xlim([-0.5,1.5])
lab=['0','T']
plt.xticks([0,1],lab)
plt.yticks([0,1],['0','1'])
ax.set_xlabel('t')
plt.grid(True)

ax=fig.add_subplot(212)
ax.plot(f,abs(yk),'b-',linewidth=3)
ax.set_xlim([-0.0003,0.0003])
plt.xticks(aa,labels)
plt.yticks([0,6e3],[' ',' '])
ax.set_xlabel('f')
ax.grid(True)
plt.savefig("../pdf_box/Hanning.pdf")

