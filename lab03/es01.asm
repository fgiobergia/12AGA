; Si scriva un programma in linguaggio
; Assembly 8086 che scriva in un vettore
; definito di 20 elementi di tipo word i primi 20
; valori della serie di Fibonacci.

; Mooolto poco efficiente rispetto ad altre mille 
; versioni che si potevano fare; ma usa la ricorsione :D
; Per ottimizzare (e pesantemente) si puo' evitare di
; ricalcolare ogni volta tutta la sequenza di Fibonacci fino
; all'n-esimo valore, ma andando a riprendere i valori 
; gia' calcolati e messi nel vettore. Ma non ne avevo voglia.

.model small
.stack
.data
    v   dw  20  dup(?)

.code
    .startup
    
    mov si, 0              
    label:
        mov ax, si
        shr ax, 1
        call fib  
        mov v[si], cx
        add si, 2
        cmp si, 40
        jne label
    nop

    .exit
    
    fib proc
        cmp ax, 1 
        mov cx, 1      
        jle return
        
        dec ax
        push ax
        call fib
        
        pop bx
        dec bx
        push cx
        mov ax, bx
        call fib
        
        pop ax
        add ax, cx
        mov cx, ax
        
        ret
        
        return:        
            ret
        
    fib endp

end
    
    
