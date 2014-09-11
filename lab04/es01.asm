; Si scriva un programma in linguaggio
; Assembly 8086 che dica se un'equazione di
; secondo grado nella forma ax2+bx+c=0 ha o
; meno soluzioni reali. I coefficienti a, b e c
; siano variabili di tipo word.

.model small
.stack
.data
    a   dw  1
    b   dw  3
    c   dw  2
    x1  dw  ?
    x2  dw  ?
.code
    .startup      
        xor dx, dx
        
        mov ax, b 
        mul ax   
        
        mov bx, ax
        
        mov cx, a
        mov ax, cx
        mul c
        shl ax, 2
        
        sub bx, ax
        
        cmp bx, 0
        jl  fail
        
        call sqrt 
        
        mov bx, b
        neg bx
        
        shl cx, 1
        xor dx, dx
        
        mov ax, bx
        add ax, di
        div cx
        mov x1, ax

        
        xor dx, dx                  
        
        mov ax, bx
        sub ax, di
        div cx
        mov x2, ax
        
        fail:
        nop
        
    .exit
    
    sqrt proc
        mov di, 0
        mov si, 1
        
        cd:
            sub bx, si
            cmp bx, 0
            jl done
            
            inc di
            add si, 2
            jmp cd
        
        done:
            ret
    sqrt endp
end

