
.model small
.data
    array dw 1111h,2222h,3333h,4444h,5555h
    len dw ($-array)/2
    srch equ 5550h
    
    sucmsg db 'Element found at position:'
    result db ?,'$'
    
    failmsg db 'Element not found$'
    
.code
    mov ax,@data
    mov ds,ax
    
    mov bx,1
    mov dx,len
    mov cx,srch
    
    again:  cmp bx,dx
            ja failure
            
            mov ax,bx
            add ax,dx
            shr ax,1
            
            mov si,ax
            dec si
            add si,si
            
            cmp cx,array[si]
            jae bigger
            
            dec ax
            mov dx,ax
            jmp again
            
    bigger: je success
            
            inc ax
            mov bx,ax
            jmp again
            
    success:add al,'0'
            mov result,al
            
            lea dx,sucmsg
            jmp display
            
    failure:lea dx,failmsg
    
    display:mov ah,9
            int 21h
            
            mov ah,4ch
            int 21h
            
end