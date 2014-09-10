; Dato un vettore di DIM word in memoria,
; rimpiazzarlo con il vettore inverso (senza usare
; un altro vettore di appoggio).
; prima: 423 3191 23 11 -412 3 9
; dopo : 9 3 -412 11 23 3191 423

.model small
.stack
.data
    v   dw  423, 3191, 23, 11, -412, 3, 9
    DIM equ 7

.code
    .startup
        mov si, 0
        mov di, 2*DIM-2
        
        label:          
            mov ax, v[si]
            xchg ax, v[di]
            mov v[si], ax
            
            add  si, 2
            sub  di, 2
            
            cmp si, DIM
            jl label
    .exit
end
