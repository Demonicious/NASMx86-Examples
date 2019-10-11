global _main
extern _printf

section .data
    control_string_x: db "x = %d", 10, 0
    control_string_y: db "y = %d", 10, 0

section .bss
    x: resb 4
    y: resb 4
    
section .text
    _main:
        push ebp
        mov ebp, esp
        
        mov [x], DWORD 350
        mov [y], DWORD 641
        
        mov eax, [x]
        mov esi, [y]
        
        mov [y], eax
        mov [x], esi
        
        push DWORD [x]
        push control_string_x
        call _printf
        
        push DWORD [y]
        push control_string_y
        call _printf
        
        mov esp, ebp
        pop ebp
        ret
        