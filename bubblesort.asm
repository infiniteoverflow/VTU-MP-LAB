
.model small
.data
    a dw 9867h,1100h,4466h,1241h,2222h
    cnt dw ($-a)/2
    
.code
    mov ax,@data
    mov ds,ax
    
    mov cx,2
    
    outloop:mov dx,cx
            dec dx
            mov si,dx
            add si,si
            
            mov ax,a[si]
            
    inloop: cmp a[si-2],ax
            jbe inexit
            
            mov di,a[si-2]
            mov a[si],di
            
            dec si
            dec si
            dec dx
            
            jnz inloop
            
     inexit:mov a[si],ax
            inc cx
            
            cmp cx,cnt
            jbe outloop
            
            mov ah,4ch
            int 21h
            
end