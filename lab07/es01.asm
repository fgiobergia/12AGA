; Nel calcolo combinatorio si definisce combinazione semplice (senza
; ripetizioni) una presentazione di elementi di un insieme nella quale
; non ha importanza l'ordine dei componenti e non si puo' ripetere lo
; stesso elemento piu' volte. Dati n elementi distinti e un numero
; intero positivo k = n, il numero di combinazioni semplici possibili
;
; C(n, k) e' dato dalla seguente formula (n*(n-1)*(n-2)*...*(n-k+1))/k!
;
; - Si scriva una procedura COMBINA in grado di calcolare il numero di
; combinazioni semplici dati i parametri n e k ricevuti come variabili
; globali di tipo byte. Il risultato dovra' essere restituito attraverso la
; variabile globale di tipo word risultato.
; - Sia lecito supporre che durante le operazioni intermedie non si
; presenti overflow.

.model small
.stack
.data
    n   dw  ? ; messe n e k a word invece di byte per evitare un paio di cbw e passaggi per ax
    k   dw  ?
    res dw  ?
.code
    .startup
    mov n, word ptr 12
    mov k, word ptr 2
    call combina
    
    nop
    
    .exit
    
    fact proc
        ; from: si
        ; to  : di
        ;mov si, 1
        ;mov di, ax
        mov ax, 1
        
        prod:
            mul si
            inc si
            cmp si,di
            jle prod
        ret
    fact endp
    
    combina proc 
        xor dx, dx
        
        mov si, 1
        mov di, k
        call fact
        mov cx, ax
        
        mov si, n
        sub si, k
        inc si
        mov di, n
        call fact
        
        div cx
        
        ret
    combina endp
end
