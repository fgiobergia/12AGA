; Si scriva un programma che calcoli la media
; (intera) tra i DIM valori di un vettore di byte, e
; ne salvi il risultato nella variabile risultato

.model small
.stack
.data
    v   db  010h,020h,030h
    res db  ?
    DIM EQU 3
.code
    .startup
        mov di, 0
        mov bx, 0
        label:     
            mov al, v[di]
            cbw
            add bx, ax
            
            inc di
            ;add di, 2
            
            cmp di, DIM
            jl  label
        
        mov ax, bx                  
        mov bl, DIM
        div bl
        
        mov res, al
    .exit
end
