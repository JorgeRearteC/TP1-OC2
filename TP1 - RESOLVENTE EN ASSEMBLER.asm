%include "io.inc" ; TENER EN CUENTA QUE ESTA LINEA ES PROPIO DE LA HERRAMIENTA
extern printf

section .data
    
    ; CAMBIAR A DQ PARA PUNTO FLOTANTE
    numa dw 4
    numB dw 2
    numC dw 3
    
    ; MENSAJES
    msjResultado db "Resultado Final: %d", 13,10,0  ;d: numero f: float s: string
    msjFin db "No es posible calcular"

section .text
    global CMAIN

CMAIN:
    mov ebp, esp; for correct debugging
 
    mov eax, -4
    mov ebx, 0
    mov ecx, 2
    
    mov edx, 0
    
    add edx, eax
    
    cmp eax, ebx
    jle MENSAJE_FIN
    cmp eax, ebx
    jge MENSAJE_RESULTADO
    
    
    ret



MENSAJE_FIN:
    push msjFin
    call printf
    add esp, 8
    ret

MENSAJE_RESULTADO:
    push edx
    push msjResultado
    call printf
    add esp, 8
    ret
