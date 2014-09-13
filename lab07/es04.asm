; Si scriva un programma che, data una stringa di
; lunghezza nota in memoria, calcoli la frequenza di
; ciascuna lettera e stampi quindi a video un
; istogramma orizzontale delle frequenze rilevate
; (omettendo i caratteri a frequenza nulla).

.model small
.stack
.data
    str  db  "sasso rosso",0
    freq db  26 dup(0)
.code
    .startup                
    
    lea si, str
    
    xor bh, bh
    
    calc:
        
        cmp [si],97
        jl nope
        
        cmp [si],122
        jg nope
        
        mov bl, [si]
        sub bl, 97
        
        inc freq[bx] ; why does this even work?
        ;mov al, freq[bx]
        ;inc al
        ;mov freq[bx],al
        
        nope:
        inc si
        cmp [si],0
        jne calc
    
    mov si, 0
    mov ah, 2
    istogram:
        cmp freq[si],0
        je next
        
        mov dx, si
        add dx, 97
        int 21h
        
        mov dl, 20h
        int 21h
        
        mov cl, 0
        mov dl, '*'
        
        risk:
            int 21h
            inc cl
            cmp cl, freq[si]
            jne risk
        
        mov dl, 0dh
        int 21h    
        mov dl, 0ah
        int 21h
        
        next:
        inc si
        cmp si, 26
        jne istogram
        
    .exit
end
