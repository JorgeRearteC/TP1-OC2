%include "io.inc"

section .data
    
    ; CAMBIAR A DQ PARA PUNTO FLOTANTE
    numA dq 4.0
    numB dq 10.0
    numC dq 3.0
    
    cos1 dq -4.0
    cos2 dq -1.0
    cos3 dq 2.0
    
    resX1 dq 0  
      
    ; MENSAJES
    msjResultado db 13,10,"Resultado Final" ;d: numero f: float s: string
    
    
section .bss
    ;resX1 resq 1    ;the result ‒ length of side c
    resX2 resq 1
    
section .text
    global CMAIN

CMAIN:
    mov ebp, esp; for correct debugging
    
    ;CALCULO X1
    
    fld qword [cos1] ; Se almacena en ST0 
    
    fmul qword [numA]
    fmul qword [numC]
    
    fld qword [numB]
    fmul st0,st0
    
    faddp
    
    fsqrt 
    
    fld qword [numB]
    fmul qword [cos2]
    
    fld qword [cos2]
    fmul st0,st2
;    fmul qword [cos3]    
       
    faddp 
    
    fld qword [numA]
    fmul qword [cos3]
    
    fdivp st1,st0
    
    fstp qword [resX1]

    ;CALCULO X2
    
    fld qword [cos1] ; Se almacena en ST0 
    
    fmul qword [numA]
    fmul qword [numC]
    
    fld qword [numB]
    fmul st0,st0
    
    faddp
    
    fsqrt 
    
    fld qword [numB]
    fmul qword [cos2]
        
    faddp 
    
    fld qword [numA]
    fmul qword [cos3]
    
    fdivp st1,st0
    
    fstp qword [resX2]
            
    ;fstp qword [delta]
    
    ;mov edx, delta
    
;    fstp qword edx
    
;    mov edx, [resX1]
    ;fsqrt 
    
    ;fmul
    ;fdiv
    
    ;mov edx, 5
    
    
    
;    add resX1, eax
    
    ;cmp eax, ebx
    ;jge MENSAJE_RESULTADO
    
    ;call MENSAJE_RESULTADO
    
    
;    mov AH, 09H
;    mov DX, [msjResultado]
;    int 21H
    
    ret
    
    
    