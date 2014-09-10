; Siano date tre variabili di tipo byte in memoria, che
; rappresentino rispettivamente il numero di giorni,
; ore e minuti passati da un certo istante T0. Si calcoli il
; numero totale di minuti passati da T0, e tale valore
; sia salvato nella variabile di tipo word risultato.
; - Per estendere l'intervallo di numeri rappresentabili, si
; richiede di lavorare con una rappresentazione in binario
; puro
; - In caso di overflow della rappresentazione scrivere in
; risultato il valore FFFFh.

.model small
.stack
.data
    days    db  5
    hours   db  5
    mins    db  5
    res     dw  ?
.code
    .startup
        mov al, mins
        cbw
        mov cx, ax
        
        mov al, hours
        cbw
        mov bx, 60
        mul bx
        
        add cx, ax
    
        mov al, days
        mov bx, 5a0h
        cbw
        mul bx
        jo  of    
        
        add cx, ax
        jo  of
        
        mov res, cx
        
        jmp end
    
    of:
        mov res, 0ffffh
        
    end:
        nop
    .exit
end
