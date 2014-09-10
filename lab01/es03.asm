; Siano date le seguenti variabili di tipo word
; (con segno) già inizializzate in memoria:
; - OPA = -459
; - OPB = 470
; - OPC = -32756
; - OPD = 1
; Si scriva un programma per l'esecuzione
; dell'espressione OPA+OPB-OPC+OPD utilizzando il
; registro AX

.model small
.stack
.data
    OPA dw  -459
    OPB dw  470
    OPC dw  -32765
    OPD dw  1
.code
    .startup
        mov ax, OPA
        add ax, OPB
        sub ax, OPC
        add ax, OPD
    .exit
end
