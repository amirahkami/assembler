sseg segment para stack 'stack'
 db 32 dup(?)
sseg ends

dseg segment para 'data'

 strlist LABEL byte
 max db 20
 len db ?
 buffer db 20 dup(?)

dseg ends

cseg segment para 'code'
 t3 proc far
 assume cs:cseg,ds:dseg,ss:sseg
 mov ax,dseg
 mov ds,ax
 	
	mov ah,0ah
	mov dx,offset strlist
  	int 21h

	mov dx,offset buffer
	mov ah,09h
	int 21h
	
 mov ax,4c00h
 int 21h
t3 endp
cseg ends
end t3
