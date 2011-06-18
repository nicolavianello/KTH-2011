import matplotlib
import numpy as np
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt
import pylab as P
from pylab import *
import idlsave
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
s = idlsave.read("/Users/nicola/LN/linuxHome/idl/torpex/torpex_current.sav")
j = -s.jim
r = s.rplot
z = s.zplot

fig=plt.figure()

fig.subplots_adjust(bottom=0.1)
ax = fig.add_subplot(111)
ax.set_xlabel(r'r [cm]',fontsize=16)
ax.set_ylabel(r'z [cm]',fontsize=16)
cax = ax.imshow(j, interpolation='bilinear', origin = 'lower', extent = (min(r),max(r),min(z),max(z)),cmap=cm.PuOr,aspect=0.7)
CBI = fig.colorbar(cax, orientation='vertical',ticks=[-2.1,2.1])
CBI.ax.set_yticklabels(['-6','2'])
CBI.set_label(r'$J_{\parallel}$ [A/m$^2$]')
levels = np.arange(-3,3,.5)
CS = ax.contour(j, levels, origin='lower',linewidths=2,extent=(min(r),max(r),min(z),max(z)))
#plt.plot(5.5,2,'go',markersize=20)
plt.savefig("/Users/nicola/Documents/RFX/Documenti/KTH-2011/22Giugno2011/Lecture/pdf_box/torpex_current.pdf")
