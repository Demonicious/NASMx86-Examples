global _main
extern _printf

section .data
    msg1: db "Loops are Nice, Current index: %d", 10, 0
    msg2: db "Looping has Finished", 10, 0
    
    startIndex: dd 0  ; Looping will start from this Index
    timesToRun: dd 14 ; This is the amount of times the loop runs for. Final Index: 13
    
section .text
    _main:
        push ebp
        mov ebp, esp 
        
        mov esi, [startIndex]
        
        _loop:
            push esi
            push msg1
            call _printf
            
            inc esi
            
            cmp esi, [timesToRun]
            je _continue
            jmp _loop
            
    _continue:
        push msg2
        call _printf
    
        mov esp, ebp
        pop ebp
        ret