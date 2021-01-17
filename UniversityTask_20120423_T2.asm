sseg segment para stack 'stack'
 db 32 dup(?)
sseg ends

dseg segment para 'data'
 msg db "hello","$"
dseg ends

cseg segment para 'code'
 t2 proc far
 assume cs:cseg,ds:dseg,ss:sseg
 mov ax,dseg
 mov ds,ax
 
	mov ah,02h
 	mov dh,10
 	mov dl,15
 	mov bh,0
 	int 10h

	mov dx,offset msg
	mov ah,09h
	int 21h
	
 mov ax,4c00h
 int 21h
t2 endp
cseg ends
end t2
