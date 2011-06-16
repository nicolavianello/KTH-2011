IF !version.os EQ 'darwin' THEN BEGIN
    mdsconnect, 'raserver.igi.cnr.it'
ENDIF 
shot = 20367
uread, shot, t, signal, probe = ['vf_esb21', 'vp_esb22', 'is_esb23', $
   'vf_esb25'], trange = [30, 90]
te = (reform(signal[*, 1])-(reform(signal[*, 0])+reform(signal[*, $
   3]))/2.)/alog(3)
d = where(te LE 0.5, nd) 
IF nd NE 0 THEN te[d] = 0.5
area = !pi*(1.675e-3)^2+!physconst.twopi*1.5e-3*1e-3
js = reform(signal[*, 2])/area
cs = sqrt(!physconst.e*2*te/!physconst.mi)
en = 2*js/cs/!physconst.e/1e19
vp = (reform(signal[*, 0])+reform(signal[*, $
   3]))/2. + 3.23*te

spec2 = spectral2p(t, en, -vp, nslices = 100, /subtract_trend)
pha = sp.phase/!pi
fr = sp.freq
co = sp.coher
eps_box = $
   '~/Documents/RFX/Documenti/KTH-2011/22Giugno2011/Lecture/eps_box/'
fname = eps_box+'PhaseCoherenceEn-Vp'+strn(fix(shot))+'.eps'
opstr='File '+fname+' aperto '
clstr='File '+fname+' chiuso '
set_plot,'ps'
device,filename=fname,/portrait,/encapsulated,$
       ysize=10,xsize=14,/isolatin1,font_size=14,/color, bits_per_pixel=8
       
print,opstr
print,'......'
!p.font=0
!x.thick = 3
!y.thick = 3
!p.multi=[1]
!p.position = [0.2, 0.55, 0.95, 0.95]
plot, spec2.freq, spec2.phase/!pi, xr = [0, 800], yr = [-1, 1], ysty = $
      9, xsty = 5, charsize = 1.2, thick = 2, /nodata, ytitle = $
      textoidl('Phase /\pi (\phi_p-n_e)')
polyfill, [20, 60, 60, 20], [-1, -1, 1, 1], col = crea_col('cyan'), /data
polyfill, [150, 300, 300, 150], [-1, -1, 1, 1], col = $
          crea_col('orange'), /data
oplot, spec2.freq, spec2.phase/!pi, thick = 5, col = crea_col('black')
axis,xaxis=1,xticks=1,xminor=1,xtickname=[' ',' ']
axis,yaxis=1,yticks=1,yminor=1,ytickname=[' ',' ']

!p.multi=[1]
!p.position = [0.2, 0.15, 0.95, 0.55]
plot, spec2.freq, spec2.coher, xr = [0, 800], yr = [0, 1], ysty = $
      9, xsty = 9, charsize = 1.2, thick = 2, /nodata, ytitle = $
      textoidl('Coher (\phi_p-n_e)'), xtitle = 'f [kHz]'
polyfill, [20, 60, 60, 20], [0, 0, 1, 1], col = crea_col('cyan'), /data
polyfill, [150, 300, 300, 150], [0, 0, 1, 1], col = $
          crea_col('orange'), /data
oplot, spec2.freq, spec2.coher, thick = 5, col = crea_col('black')
axis,xaxis=1,xticks=1,xminor=1,xtickname=[' ',' ']
axis,yaxis=1,yticks=1,yminor=1,ytickname=[' ',' ']
close_plot, outputstring = clstr


END

