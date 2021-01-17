sseg SEGMENT para stack 'stack'
db 32 dup (?)
sseg ends

dseg SEGMENT para 'data'
 
dseg ends

cseg SEGMENT para 'code'
T2 proc far
assume CS:cseg,DS:dseg,SS:sseg
	 mov ax,dseg
	 mov DS,ax


	 mov cl.1
     p1:mov ah,01h
        int 21h
 	
	mov dl,al
	mov ah,02h
	int 21h
	
	inc cl
	cmp cl,10
        jne p1

    mov ax,4c00h
    int 21h
T2 endp
cseg ends
end T2