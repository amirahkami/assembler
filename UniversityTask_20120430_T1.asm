sseg SEGMENT para stack 'stack'
db 32 dup (?)
sseg ends

dseg SEGMENT para 'data'
 msg1 db "Ahmad",'$'
 msg2 db "Bahman",'$'
 msg3 db "Computer",'$'
 msg4 db "General",'$' 
dseg ends

cseg SEGMENT para 'code'
T1 proc far
assume CS:cseg,DS:dseg,SS:sseg
 mov ax,dseg
 mov DS,ax

 mov ah,01h
 int 21h
 
 cmp al,'a'
 je p1
 
 cmp al,'b'
 je p2

 cmp al,'c'
 je p3
 
 jmp p4

p1: mov dx,offset msg1
    mov ah,09h
    int 21h
    je p5

p2: mov dx,offset msg2
    mov ah,09h
    int 21h
    je p5

p3: mov dx,offset msg3
    mov ah,09h
    int 21h
    je p5

p4: mov dx,offset msg4
    mov ah,09h
    int 21h
    je p5

p5: mov ax,4c00h
    int 21h
T1 endp
cseg ends
end T1