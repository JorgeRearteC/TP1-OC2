#include <stdio.h>

extern int CMAIN ( double, double, double, double , double );

int main(){

    double numA, numB , numC , resX1 , resX2;

    printf ("Ingrese los valores de A, B y C: ");
    
    scanf(" %lf %lf % lf ", &numA, &numB, &numC);

    if ( CMAIN ( numA, numB, numC, &resX1, &resX2 ) )
        printf ("Valores: %.10g %.10g\n", resX1 , resX2 );
    else
        printf ("Sin respuestas\n");
    return 0;

}