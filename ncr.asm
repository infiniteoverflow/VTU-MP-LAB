

.model small
.stack 64
.data
    n db 6
    k db 3
    res db 0
    
.code
    mov ax,@data
    mov ds,ax
    
    mov al,n
    mov bl,k
    
    call nck
    
    mov ah,4ch 
    int 21h
    
    nck proc
        cmp bl,0
        jne l1
        add res,al
        ret
        
        l1: cmp bl,al
            jne l2
            add res,1
            ret
            
        l2: cmp bl,1
            jne l3
            add res,al
            ret
            
        l3: dec al
            cmp al,bl
            jne l4
            inc al
            add res,al
            ret
            
        l4: push ax
            push bx
            call nck
            pop bx
            pop ax
            
            dec bx
            
            push ax
            push bx
            call nck
            pop bx
            pop ax
            ret
            
     nck endp  
   
    
end