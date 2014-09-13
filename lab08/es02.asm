; Si abbia un vettore contenente alcuni interi rappresentanti anni passati. Si scriva una procedura
; in linguaggio Assembly 8086 che sia in grado di determinare se tali anni sono bisestili. Si ricorda che un
; anno e' bisestile se il suo numero e' divisibile per 4, con l'eccezione che gli anni secolari (quelli divisibili per
; 100) sono bisestili solo se divisibili anche per 400.
; La procedura deve ricevere come input:
; - tramite il registro SI, l'offset di un vettore di word contenente gli anni da valutare
; - tramite il registro DI, l'offset di un vettore di byte della stessa lunghezza, che dovra' contenere, al
; termine dell'esecuzione della procedura, nelle posizioni corrispondenti agli anni espressi nell'altro
; vettore, il valore 1 se l'anno e' bisestile oppure 0 nel caso opposto
; - tramite il resgistro BX, la lunghezza di tali vettori.

.model small
.stack
.data
    years dw 1945, 2008, 1800, 2006, 1748, 1600
    res   db 6 dup(?)
.code
    .startup
        lea si, years
        lea di, res
        mov bx, 6
        
        call bis
    .exit
    
    bis proc
        dec bx
        
        lab:                  
            shl bx, 1
            
            xor dx, dx
            mov cx, 100
            mov ax, years[bx]
            div cx
            cmp dx, 0
            jne no_100
            
            shl cx, 2
            mov ax, years[bx]
            div cx
            cmp dx, 0
            je  ybis
            jmp nobis
            
            no_100:   
                xor dx, dx
                mov cx, 4
                mov ax, years[bx]
                div cx
                cmp dx, 0
                jne nobis
           
            ybis:
                shr bx, 1
                mov res[bx], 1
                jmp skip
            nobis:       
                shr bx, 1
                mov res[bx], 0
            
            skip:
            dec bx
            cmp bx, 0
            jge lab 
        ret
    bis endp
end

