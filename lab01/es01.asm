; Siano date tre variabili di tipo byte
; corrispondenti a tre caratteri alfabetici
; minuscoli (ASCII)
; - Var1 = 'a'
; - Var2 = 's'
; - Var3 = 'm'
; Si scriva un programma che stampi a video i
; tre caratteri convertiti in maiuscolo.

.model small
.stack
.data

    Var1    db 'a'
    Var2    db 's'
    Var3    db 'm'

.code
    .startup        
        mov ah, 2
        
        mov dl, Var1
        int 21h
        
        mov dl, Var2
        int 21h
        
        mov dl, Var3
        int 21h

    .exit
end
