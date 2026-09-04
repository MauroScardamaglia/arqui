#include <stdio.h>
#include <stdlib.h>

void imprimirBinario(unsigned char c){
    int i;
    for (i=7;i>=0;i--){
        printf("%d", (c >> i) & 1);
    }
}

int main(){
    char c1, c2;
    unsigned char c;

    c1 = 'A'; // 65 ascii 01000001
    c2 = 'a'; //+32 -> 97 ascii 01100001

//    c = c1;
//    printf("Ingrese caracter \n");
//   scanf(" %c",&c);

    printf("Ingrese caracter \n");
    scanf(" %x",&c);

    printf("Caracter: %c \n",c);
    printf("Valor Ascii: %d \n",c);
//    printf("Binario: %0b \n",c1);
    printf("Hexadecimal (minúscula): %x \n",c);
    printf("Hexadecimal (mayúscula): %X \n",c);
    printf("Octal: %o \n",c);
    printf("Binario: ");
    imprimirBinario(c);

    printf("\n\n\n");
    return 0;
}