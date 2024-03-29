; Si scriva un programma in linguaggio
; Assembly 8086 per la conversione di una
; parola di caratteri minuscoli in caratteri
; maiuscoli, attraverso un'opportuna procedura.
; - Si passi alla procedura il codice ASCII di un
; carattere alla volta come parametro by value
; utilizzando il registro AX; lo stesso registro
; deve contenere il carattere convertito.

.model small
.stack
.data
    str db  "lowercaseword"
.code
    .startup
        lea si, str
        mov ah, 2
        
        lab:
            mov dl, [si] ; si usa dl invece di ax come richiesto; cambia poco
            call toupper                                                          
            int 21h
            
            inc si
            cmp [si], 0
            jne lab

        nop
    .exit
    
    toupper proc
        sub dl, 32 ; eventuali controlli sull'effettiva 'lowercasicita''
        ret
    toupper endp
end

