; Si scriva un programma che richieda all'utente un
; intero positivo (eventualmente composto da piu'
; cifre, e concluso con ENTER) e lo salvi in una variabile
; di tipo word. "L'inserimento di valori troppo grandi
; deve segnalare un errore."

.model small
.stack
.data
    var dw  ?
.code
    .startup
        
        mov si, 1
        mov ah, 1    
        mov cx, 0
        read:
            int 21h
            cmp al, 30h
            jl done
            
            mov bx, ax
            and bx, 000fh
            
            mov dx, cx
            shl dx, 3
            shl cx, 1
            add cx, dx
            add cx, bx
            
            inc si
            
            ; didn't bother with checking whether the number is <=ffff
            jmp read
                
        done:         
            nop        
    .exit
end
