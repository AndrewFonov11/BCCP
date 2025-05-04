; BCCP - Basic Computer Control Program
; Build
; Released into the public domain under CC0

format binary as 'img'
macro align value { db value-1 - ($ + value-1) mod (value) dup 0 }
HEADS = 1
SPT = 2
Begin:
        file "BCCP_BOOT.bin",512
        file "BCCP_COM.bin"
        align 512