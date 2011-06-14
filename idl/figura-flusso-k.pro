;; programma che crei le seguenti 3 figure
;; Gamma vs f
;; k vs f
;; Gamma vs k

read_array, 'rfx_flux_freq_k.txt', dati, skip = 1
f = reform(dati[0, *])
g = reform(dati[1, *])
dg = reform(dati[2, *])
k = reform(dati[3, *])
dk = reform(dati[4, *])
eps_box = $
   '~/Documents/RFX/Documenti/KTH-2011/22Giugno2011/Lezioni/eps_box/'
!x.thick = 3
!y.thick = 3
eps_box = $
   '~/Documents/RFX/Documenti/KTH-2011/22Giugno2011/Lezioni/eps_box/'
fname = eps_box+'flux_vs_f.eps'
opstr='File '+fname+' aperto '
clstr='File '+fname+' chiuso '
set_plot,'ps'
device,filename=fname,/portrait,/encapsulated,$
       ysize=10,xsize=16,/isolatin1,font_size=16,/color, bits_per_pixel=8
!p.font = 0
!p.multi = [1]
!p.position = [0.18, 0.18, 0.95, 0.95] 

plot, f, g, xr = [0, 500], xsty = 1, $
      xtitle = 'f [kHz]', xcharsize = 1.2, yr = [-20, 80], $
      ytitle = textoidl('\Gamma [10^{19}m^2s^{-1}]'), ycharsize = 1.2
polyfill, [f, reverse(f)], [g-dg, reverse(g+dg)], /data, col = $
          crea_col('cyan')
oplot, f, g, thick =5, col = crea_col('blue')
hline, 0, lin = 2
close_plot

fname = eps_box+'k_vs_f.eps'
opstr='File '+fname+' aperto '
clstr='File '+fname+' chiuso '
set_plot,'ps'
device,filename=fname,/portrait,/encapsulated,$
       ysize=10,xsize=16,/isolatin1,font_size=16,/color, bits_per_pixel=8
!p.font = 0
!p.multi = [1]
!p.position = [0.15, 0.18, 0.95, 0.95] 

plot, f, k, xr = [0, 500], xsty = 1, $
      xtitle = 'f [kHz]', xcharsize = 1.2, yr = [0, 110], $
      ytitle = textoidl('k_{\perp} [m^{-1}]'), ycharsize = 1.2
polyfill, [f, reverse(f)], [k-dk, reverse(k+dk)], /data, col = $
          crea_col('cyan')
oplot, f, k, thick =5, col = crea_col('blue')
close_plot

fname = eps_box+'flux_vs_k.eps'
opstr='File '+fname+' aperto '
clstr='File '+fname+' chiuso '
set_plot,'ps'
device,filename=fname,/portrait,/encapsulated,$
       ysize=10,xsize=16,/isolatin1,font_size=16,/color, bits_per_pixel=8
!p.font = 0
!p.multi = [1]
!p.position = [0.18, 0.18, 0.95, 0.95] 

ploterror, k, g, dk, dg, xr = [0, 80], xsty = 1, $
      ytitle = textoidl('\Gamma [10^{19}m^2s^{-1}]'), xcharsize = 1.2, yr = [-20, 80], $
           xtitle = textoidl('k_{\perp} [m^{-1}]'), ycharsize = 1.2, $
           /nohat, errcolor = crea_col('cyan')
oplot, k, g, psym = symcat(14), symsize = 1.5, col = crea_col('blue')
close_plot
END


