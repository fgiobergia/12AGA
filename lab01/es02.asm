; Siano date le seguenti variabili di tipo byte gia'
; inizializzate in memoria:
; - n1 db 10
; - n2 db 10h
; - n3 db 10b
; Si calcoli la seguente espressione, il cui
; risultato dovra' essere salvato nella variabile
; byte res, e si verifichi il risultato:
; n1 + n2 - n3.

.model small
.stack
.data
    n1  db  10
    n2  db  10h
    n3  db  10b
    res db  ?
.code
    .startup
        mov al, n1
        add al, n2
        add al, n3
        mov res, al
        nop
    .exit
end
