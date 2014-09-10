; Siano date le seguenti variabili di tipo word
; (unsigned) gia' inizializzate in memoria:
; - OPA = 32767
; - OPB = 1
; Si scriva un programma per l'esecuzione
; dell'espressione OPA+OPB+OPA+OPB utilizzando il
; registro AX

.model small
.stack
.data
    OPA dw  32767
    OPB dw  1
.code
    .startup
        mov ax, OPA
        add ax, OPB
        add ax, OPA
        add ax, OPB
    .exit
end
