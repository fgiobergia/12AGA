; Si scriva un programma in linguaggio
; Assembly 8086 che stampi a video una stringa
; tramite una procedura.
; - Tale procedura riceve come parametro
; l'indirizzo iniziale della stringa (passaggio by
; reference) e la sua lunghezza (by value),
; rispettivamente nei registri AX e BX.

.model small
.stack
.data
    str db  "Test String"
    len dw  11
.code
    .startup
        mov bx, len
        lea ax, str
        
        call print
        
    .exit
    
    print proc
        mov si, 0
        mov di, ax
        mov ah, 2
        
        print_ch:
            mov dl, [di]
            int 21h
            
            inc di
            inc si
            cmp si, bx ; or cmp [di],0 
            jne print_ch
        ret
    print endp
end
