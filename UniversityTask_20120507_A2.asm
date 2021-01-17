sseg segment para stack 'stack'
 db 32 dup(?)
sseg ends
dseg segment para  'data'
	strlist LABEL byte
	max db 20
	len db ?
	buffer db 20 dup (0)
	
dseg ends
cseg segment para  'code'
a2 proc far
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
        
	lea bx,buffer
	mov cl,len
	sub cl,1
	mov ch,0
	add bx,cx
	mov cl,0

p1: 	mov dl,[bx]
	mov ah,02h
	int 21h
	dec bx
	inc cl
	cmp cl,len
	jne p1

        mov ax,4c00h
	int 21h



a2 endp
cseg ends
end a2