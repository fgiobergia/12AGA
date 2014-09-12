; Si scriva un programma in linguaggio
; Assembly 8086 che conti il numero di bit a 1
; nella rappresentazione binaria di una variabile
; di tipo byte.

.model small
.stack
.data
    a   db  0xEF
.code
    .startup
    
    mov al, a
    mov di, 0
    
    count:
        mov bl, 1
        and bl, al
        
        add di, bx
        
        shr al, 1
        cmp al, 0
        jne count
    
    nop
    .exit
end
        

