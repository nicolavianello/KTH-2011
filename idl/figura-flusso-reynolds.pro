;; programma per fare in funzione di f e di k il flusso e il tensore
;; di Reynolds

eps_box = '../eps_box/'
filesave  = 'rstress_frequenza_modi.sav'
restore,filesave
r = struttura_rstress_magnetiche.r & nr = n_elements(r)
freq         = struttura_rstress_magnetiche.freq & nf = n_elements(freq)
Rstress      = struttura_rstress_magnetiche.Rstress
ErrRstress   = struttura_rstress_magnetiche.ErrRstress
RstressEl    = struttura_rstress_magnetiche.RstressEl
ErrRstressEl = struttura_rstress_magnetiche.ErrRstressEl
RstressMa    = struttura_rstress_magnetiche.RstressMa
ErrRstressMa = struttura_rstress_magnetiche.ErrRstressMa

restore,'flusso.sav'
rflusso = struct.r & freqflux = struct.freq & NfFlux = n_elements(freqflusso)
Flux = struct.flusso & ErrFlux = struct.ErrFlusso/2.

i = where(r eq 180.5) & i = i[0]
iflux = where(rflusso eq 179) & iflux = iflux[0]


rs = reform(rStressEl[i, *]) & errRs = reform(ErrRstressEl[i, *])
g = spline(freqFlux, reform(Flux[iFlux, *]), freq) & dg = reform(ErrFlux[iFlux, *])


restore, 'kRadTor.sav'
kt = spline(reform(struttura_kappa.freq), $
   reform(struttura_kappa.ktor[i, *]), freq)  & errK = $
   reform(struttura_kappa.err_ktor[i, *])/2.

fname = eps_box+'ErsFlux.eps'
set_plot,'ps'
device,filename=fname,/portrait,/encapsulated,$
xsize=15,ysize=10,/isolatin1,font_size=16, /color, bits_per_pixel = 8
print,'......'
!p.font=0
!p.multi=[1]
!p.position=[0.11,0.2,.95,.95]
variables = abs(rs)/max(abs(rs)) 
ErrVariables = reform(errRs/max(abs(Rs)))/1.2

variables2 = (g/max(g)) 
ErrVariables2 = (dg/max(g))

plot,freq,variables,line=2,thick=5,xr=[minmax(freq)],xsty=1,xtitle='f [kHz]', $
     yr=[-0.2,max([variables+ErrVariables,variables2+ErrVariables2])+rms(variables)/5.],ysty=1, $
     /nodata,xcharsize=1.2,ycharsize=1.2
hline,0,lin=4
polyfill,[freq,reverse(freq)],[variables-ErrVariables,reverse(Variables+ErrVariables)], $
         color=crea_col('cyan')
polyfill,[freq,reverse(freq)],[variables2-ErrVariables2,reverse(Variables2+ErrVariables2)], $
         color=crea_col('orange')
oplot,freq,variables,lin=0,thick=5, col = crea_col('blue')

oplot,freq,variables2,lin=0,thick=5, col = crea_col('red')

legend,[textoidl('\langle v_r v')+'!D!M'+string(byte(94))+'!X!N'+textoidl('\rangle'),textoidl('\langle ' + $
   'nv_r\rangle')],textcolors=[crea_col('blue'), $
      crea_col('red')], /right, /top, charsize = 1.1, box = 0, /normal
close_plot


;; adesso facciam le cose con il k 
sk = sort(kt)
fname = eps_box+'ErsFlux_vsk.eps'
set_plot,'ps'
device,filename=fname,/portrait,/encapsulated,$
xsize=15,ysize=10,/isolatin1,font_size=16, /color, bits_per_pixel = 8
print,'......'
!p.font=0
!p.multi=[1]
!p.position=[0.11,0.2,.95,.95]
plot, kt[sk], abs(rs[sk])/(max(abs(rs))), psym = symcat(13), xr = [0, $
   35], yr = [-0.1, 1.2], xtitle = textoidl('k')+'!D!M'+string(byte(94))+'!X!N'+textoidl('[m^{-1}]'), $
      charsize = 1.2, /nodata, ysty = 1, xsty = 1
oplot, kt[sk], abs(rs[sk])/(max(abs(rs))), psym = symcat(13), col = $
       crea_col('blue'), symsize = 1.5
oploterror, kt[sk], abs(rs[sk])/(max(abs(rs))), errk[sk], $
            errRs[sk]/max(abs(rs)), /nohat, errcolor = $
            crea_col('cyan'), lin = 3, col = crea_col('cyan')

x = kt[sk] & y = g[sk]/max(g)
dx = errk[sk] & dy = dg[sk]/max(g)
ii = [indgen(12), 14, 15, 19]
x = x[ii] & y = y[ii] & dx = dx[ii] & dy = dy[ii]

oplot,x, y, psym = symcat(11), col = crea_col('red'), symsize = 2
oploterror, x, y, dx, dy, errcolor = $
            crea_col('orange'), /nohat, lin = 3, col = crea_col('orange')

legend,[textoidl('\langle v_r v')+'!D!M'+string(byte(94))+'!X!N'+textoidl('\rangle'),textoidl('\langle ' + $
   'nv_r\rangle')],textcolors=[crea_col('blue'), $
      crea_col('red')], /right, /top, charsize = 1.1, box = 0, /normal
close_plot



END

