import idlsave
import matplotlib
from matplotlib import *
import numpy as np
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from matplotlib.patches import Ellipse
from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
#rc("font", family="serif")
rc("font", size=22)
## first import the data
s = idlsave.read("dati_plot_python_3d.sav")

X3D = s.X
Y3D = s.Y
Z3D = s.Z
xEigenv = s.xEigenv
yEigenv = s.yEigenv
zEigenv = s.zEigenv
pUp=s.pointsUp
pLe=s.pointsLeft
pRi=s.pointsRight
bEq=s.bEqRuotated

## define the 3 plot panels
## 3D
fig = plt.figure(figsize=(10,8))
#subplots_adjust(top=1, bottom=-0.2, left=-0.3, right=1.3)
ax = fig.add_subplot(111, projection='3d',azim=-133,elev=14)
ax.dist=6
l = ax.plot3D(X3D,Y3D,Z3D,lw=3,color='red')
ax.set_axis_off()
ax.set_xlim3d(-10,10)
ax.set_ylim3d(-10,10)
ax.set_zlim3d(-10,10)
ax.text(-2,-7,-11,'b$_r$ [mT]','x')
ax.text(-5,-1,-11,'b$_p$ [mT]','y')
ax.set_zlabel(r'b$_t$ [mT]')
ax.plot([bEq[0],-bEq[0]],[bEq[1],-bEq[1]],[bEq[2],-bEq[2]],'b--',lw=3)
ax.plot([pLe[0],-pLe[0]],[pLe[1],-pLe[1]],[pLe[2],-pLe[2]],color='black',lw=3)
ax.axis("off")
plt.savefig("../pdf_box/hodogram-asdex.pdf",bbox_inches='tight')
