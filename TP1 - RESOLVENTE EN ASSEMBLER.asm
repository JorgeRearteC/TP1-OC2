%include "io.inc" ; TENER EN CUENTA QUE ESTA LINEA ES PROPIO DE LA HERRAMIENTA
extern printf

section .data
    format db "numero: %d", 13,10,0  ;d: numero f: float s: string
    msg db 'Hello, world!', 0

section .text
    global CMAIN

CMAIN:
    mov ebp, esp; for correct debugging
 
    mov eax, 14
    
    ;PRINT CON LA PILA
    push eax
    push format
    call printf
    add esp, 8
    
    ret