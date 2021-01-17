sseg segment para stack 'stack'
 db 32 dup(?)
sseg ends
dseg segment para  'data'
	strlist LABEL byte
	max db 20
	len db ?
	buffer db 20 dup (0)
	msg1 db "yes",'$'
	msg2 db "no",'$'
	
dseg ends
cseg segment para  'code'
a1 proc far
assume cs:cseg,ds:dseg,ss:sseg
mov ax,dseg
mov ds,ax

	mov ah,0ah
	mov dx,offset strlist
	int 21h	
        
        mov ah,02h
        mov dh,10
        mov dl,0
        mov bh,0
        int 10h

	mov ah,01h
	int 21h
 
        
	lea bx,buffer
	mov cl,1

p2:     cmp al,[bx]
	jne p1
	
        

	mov dx,offset msg1
	mov ah,09h
	int 21h	
	jmp p3

p1:     inc bx
	inc cl
	cmp cl,len
	jne p2

	mov dx,offset msg2
	mov ah,09h
	int 21h

p3:     mov ax,4c00h
	int 21h



a1 endp
cseg ends
end a1