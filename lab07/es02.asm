; Scrivere un programma che stampi su video una
; stringa per la richiesta di introduzione di un numero
; intero, legga il numero e stampi su video un
; messaggio che specifichi se il numero che e' stato
; introdotto e' pari o dispari
; - Si verifichi la corretta digitazione da parte dell'utente
; e si segnalino eventuali errori (es., introduzione di
; caratteri alfabetici)

.model small
.stack
.data                                
    enter   db  "Inserisci un numero: ",0
    error   db  0xa,"Non hai inserito un numero!",0
    oddm    db  0xa,"Numero DISPARI!",0
    evenm   db  0xa,"Numero PARI!",0
.code
    .startup      
        lea ax, enter
        call print
        
        mov ah, 1
        read:    
            int 21h
            
            cmp al, 0x0d
            je done
            
            cmp al, 0x30
            jl errorl  
            
            cmp al, 0x39
            jg errorl
            
            mov bl, al ; bl contiene l'ultimo letto
            jmp read
        
        done:
            and bl, 1
            jz even
            
            lea ax, oddm
            jmp final
            
        even:
            lea ax, evenm
            jmp final
        
        errorl:
            lea ax, error
        
        final:
            call print
                    
    .exit
    
    print proc
        mov si, ax
        mov ah, 2
        
        printch:
            mov dl, [si]
            int 21h
            
            inc si
            cmp [si], 0
            jne printch
        
        ret
    print endp
end
