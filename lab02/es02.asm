; Si scriva un programma che stampi a video il valore
; decimale di un intero positivo (0 -> 2^16-1)
; memorizzato in un'opportuna variabile.

.model small
.stack
.data
    num dw  07cdh  
.code
    .startup 
        mov ax, num
        xor di,di
        
        loop:
            xor dx, dx
            mov bx, 10
            div bx
            
            push dx
                 
            inc di
            cmp ax, 0
            jne loop
        
        mov ah, 2
        print:
            pop dx   
            add dl, 030h
            int 21h
            
            dec di
            jnz print
            
        nop
     .exit
end
