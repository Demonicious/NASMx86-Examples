global _main
extern _scanf, _printf

; The scanf function works the same way as it
; does in C;
; scanf(format, variableToStoreIn);

section .data
    input_scan_format: db "%d",0
    input_control_string: db "Please Enter a Number: ", 0
    
    result_control_string: db "Your Input is: %d", 10, 0
   
section .bss
    input_result: resb 4 ; Reserve 4 Bytes in Memory with the name "input_result"
                         ; Equivalent of Variable declaration in C (int input_result;)
                         ; We will store our Input Result in this memory space.

section .text
    _main: 
        push ebp
        mov ebp, esp
        
        push input_control_string
        call _printf
        
        push input_result      ; We don't use [] because the scanf function requires
                               ; a memory address to write into.
        push input_scan_format ; Same order of Instructions as printf.
        call _scanf
        
        push DWORD [input_result]
        push result_control_string
        call _printf
        
        mov esp, ebp
        pop ebp
        ret
        
; Equivalent of this C main function:

; void main() {
;   printf("Please Enter a Number: ");
;   scanf("%d", &input_result);
;   printf("Your Input is: %d", input_result);
; }