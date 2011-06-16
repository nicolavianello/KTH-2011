import numpy as np
from numpy import *
import scipy as sp
import matplotlib.pyplot as plt
import matplotlib
from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
rc("font", size=22)
#rc('text', usetex=True)
from scipy import signal

t=np.arange(-10,10,0.001)
w=sp.signal.morlet(len(t),w=6,s=1,complete=True)


fig = plt.figure(figsize=(11,6))
fig.subplots_adjust(bottom=0.2)
ax=fig.add_subplot(111)
ax.plot(t,w.real,'k-',t,w.imag,'b--',lw=3)
ax.legend(('Re', 'Im'),
           'upper right', shadow=True)
ax.set_xlabel('t')
ax.set_ylim([-1.,1.])
ax.set_xlim([-8.,8.])
ax.set_title("Morlet wavelet")
plt.savefig("../pdf_box/morlet.pdf")

