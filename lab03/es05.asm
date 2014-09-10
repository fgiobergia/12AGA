; Un modo per calcolare la radice quadrata approssimata di un
; numero intero consiste nel contare la quantita' di numeri
; dispari che possono essere sottratti dal numero di partenza.
; - Realizzare un programma in Assembly 8086 che calcoli la
; radice quadrata approssimata di un intero positivo (16 bit).

.model small
.stack
.data
.code
    .startup
        mov ax, 169
        mov di, 0
        mov si, 1
        
        cd:
            sub ax, si
            cmp ax, 0
            jl done
            
            inc di
            add si, 2
            jmp cd
        
        done:
            nop
    .exit
end

