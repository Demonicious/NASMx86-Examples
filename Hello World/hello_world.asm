global _main
extern _printf

; Assembly programs can be divided into 3 Sections:
; data, bss or text

; They're specified by the "section" keyword
; followed by a period (".") in-front section name.

; example: section .data

; Only 2 Sections are used in this program.

; The data section is used for initialization of constants.
; These values do not change at runtime.

section .data
    message: db "Hello World!", 10, 0

; The text section contains all of the instructions that
; are to be executed by the Processor.
; text basically means "Code" or "Instructions" here.

section .text
    _main:
        push message
        call _printf
        add esp, 4
        ret
