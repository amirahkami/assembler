sseg segment para stack 'stack'
 db 32 dup(?)
sseg ends

dseg segment para 'data'
dseg ends

cseg segment para 'code'
 t1 proc far
 assume cs:cseg,ds:dseg,ss:sseg
 mov ax,dseg
 mov ds,ax
 
	mov ah,06h
 	mov al,25
 	mov ch,0
 	mov cl,0
 	mov dh,24
 	mov dl,79
	mov bh,14h
	int 10h

	mov ah,01h
	int 21h
	
	mov dl,al
	
	mov ah,02h
	int 21h
 

 mov ax,4c00h
 int 21h
t1 endp
cseg ends
end t1
