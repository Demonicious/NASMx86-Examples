global _main
extern _scanf, _printf

section .data
    x: dd 1337
    y: dd 1337
    
    xGreaterY: db "x is greater than y", 10, 0
    xLessThanY: db "y is greater than x", 10, 0
    xEqualY: db "x is equal to y", 10, 0
    
section .text
    _main: 
        push ebp
        mov ebp, esp
        
        mov eax, DWORD [x] ; mov(e) the value of x into eax register.
        mov ebx, DWORD [y] ; mov(e) the value of y into ebx register.
        
        cmp eax, ebx       ; Compare the values stored in eax, ebx.
        jg _xIsGreater     ; jump if eax is greater than ebx (x > y)
        jl _yIsGreater     ; jump if eax is less than ebx (x < y)
        je _xAndYareEqual  ; jump if both are equal (x = y)
        
        
        _xIsGreater:   
            push xGreaterY ; If x is greater than y, then push this control string.
            jmp _continue  ; jump to the _continue point
            
        _yIsGreater:
            push xLessThanY ; If y is greater than x, then push this control string.
            jmp _continue   ; jump to the _continue point
            
        _xAndYareEqual:
            push xEqualY    ; If x = y, then push this control string.
                            ; No need for a jmp as its the very next instruction.
            
        _continue:
            call _printf
        
        mov esp, ebp
        pop ebp
        ret