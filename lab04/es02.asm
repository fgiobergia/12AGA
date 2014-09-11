; Si scriva un programma in grado di calcolare il valore di un insieme di
; monete di diverso importo (espresso in centesimi di Euro). Siano dati
; i seguenti vettori:
; > valore, vettore di word indicante il valore di ciascun tipo di moneta
; > monete, vettore di byte indicante il numero di monete di ciascun tipo.
; • Ad esempio, con
; * valore dw 1, 2, 5, 10, 20, 50, 100, 200
; * monete db 100, 23, 17, 0, 79, 48, 170, 211
; si hanno 100 monete da 1 centesimo, 23 monete da 2 centesimi, e
; cosi' via.
; - Il programma deve fornire il risultato aggiornando due variabili
; precedentemente dichiarate, di tipo word, denominate euro e
; cent, e rappresentanti rispettivamente l'importo in euro e in
; centesimi. Nell'esempio, il valore risultante e' pari a 63411 centesimi,
; quindi alla fine del programma le due variabili euro e cent varranno
; rispettivamente 634 e 11.

; si sceglie un approccio meno efficiente dal punto di vista della computazione
; (ossia che controlla di volta in volta se si son raggiunti abbastanza euro)
; invece di sommare tutto e poi verificare alla fine. In questo modo, sara'
; possibile avere un massimo di 65k euro, invece di 655.

.model small
.stack
.data
    valore dw 1, 2, 5, 10, 20, 50, 100, 200
    monete db 100, 23, 17, 0, 79, 48, 170, 211
    euro dw ?
    cent dw ?
.code
    .startup
    
    mov si, 0
    
    mov bx, 0
    mov cx, 0
    
    mov di, 100

    sum:
        xor dx, dx     
        mov ax, valore[si]
        shr si, 1
        mul monete[si]
        shl si, 1
        
        add ax, cx
        
        xor dx, dx
        div di
        
        add bx, ax
        mov cx, dx

        add si, 2
        cmp si, 16
        jl  sum
    
    mov euro, bx
    mov cent, cx
    nop
    .exit
end     
