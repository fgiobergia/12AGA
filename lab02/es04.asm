; Scrivere un programma in Assembly che sommi i
; seguenti numeri rappresentati in un vettore di byte:
; -5, -45, -96, -128
; - La somma deve essere salvata nella variabile
; risultato di tipo doubleword
; - Sommare ancora a risultato il valore di addendo,
; variabile di tipo doubleword con valore 69000

.model small
.stack
.data
    v   db  -5, -45, -96, -128
    r   dd 0
    a   dd 69000
.code
    .startup
    
        mov si, 0
        mov bx, 0
        sum:
            mov al, v[si]
            cbw
            add bx, ax
            
            inc si
            cmp si,4
            jne sum
                          
        mov word ptr r, bx
        mov ax, bx
        cwd
        mov word ptr r+2, dx
        
        mov bx, word ptr r ; stupido, ma il problema chiede di passare per 'risultato' (r)
        add bx, word ptr a
        mov word ptr r, bx
        mov bx, word ptr r+2
        adc bx, word ptr a+2
        mov word ptr r+2, bx
        nop
    .exit
end

