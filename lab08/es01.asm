; Dati in memoria i seguenti due vettori di 50 word ciascuno:
; PREZZI rappresentante i prezzi di 50 articoli venduti in un negozio
; SCONTATI inizialmente di contenuto indeterminato,
; si scriva una procedura in linguaggio Assembly 8086 in grado di calcolare il prezzo scontato di ciascun
; articolo e salvarlo nel corrispondente elemento del vettore SCONTATI. La procedura deve leggere da una
; variabile intera di tipo word denominata SCONTO l'ammontare dello sconto percentuale da applicare. Si
; esegua un arrotondamento alla cifra superiore se la parte decimale del prezzo risultante e' maggiore o
; uguale a 0,5.
; Inoltre, la procedura deve salvare in una variabile di tipo word TOTSCONTO l'ammontare totale delle
; riduzioni effettuate.    

; questa soluzione ha alcuni limiti a livello di prezzi/sconti accettati (per overflow vari) :( 
; un'altra soluzione piu' ottimale (ma piu' lunga) consiste nello scomporre lo sconto in decine
; e unita' ed trovare il prezzo da scontare come (PREZZO*decine)/10 + (PREZZO*unita')/100; ma
; questo avrebbe richiesto ulteriori controlli sul resto, per poter effettuare l'approssimazione
; della parte decimale.

.model small
.stack
.data
    prezzi    dw 39, 1880, 239, 1000, 1590
    scontati  dw 5   dup(?)
    sconto    dw 30
    totsconto dw ?

.code
    .startup
        call calc
        nop
    
    .exit
    
    calc proc
        mov si, 0  
        mov di, 0

        mov bx, sconto
        mov cx, 100
        
        iter:
            xor dx, dx
            
            mov ax, prezzi[si]
            mul bx
            
            xor dx, dx
            div cx
            
            cmp dx, 50
            jle skip
            
            inc ax
            
            skip:
            mov dx, prezzi[si]
            sub dx, ax
            mov scontati[si], dx
            
            add di, ax
            
            add si, 2
            cmp si, 10 
            jne iter
        
        mov totsconto, di
        ret
    calc endp
end 
