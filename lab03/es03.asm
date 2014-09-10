; Si scriva un programma in grado di generare
; una tavola pitagorica (10x10) e memorizzarla.

.model small
.stack
.data
    m  dw  1,2,3,4,5,6,7,8,9,10
    
    ris dw  100 dup(?)
.code
    .startup
        
        mov si, 0
        
        rows:
            mov bx, 0        
            mov cx, m[si]
            mov dx, si
            shl si, 3
            shl dx, 1
            add si, dx
            
            cols:
                mov ax, cx
                mul m[bx]
                mov ris[si][bx], ax
                
                add bx, 2       
                
                cmp bx, 20
                jne cols
                
            mov ax, si
            shr bx, 1
            div bx
            mov si, ax
            
            add si, 2
            cmp si, 20
            jne rows
        nop
    .exit
end
                
