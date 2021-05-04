%include "io.inc" ; TENER EN CUENTA QUE ESTA LINEA ES PROPIO DE LA HERRAMIENTA
extern printf

section .data
    format db "numero: %d", 13,10,0  ;d: numero f: float s: string
    msg db 'Hello, world!', 0
    
    ; CAMBIAR A DQ PARA PUNTO FLOTANTE
    vA db 1
    vB db 2
    vC db 3

section .text
    global CMAIN

CMAIN:
    mov ebp, esp; for correct debugging
 
    mov eax, vA
    mov ebx, vB
    mov ecx, vC
    
    mov edx, 0
    
    add edx, eax
         
    ;PRINT CON LA PILA
    push edx
    push format
    call printf
    add esp, 8
    
    ret