sseg SEGMENT para stack 'stack'
 db 32 dup (0)
sseg ends

dseg SEGMENT para 'data'

 msg db "Countine?",'$'

 strlist LABEL byte
 max db 20
 len db ?
 Buffer db 20 dup(?)

dseg ends

cseg SEGMENT para 'code'
t1 proc far
 assume CS:cseg,DS:dseg,SS:sseg
 mov ax,dseg
 mov DS,ax
 
    mov ch,5

p1: mov ah,01h
    int 21h
 
    mov dl,al
    mov ah,02h
    int 21h
  
    mov ah,02h
    mov dh,ch
    mov dl,0
    mov bh,0
    int 10h
 
    mov dx,offset msg
    mov ah,09h
    int 21h
 
    mov ah,01h
    int 21h 
 
    add ch,5

    cmp al,'y' 
    je p1
 
    mov ax,4c00h
    int 21h
t1 endp
cseg ends
end t1
