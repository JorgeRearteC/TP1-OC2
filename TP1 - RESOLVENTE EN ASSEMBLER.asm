%include "io.inc"

section .data
    
    ; CAMBIAR A DQ PARA PUNTO FLOTANTE
    numA dq 4.0
    numB dq 10.0
    numC dq 3.0
    
    cos1 dq -4.0
    cos2 dq -1.0
    cos3 dq 2.0
    cos4 dq 1.0
        
    
section .bss
    resX1 resq 1    ;the result ‒ length of side c
    resX2 resq 1
    
section .text
    global CMAIN

CMAIN:
    mov ebp, esp; for correct debugging
   
    
    fld qword [cos1] ; Se almacena en ST0 
    fmul qword [numA] ; -4 * A
    fmul qword [numC] ; -4*A * C
    fld qword [numB] ; B , -4*A*C
    fmul st0,st0 ; B*B , -4*A*C
    faddp ; Suma todos los registros (B*B-4*A*C)
    
    ; VALIDO SI TIENE RESULTADOS
    ftst
    fstsw ax
    sahf
    jb SIN_RESULTADO
    
    
    fsqrt ; √(B*B-4*A*C)
    fld qword [numB] ; B , √(B*B-4*A*C)
    fmul qword [cos2] ; -B , √(B*B-4*A*C)
    fld qword [numA] ;  A , -B , √(B*B-4*A*C)
    fmul qword [cos3] ; 2*A , -B , √(B*B-4*A*C)
    fld qword [cos2] ; -1 , 2*A , -B , √(B*B-4*A*C)
    fmul st0,st3 ; -√(B*B-4*A*C), 2*A , -B , √(B*B-4*A*C)     
    fld qword [cos4] ; 1 , -√(B*B-4*A*C) , 2*A , -B , √(B*B-4*A*C)
    fmul st0,st3 ; -B , -√(B*B-4*A*C) , 2*A , -B , √(B*B-4*A*C)
    faddp ;  -B-√(B*B-4*A*C) , 2*A , -B , √(B*B-4*A*C)
    fld qword [cos4] ;  1 , -B-√(B*B-4*A*C) , 2*A , -B , √(B*B-4*A*C)
    fmul st0,st2 ;  2*A , -B-√(B*B-4*A*C) , 2*A , -B , √(B*B-4*A*C)
    fdivp st1,st0  ;  (-B-√(B*B-4*A*C))/2*A , 2*A , -B , √(B*B-4*A*C)
    fstp qword [resX1] ; GUARDO ST0 EN RESX2
    
    ; 2*A , -B , √(B*B-4*A*C)
    
    fld qword [cos4] ; 1 , 2*A , -B , √(B*B-4*A*C)
    fmul st0,st3
    
    fld qword [cos4] ; 1 , 1 , 2*A , -B , √(B*B-4*A*C)
    fmul st0,st3
    faddp 
    
    fld qword [cos4]
    fmul st0,st2
    
    fdivp st1,st0
    fstp qword [resX2]

        
    
    
    ret
    
SIN_RESULTADO:;DEJO A LAS VARIABLES COMO 0
    jmp FIN
    ret

FIN:;FIN EJECUCION
    ret

    
    
    
    
