global _main
extern _printf

; If you're familiar with the C language
; then you know the printf function very well.
; It is used to print information to the console.

; its syntax is printf(controlString, arg1, arg2, arg3...);

; Its actually the same, here in assembly.

section .data
    number: dd 154
    controlString: db "The number is: %d", 10, 0 ; This will be used as the control string
    
    x: dd 1920
    y: dd 1080
    controlString2: db "The most common resolution used for PCs is: %d x %d", 10, 0
    
section .text
    _main:
        push ebp
        mov ebp, esp
        
        ; printf(controlString, number);
        push DWORD [number] ; Surrounding "number" with "[]" tells NASM that we're pushing the Value of "number", not the Memory Address.
        push controlString  ; Unlike C, We're theoretically specifying the values before the control string.
        call _printf        ; But unlike C aswell, these values are being pushed directly onto the Stack.
                            ; And in stacks, things that are added later are on top. These instructions would be executed as such:
                            ; _printf -> controlString -> number;
                            
        ; Another Example of a printf instruction.
        ; printf(controlString2, x, y);
        push DWORD [y]      ; y is the final argument, therefore its added first onto the stack
        push DWORD [x]      ; x is the 2nd last argument, therefore its added as the 2nd item.
        push controlString2 ; the controlstring is the first argument, therefore it will be added the last.
        call _printf        ; then we'll call the printf function and it would read the values from the stack.
        
        
        mov esp, ebp
        pop ebp
        ret
    
