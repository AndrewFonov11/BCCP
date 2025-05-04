; BCCP - Basic Computer Control Program
; Command
; Released into the public domain under CC0

org 500h
use16

key:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h

mov ah,0x0e
mov al,'@'
int 10h

mov ah,10h
int 16h

cmp al,'r'
jz reboot
cmp al,'f'
jz floppy_2
cmp al,'h'
jz hdd_1
cmp al,'w'
jz write
cmp al,'c'
jz copy
cmp al,'t'
jz test_1

jmp key

reboot:

mov ax,0002h
int 10h

int 19h

floppy_2:

mov ax,0000h
mov es,ax
mov dl,1
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc error
jmp 0000:7c00h

hdd_1:

mov ax,0000h
mov es,ax
mov dl,80h
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc error
jmp 0000:7c00h

write:

mov ax,0000h
mov es,ax
mov dl,0
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,02h
mov ah,02h
int 13h
jc error
mov ax,0000h
mov es,ax
mov dl,1
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,02h
mov ah,03h
int 13h
jc error
mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,':'
int 10h
mov al,')'
int 10h
jmp key

copy:

mov ax,0000h
mov es,ax
mov dl,80h
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc error
mov ax,0000h
mov es,ax
mov dl,1
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,03h
int 13h
jc error
mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,':'
int 10h
mov al,')'
int 10h
jmp key

test_1:

mov ax,0000h
mov es,ax
mov dl,1
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc no_1
mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'Y'
int 10h
jmp test_2

test_2:

mov ax,0000h
mov es,ax
mov dl,2
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc no_2
mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'Y'
int 10h
jmp test_3

test_3:

mov ax,0000h
mov es,ax
mov dl,80h
mov bx,7c00h
mov ch,0
mov cl,01h
mov dh,0
mov al,01h
mov ah,02h
int 13h
jc no_3
mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'Y'
int 10h
jmp key

no_1:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'N'
int 10h
jmp test_2

no_2:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'N'
int 10h
jmp test_3

no_3:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'N'
int 10h
jmp key

error:

mov ah,0x0e
mov al,0x0A
int 10h
mov al,0x0D
int 10h
mov al,'E'
int 10h

jmp key

jmp $