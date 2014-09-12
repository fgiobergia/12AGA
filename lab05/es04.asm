; Si scriva un programma in linguaggio
; Assembly 8086 che esegua una operazione di
; AND logico tra gli elementi di due vettori di
; byte e ne memorizzi il risultato in un terzo
; vettore. Il programma deve inoltre contare gli
; elementi a parita' pari nel vettore risultante,
; cioe' tali per cui il numero di 1 nella
; rappresentazione binaria del numero e' pari.

.model small
.stack
.data
    a   db  0x1A,0x2A,0x3B,0x4C,0x5E,0x4F,0x7F,0xF7
    b   db  0x9B,0x2d,0x3a,0x22,0x44,0xff,0x2b,0xae
    ris db  8 dup (?)
.code
    .startup
        mov si, 0   
        mov bx, 0
        
        count:
            mov al, a[si]
            and al, b[si]
            jnp no_parity
            
            inc bx
            
            no_parity:
            mov ris[si], al
            
            inc si
            cmp si, 8
            jne count
        
        nop
    .exit
end
