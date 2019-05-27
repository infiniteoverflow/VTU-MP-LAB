

.model small
.stack
.data
    msg db 10,13,"The current date and time is:$"
    
.code
    mov ax,@data
    mov ds,ax
    
    lea dx,msg
    mov ah,09h
    int 21h
    
    mov ah,2ch
    int 21h
    
    mov al,ch
    call disp
    
    mov dl,':'
    mov ah,2
    int 21h
    
    mov al,cl
    call disp
    
    mov dl,' '
    mov ah,2
    int 21h
    
    mov dl,' '
    mov ah,2
    int 21h
    
    mov ah,2ah
    int 21h
    
    
    mov al,dl
    call disp
    
    mov dl,'/'
    mov ah,2
    int 21h
             
    mov ah,2ah
    int 21h
    
    mov al,dh
    call disp
    
    mov dl,'/'
    mov ah,2
    int 21h
    
    mov ah,2ah
    int 21h
    
    add cx,0c30h
    mov al,ch
    call disp
    
    mov al,cl
    call disp 
    
    
    mov ah,4ch
    int 21h   
   
    
    
    disp proc near
        aam
        mov ax,3030h
        mov bx,ax
        
        mov dl,bh
        mov ah,2
        int 21h
        
        mov dl,bl
        mov ah,2
        int 21h
        
        ret 
    disp endp
    
end