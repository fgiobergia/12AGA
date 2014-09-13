; Si scriva una procedura 'converti' in linguaggio Assembly 8086 in grado di rimuovere tutte le occorrenze di
; caratteri ripetuti consecutivamente in una stringa.
; Ad esempio, la stringa 'notte rossa' (dimensione 11) deve essere trasformata nella stringa 'note rosa'
; (dimensione 9).
; La procedura deve ricevere come input tramite stack:
; ? l'indirizzo della stringa origine (tale stringa dovra' essere sovrascritta dalla nuova stringa elaborata)
; ? la dimensione in byte della stringa origine.
; Sempre tramite stack, la procedura deve fornire come output la dimensione della stringa trasformata. Non
; e' ammesso l'uso di altre variabili in memoria.

.model small
.stack
.data
    stringa db  "notte rossa"
    dim     dw  11
    new_dim dw  ?
.code
    .startup
        lea ax, stringa
        push ax
        mov ax, dim
        push ax
        sub sp, 2
        call converti
        pop ax
        mov new_dim, ax
    .exit
    
    converti proc
        push bp
        mov bp, sp
        
        ;mov si, [bp+8] ; scorre
        mov si, 1
        mov bx, 1
        mov di, [bp+8]     ; aggiorna
        
        mov dx, 0 ; offset
        mov cx, [bp+6] ; length
        ;mov dx, 1 ; count
        
        lab:             
            mov al, stringa[si]
            cmp al, stringa[si-1]
            je eq
            
            inc di
            inc bx
            
            eq:       
            mov al, stringa[si]
            mov [di], al
            inc si
            
            cmp si, cx
            jne lab
 
        mov [bp+4], bx
        pop bp
        ret
    converti endp
end
