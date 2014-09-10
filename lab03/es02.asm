; Si scriva un programma in Assembly 8086 che,
; presi due vettori di 4 word ciascuno come
; matrici riga e colonna, ne calcoli il prodotto.

.model small
.stack
.data
    m1  dw  1, 2, 3, 4 ; riga
                       
    m2  dw  5, 6, 7, 8 ; colonna
    
    ris dw  16 dup(?)
.code
    .startup
        
        mov si, 0
        
        rows:
            mov bx, 0
            
            cols:
                mov ax, m1[si]
                mul m2[bx]
                shl si, 2
                mov ris[si][bx], ax
                shr si, 2
                
                add bx, 2       
                
                cmp bx, 8
                jne cols
                
            add si, 2
            cmp si, 8
            jne rows
        nop
    .exit
end

