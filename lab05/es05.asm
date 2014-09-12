; Si scriva un programma in grado di determinare
; se ciascuno dei numeri naturali (>= 2) contenuti in
; un vettore e' primo oppure no. Si ricorda che un
; numero e' primo quando e' divisibile solamente
; per 1 e per se stesso. Siano dati:
; - un vettore di byte numeri contenente DIM elementi
; (DIM dichiarato come costante)
; - un vettore di byte risultato della stessa
; dimensione che dovra' contenere, per ogni numero
; analizzato, un valore logico 1 se il numero nella stessa
; posizione e' primo e 0 se non lo e'. Tale vettore sarà
; modificato dal programma.


.model small
.stack
.data 
    DIM equ 5
    numeri  db  3,15,17,19,97
    risultato db 5 dup(?)
.code
    .startup
    
    mov di, 0
    
    for:
        mov al, numeri[di]
        call prime
        
        mov risultato[di], al
        
        inc di
        cmp di, DIM
        jne for
    
    nop
    .exit
    
    prime:
        cmp al, 2
        je  isprime

        mov bl, al
        shr bl, 1 ; si puo' rendere piu' efficiente 
                  ; andando fino alla radice quadrata di n
        mov ch, 2
        
        mov cl, al
        
        divide:
            xor ah, ah
            div ch
            
            cmp ah, 0
            je not_prime
            
            mov al, cl
            inc ch
            cmp ch, bl
            jl divide
        
        isprime:
        mov al, 1
        ret
        
        not_prime:
        mov al, 0
        ret
