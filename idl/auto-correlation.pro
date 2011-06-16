IF !version.os EQ 'darwin' THEN BEGIN
    mdsconnect, 'raserver.igi.cnr.it'
ENDIF 
shot = 20367
uread, shot, t, signal, probe = 'vf_esb21', trange = [30, 90]
lag = findgen(1501)-750.
c = a_correlate(signal, lag)
dt = (max(t)-min(t))/(n_elements(t)-1)
tau = lag*dt*1e3
dd = where(tau GE 0)
xD = tau[dd] & yD = c[dd]
i0 = value_to_index(yD, 1./exp(1))
tc = xD[i0]

eps_box = $
   '~/Documents/RFX/Documenti/KTH-2011/22Giugno2011/Lecture/eps_box/'
fname = eps_box+'Auto-correlation'+strn(fix(shot))+'.eps'
opstr='File '+fname+' aperto '
clstr='File '+fname+' chiuso '
set_plot,'ps'
device,filename=fname,/portrait,/encapsulated,$
       ysize=10,xsize=14,/isolatin1,font_size=14,/color, bits_per_pixel=8
!p.multi = [1]
!p.font = 0
!x.thick = 3
!y.thick = 3
!p.position = [0.15, 0.15, 0.95, 0.95]
plot, tau, c, xtitle = textoidl('\tau [\mus]'), ytitle = $
      'Autocorrelation', charsize = 1.2, thick = 5, xr = [minmax(tau)], $
      xsty = 1
hline, 1/exp(1), lin = 2, thick = 5, col = crea_col('orange')
xyouts, 300, 1/exp(1)+0.01, '1/e', charsize = 1.2, col = $
        crea_col('red'), /data, charthick = 1.5
vline, tc, lin = 3, thick = 5, col = crea_col('cyan')
xyouts, tc+20, 0.8, textoidl('\tau_c = ')+number_formatter(tc, $
   decimals = 1)+textoidl('\mus'), col = crea_col('blue'), charsize = $
        1.2, charthick = 1.5, /data
close_plot


END

