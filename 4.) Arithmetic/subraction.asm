global _main
extern _printf

section .data
    control_string: db "The Result of Addition is: %d", 10, 0

    number1: dd 250
    number2: dd 150
    
section .bss
    result: resb 4
section .text
    _main:
        push ebp
        mov ebp, esp
    
        mov eax, [number1] ; mov(e) the value of number1 into eax
        sub eax, [number2] ; subtract the value of [number2] into the value stored in eax
        
        mov [result], eax  ; store the value of eax in a memory space called result
        
        push DWORD [result] ; our result
        push control_string
        call _printf
        
        mov esp, ebp
        pop ebp
        ret
        