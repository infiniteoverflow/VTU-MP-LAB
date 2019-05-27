
.model small
.stack
.data
    array1 db 30 dup(?)
    array2 db 30 dup(?)
    
    m1 db 10,13,"Enter the string:",10,13,"$"
    m2 db 10,13,"The entered string is a palindrome$"
    m3 db 10,13,"The entered string is not a palindrome$"
    
.code
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea si,array1
    lea di,array2
    
    
    lea dx,m1
    mov ah,09h
    int 21h
    
    mov cx,00     
    
    up1:mov ah,01h
        int 21h
        
        cmp al,13
        jz up2
        
        inc cx
        mov [si],al
        inc si
        jmp up1
        
    up2:dec si
    
    up3:mov al,[si]
        mov [di],al
        
        inc di
        dec si
        
        jnz up3
                  
        lea si,array1
        lea di,array2
        
        cld
        
        repe cmpsb
        
        je palin
        
        
        lea dx,m3
        mov ah,09h
        int 21h
        jmp exit
        
   palin:lea dx,m2
         mov ah,09h
         int 21h
         
    exit:mov ah,4ch
         int 21h
         
         
end