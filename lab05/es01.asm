; Scrivere un programma in Assembly 8086 che, dati due
; operandi opa e opb di tipo word in memoria, del valore
; rispettivo di 2043 e 5, esegua un'operazione tra interi
; scelta dall'utente e salvi il risultato nella variabile word
; res
; - A seconda del carattere digitato dall'utente, il
; programma deve eseguire:
; -> 1 : res = a+b
; -> 2 : res = a-b
; -> 3 : res = a*b
; -> 4 : res = a/b (divisione intera).


.model small
.stack
.data
    opa dw  2043
    opb dw  5
    res dw  ?                                                   
.code
    .startup
        mov ah, 1
        int 21h
        
        mov dl, al
        mov ax, opa
        mov bx, opb
        
        cmp dl, 031h
        je  sum
        
        cmp dl, 032h
        je  diff
        
        cmp dl, 033h
        je  prod
        
        cmp dl, 0x34
        je  quo
        
        jmp none
        
        sum:
            add ax, bx
            jmp done
        
        diff:
            sub ax, bx
            jmp done
        
        prod:
            mul bx
            jmp done
        
        quo:     
            xor dx, dx
            div bx
            jmp done
        
        done:
            mov res, ax
        none:
            nop
    .exit
end
    
