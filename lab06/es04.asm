; Si scriva un programma in linguaggio
; Assembly 8086 che esegua la media tra gli
; elementi corrispondenti di due vettori definiti
; di tipo word, utilizzando una procedura con
; passaggio di parametri tramite registri.


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
            mov bx, v2[si]
            
            call mean
            
            mov r[si], ax
            
            add si, 2
            
            cmp si, 8
            jne iter
        
        .exit
    
    mean proc
        add ax, bx
        shr ax, 1
        ret
    mean endp
end
