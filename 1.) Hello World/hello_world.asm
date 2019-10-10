; The Global Directive is used to export the symbols where it points in your generated object code.
; The linker requires the "_main" label but its used in a Local space, therefore we have to set it as
; global for the linker to know where it is.
global _main

; The Extern directive is used to specify the symbols that are used in the current file, but their
; definitions are present in some other file where it has been specified as "global"
extern _printf

; Assembly programs can be divided into 3 Sections:
; data, bss or text

; They're specified by the "section" keyword
; followed by a period (".") in-front section name.

; example: section .data

; Only 2 Sections are used in this program.

; The Section that wasn't used in this program is the bss section. tl;dr Its used for un-intialized data.
; Which means that its the data that is changed at runtime.
; Does that ring a bell ? Yup, Variables.

; The data section is used for initialization of constants.
; These values do not change at runtime.

section .data
    message: db "Hello World!", 10, 0 ; db stands for "byte" Its used for specifying the size of this memory location.
                                      ; The 10 after the comma means "\n" or new line character. It is used to insert
                                      ; a new line in the console.
                                      ; Sometimes you might see the 10 written as 0xA (which in Hex is the equiavelent of 10)
                                      ; The 0 at the end tells the computer when to stop.

; The text section contains all of the instructions that
; are to be executed by the Processor.
; text basically means "Code" or "Instructions" here.

section .text
    _main:
        push ebp
        mov ebp, esp
        
        push message
        call _printf
        
        mov esp, ebp
        pop ebp
        ret

; the _main "function" above is literally the full equivalent of this C main function.
; void main() {
;   printf("Hello World!");
; }

; As you can see from this code, This is actually pretty similar to a C Program.
; Where you have the directives at the top, then your constants and variables, and then a main function
; which actually executes the instructions.
