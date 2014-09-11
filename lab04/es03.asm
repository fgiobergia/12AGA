; Sia data una matrice quadrata di word
; memorizzata per righe (numero di righe pari a
; DIM, con DIM dichiarato come costante).
; - Si scriva un programma che sia in grado di
; valutare se la matrice quadrata e' simmetrica o
; diagonale. Il programma dovra' stampare a
; video un valore pari a:
; > 2 se la matrice e' diagonale
; > 1 se la matrice e' simmetrica
; > 0 se la matrice non e' simmetrica.

; la soluzione in verita' ritorna 3 per matrici diagonali,
; rende le cose un pelo piu' semplici a livello di bit, ma
; con mezza operazione in piu' si faceva scrivere 2 senza problemi.


.model small
.stack
.data
    m   dw  1,2,3,4,2,1,3,4,3,3,1,4,4,4,4,1
    DIM equ 4
.code
    .startup
    
        mov si, 0
        
        mov cx, 3        
        ;; 0 1 1
        ;      ^
        ;    ^-+-- diagonale
        ;      |__ simmetrica
        
        rows:
            mov bx, si
            add bx, 2
            
            cols:         
                push si
                
                mov ax, DIM
                mul si
                mov si, ax
                
                mov dx, m[si][bx]
                
                pop si        
                push bx
                
                push dx
                                 
                mov ax, DIM
                mul bx
                mov bx, ax
                
                pop dx
                cmp dx, m[bx][si]
                
                je sim

                pop bx
                and cx, 0
                
                jmp end
                
                sim:
                    test dx, m[bx][si]
                    pop bx
                    je end
                    
                    and cx, 1
                
                end:
        
                add bx, 2
                cmp bx, DIM*2
                jne cols
                
            add si, 2
            
            cmp si, DIM*2-2
            jne rows
        
        add cx, 030h
        mov dx, cx
        mov ah, 2
        int 21h
        
            
    .exit
end

