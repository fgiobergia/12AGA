; Si scriva un programma in linguaggio
; Assembly 8086 che esegua la media tra gli
; elementi corrispondenti di due vettori definiti
; di tipo word, utilizzando una procedura con
; passaggio di parametri tramite variabili
; globali.
; - La procedura deve calcolare la media tra 2 valori
; alla volta, che sono opportunamente passati dal
; programma chiamante, e restituire il risultato
; analogamente.

.model small
.stack
.data
    v1  dw  1000,2000,3000,4000
    v2  dw  2000,3000,4000,5000
    r   dw  4   dup(?)
    a   dw  ?
    b   dw  ?
    res dw  ?         
.code
    .startup
        mov si, 0
        
        iter:
            mov ax, v1[si]
            mov a, ax
            mov ax, v2[si]
            mov b, ax
            
            call mean
            
            mov bx, word ptr res
            mov r[si], bx
            
            add si, 2
            
            cmp si, 8
            jne iter
        
        .exit
    
    mean proc
        mov ax, a
        add ax, b
        shr ax, 1
        mov res, ax
        ret
    mean endp
end
