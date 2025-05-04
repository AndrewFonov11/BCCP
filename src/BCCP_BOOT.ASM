; BCCP - Basic Computer Control Program
; Boot Sector
; Released into the public domain under CC0

org 0x7c00
use16

cli
xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0xFFFF
sti

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov ah,0x0e
mov al,'B'
int 10h
mov al,'C'
int 10h
int 10h
mov al,'P'
int 10h

mov ax,0000h
mov es,ax
mov dl,0
mov bx,500h
mov ch,0
mov cl,02h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jmp 0000:0500h

db 'BCCP'

times 510 - ($ - $$) db 0
db 0x55,0xAA