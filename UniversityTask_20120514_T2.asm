sseg SEGMENT para stack 'stack'
 db 32 dup (0)
sseg ends

dseg SEGMENT para 'data'

 msg db "Countine?",'$'

 strlist LABEL byte
 max db 20
 len db ?
 Buffer db 20 dup(?),'$'

dseg ends

cseg SEGMENT para 'code'
t1 proc far
 assume CS:cseg,DS:dseg,SS:sseg
 mov ax,dseg
 mov DS,ax
 
    
    
p1: mov ch,0

    mov ah,02
    mov dh,ch
    mov dl,0
    mov bh,0
    int 10h

    mov ah,06h
    mov al,25
    mov ch,0
    mov cl,0
    mov dh,24
    mov dl,79
    mov bh,14h
    int 10h

    
    mov ah,0ah
    mov dx,offset strlist
    int 21h
 
    inc ch
 
    mov ah,02
    mov dh,ch
    mov dl,0
    mov bh,0
    int 10h

    mov dx,offset Buffer
    mov ah,09h
    int 21h
    
    inc ch   

    mov ah,02
    mov dh,ch
    mov dl,0
    mov bh,0
    int 10h
  
 
    mov dx,offset msg
    mov ah,09h
    int 21h
 
    mov ah,01h
    int 21h 
 

    cmp al,'y' 
    je p1
 
    mov ax,4c00h
    int 21h
t1 endp
cseg ends
end t1
