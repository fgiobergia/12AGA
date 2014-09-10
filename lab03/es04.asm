; Sia data la seguente tabella di word:
; 154    123    109    86    4    ?
; 412    -23   -231     9   50    ?
; 123    -24     12    55  -45    ?
;  ?      ?      ?     ?    ?     ?
; - Implementare in Assembly 8086 il programma
; che scriva la somma di ciascuna riga e colonna
; rispettivamente nell’ultima colonna e riga.


; assumendo che il posto in ultima riga e colonna
; vada lasciato vuoto. In caso contrario, basta
; mettere un flag che rimane a 1 per le prime tre
; righe, e che quando e' attivo riempie anche la
; colonna relativa. Questo flag viene portato a 0
; quando si scorre la quarta riga (i.e. dal 48o byte)
; per evitare di sporcare memoria non allocata allo scopo.

.model small
.stack
.data
    v   dw 154,123,109,86,4,?,412,-23,-231,9,50,?,123,-24,12,55,-45,?,0,0,0,0,0,0
.code
    .startup
        mov si, 0
        
        rows:
            mov bx, 0
            mov cx, 0
            
            cols:
                mov dx, v[si][bx]
                add cx, dx
                add v[36][bx], dx
                
                add bx, 2
                cmp bx, 10
                jne cols
            
            mov v[si][bx], cx
            
            add si, 12
            cmp si, 36
            jne rows
        nop
    .exit  
end
