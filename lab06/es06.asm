; Scrivere un programma che calcoli il
; determinante di una matrice 3x3 i cui
; elementi sono interi con segno (word), usando
; una procedura che calcola il determinante di
; una matrice 2x2
; - Sia lecito supporre che non si verifichi mai
; overflow nelle somme e nelle moltiplicazioni.

.model small
.stack
.data
    mat dw  1,0,0,0,1,0,0,0,1
.code
    .startup
        mov cx, mat
        push mat[8]
        push mat[10]
        push mat[14]
        push mat[16]
        call det2
        mul cx
        mov di, ax
        
        mov cx, mat[2]
        neg cx
        push mat[6]
        push mat[10]
        push mat[12]
        push mat[16]
        call det2
        mul cx
        add di, ax
        
        mov cx, mat[4]
        push mat[6]
        push mat[8]
        push mat[12]
        push mat[14]
        call det2
        mul cx
        add di, ax
        
        ; determinante in di
        nop
        
    .exit
    
    det2 proc
        push bp   
        mov bp, sp
        
        xor dx, dx
        mov ax, [bp+10]
        mul [bp+4]
        mov bx, ax ; ad
        
        xor dx, dx
        mov ax, [bp+8]
        mul [bp+6]
        
        sub bx, ax
        mov ax, bx
        
        pop bp
        ret 8
    det2 endp
end
