global _main
extern _printf, _scanf, _getch

section .data
    scan_prompt: db "Please Enter a Number to Print the Table of: ", 0
    scan_format: db "%d", 0
    
    startIndex: dd 1
    timesToMultiply: dd 10
    
    result_message: db "%d x %d = %d", 10, 0
    end_message: db "Finished Execution", 10, 0

section .bss
    number: resb 4

section .text
    _main:
        push ebp
        mov ebp, esp
    
        push scan_prompt
        call _printf
        
        push number
        push scan_format
        call _scanf
        
        mov esi, [startIndex]
        
        _loop:
            mov eax, [number]
            mov ecx, esi
            mul ecx
            
            push eax
            push esi
            push DWORD [number]
            push result_message
            call _printf
            
            inc esi
            
            cmp esi, [timesToMultiply]
            jne _loop
        
        call _getch
        
        mov esp, ebp
        pop ebp
        ret
        
