;; programma per fare i due esempi di box-like e hanning-window con le
;; relative trasformate di Fourie
t=(findgen(3001)-1000.)/1e3
t = [t, max(t)+1./1e3]
y = fltarr(n_elements(t))
aa = where(t GE 0 AND t LE 1)
y[aa] = 1
