; Sia data una matrice quadrata di byte di
; dimensione 8x8 preinizializzata. La matrice
; contiene valori unsigned.
; - Per ogni elemento della matrice si calcoli la somma
; dei 4 elementi limitrofi (nelle posizioni N, E, S, O;
; per gli elementi lungo i bordi si consideri solo il
; sottoinsieme di elementi esistenti ). Quindi, si trovi
; l'elemento per cui tale somma e' massima e ne si
; forniscano le coordinate di riga e colonna.
; - In caso di occorrenze multiple, si operi una scelta
; opportuna.

.model small
.stack
.data
    m   db  0,4,0,0,0,0,0,60,0,5,0,0,11,0,0,0,0,5,7,0,0,10,0,0,0,0,0,9,0,0,49,0,0,0,10,0,0,0,0,0,0,10,3,9,0,0,12,0,0,0,58,0,0,17,0,0,0,1,0,0,3,0,0,0
.code
    .startup
    
    mov di, 0
    mov dx, 0 ; dx -> max
    
    rows:
        mov si, 0
        
        cols:
            mov cx, 0
            
            mov bx, di
            dec bx
            
            cmp bx, 0
            jl  skip_1
            
            shl bx, 3
            add cl, m[bx][si]
            
            skip_1:
            mov bx, di
            inc bx
            
            cmp bx, 8
            je  skip_2
            
            shl bx, 3
            add cl, m[bx][si]
            
            skip_2:
            mov bx, si
            dec bx
            
            shl di, 3
            cmp bx, 0
            jl  skip_3
            
            add cl, m[di][bx]
            
            skip_3:
            add bx, 2
            
            cmp bx, 8
            je skip_4
            
            add cl, m[di][bx]
            
            skip_4:
            
            shr di, 3
            cmp cx, dx
            jbe nope
            mov dx, cx
            pop cx
            pop cx
            push di
            push si
            
            nope:
            
            add si, 1
            
            cmp si, 8
            jne cols
        
        add di, 1
        cmp di, 8
        jne rows
    
    pop cx ; col
    pop bx ; row
           ; dx: sum
    
    .exit

end
