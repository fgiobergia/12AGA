; Si scriva un programma in linguaggio
; Assembly 8086 che esegua la media tra gli
; elementi corrispondenti di due vettori definiti
; di tipo word, utilizzando una procedura con
; passaggio di parametri tramite stack.



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
            push v1[si]
            push v2[si]
            
            call mean
            
            pop ax
            pop bx
            
            mov r[si], ax
            
            add si, 2
            
            cmp si, 8
            jne iter
        
        .exit
    
    mean proc      
        push bp
        mov bp, sp
        mov ax, [bp+4]
        mov bx, [bp+6]
        add ax, bx
        shr ax, 1
        mov [bp+4], ax
        pop bp
        ret
    mean endp
end
