; Un indirizzo IP e' un numero che identifica univocamente un dispositivo collegato a
; una rete che utilizza Internet Protocol come protocollo di comunicazione. L'Internet
; Protocol version 4 (IPv4) prevede che l'indirizzo sia costituito da 32 bit (4 byte)
; suddivisi in 4 gruppi da 8 bit (1 byte), separati ciascuno da un punto. Ciascuno di
; questi 4 byte e' poi convertito in formato decimale di piu' facile interpretazione. Un
; esempio di indirizzo IPv4 e' 130.192.182.133, che corrisponde a 82C0B685h.
; Si scriva una procedura filtro in grado di elaborare una sequenza di indirizzi
; IPv4 e contare quanti di essi soddisfino la seguente condizione: l'indirizzo deve
; essere confrontato bit a bit con un riferimento dato, ma nel confronto devono
; essere considerati soltanto i bit nelle posizioni che, in una variabile doubleword
; maschera, hanno valore corrispondente a '1'. Se i bit confrontati corrispondono, la
; condizione e' soddisfatta. Viceversa, i bit nelle posizioni corrispondenti a valori '0'
; nella maschera non devono essere considerati per il confronto.
; Esempio:
; Riferimento: 82C0B685h 10000010.11000000.10110110.10000101
; Maschera   : FFFC0000h 11111111.11111100.00000000.00000000
; Indirizzo 1: 82C028D1h 10000010.11000000.00101000.11010001 soddisfa requisiti
; Indirizzo 2: 81C0276Ah 10000001.11000000.00100111.01101010 non soddisfa requisiti

; approccio: ((riferimento xnor addr) and mask) == mask ok!
; (xnor ritorna 1 se i due bit sono uguali, e facendo l'and con mask si verifica che
; tutti i bit dello xnor nei posti della mask sono a 1)

.model small
.stack
.data
    
    address dd  82c028d1h,81c0276ah,82c30f0fh,82c400ffh
    mask    dd  fffc0000h
    
    dim     equ 4
.code
    .startup
        push 0x82c0 ; high
        push 0xb685 ; low
        lea ax, address
        push ax
        lea ax, mask
        push ax
        ; sub sp, 2
        push 0xfafa
        call filtro
        pop ax
        add sp, 8
        nop
        
    .exit
    
    filtro proc
        push bp
        mov bp, sp
        
        mov si, [bp+6] ; mask addr
        mov di, [bp+8] ; ptr list
        mov bx, [bp+10] ; low
        mov ax, [bp+12] ; high
        
        mov cx, 0
        
        check_ip:   
            ; si assume dim<=0xff, in modo
            ; da semplificare molto le cose
            
            ; low
            mov dx, bx
            xor dx, [di]
            not dx
            and dx, [si]
            cmp dx, [si]
            jne nope
            
            ; high
            mov dx, ax
            xor dx, [di+2]
            not dx
            and dx, [si+2]
            cmp dx, [si+2]
            jne nope
            
            inc cl
            
            nope:
            
            inc ch
            add di, 4
            cmp ch, dim
            jne check_ip
            
            xor ch, ch
            mov [bp+4], cx
            
            pop bp
            ret
    filtro endp
end
