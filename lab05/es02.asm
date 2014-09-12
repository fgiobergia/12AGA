; Scrivere un programma che acquisisca due
; variabili di tipo byte opA e opB in formato
; binario da tastiera (sequenza di '0' e '1') e
; scriva il risultato di una operazione logica
; bitwise in una variabile di tipo byte ris.
; L'espressione logica bit-a-bit in questione e'
; - C = NOT(A AND (NOT(B))) OR (A XOR B)
; (a(b)*)*+(a^b)

.model small
.stack
.data
    opA db  0
    opB db  0
.code
    .startup
    
    mov di, 0
    mov ah, 1 
    xor bx, bx    
    
    read:       
        shl bx, 1
        
        int 21h
        
        and al, 1
        or bl, al
        
        inc di
        cmp di, 16
        jne read
    
    mov opA, bh ; giusto perche' viene richiesto
    mov opB, bl ; di passare per opA opB
    
    ; a -> ah,al; b -> bh,bl
    mov ah, bh
    mov al, ah
    mov bh, bl              
    
    not bh
    and ah, bh
    not ah
    
    xor al, bl
    
    or ah, al
    
    nop
    .exit
end
