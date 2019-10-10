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
    
        mov eax, [number1] ; mov(e) the first operand into eax.
        mov ecx, [number2] ; mov(e) the second operand into ecx.
        
        mul ecx            ; The result of eax * ecx will be stored in eax
        
        mov [result], eax  ; Storing the result in "result"
        
        push DWORD [result] ; our result
        push control_string
        call _printf
        
        mov esp, ebp
        pop ebp
        ret
        