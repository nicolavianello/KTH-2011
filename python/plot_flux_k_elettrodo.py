import matplotlib.pyplot as plt
import numpy as np
from numpy import *
from matplotlib import rc
from matplotlib import rcParams
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Tahoma']
#rcParams['font.family'] = 'monospace'
#rcParams['font.sans-serif'] = ['Computer Modern Typewriter']

#rc('font',**{'family':'sans-serif','sans-serif':['Lucida Grande']})
rc("font", size=22)
#rc('text', usetex=True)
import pylab
from pylab import *
dati=np.loadtxt("dati_elettrodo.txt")
# normal
p=dati[:,0]
dp=dati[:,1]
k=dati[:,2]
dk=dati[:,3]
# elettrodo
p2=dati[:,4]
dp2=dati[:,5]
k2=dati[:,6]
dk2=dati[:,7]
fig = plt.figure(figsize=(10,6))
fig.subplots_adjust(bottom=0.2)
ax=fig.add_subplot(111)
ax.plot(k,p,'ro',k2,p2,'pc',markersize=16,alpha=0.7)
ax.legend(('Normal','Biasing'),'upper right')
ax.set_xlabel(r'k$_{\perp}$')
ax.set_ylabel(r'$\Gamma_{es}[10^{19}$m$^{2}$s$^{-1}]$')
ax.set_xlim([0,80])
ax.set_ylim([-10,75])
ax.errorbar(k,p,xerr=dk,yerr=dp,fmt=None,ecolor='red')
ax.errorbar(k2,p2,xerr=dk2,yerr=dp2,fmt=None,ecolor='cyan')
#plt.show()
plt.savefig("../pdf_box/flux_biasing.pdf",transparent=True)
