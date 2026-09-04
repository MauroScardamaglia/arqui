#include <stdio.h>

void imprimirBinario(unsigned int c, int n){
    int i;
    for (i = n-1; i>=0; i--){
        printf("%d", (c >> i) & 1);
        if (i % 4 == 0)
            printf(" ");
    }
}

void ej10(unsigned int num){
    printf("%X \n",num);
    imprimirBinario(num, 16);
    printf("\n\n");

    printf("a) El byte de la izquierda\n");
    imprimirBinario(num >> 8,16);
    printf("%X",num >> 8);
    printf("\n\n");

    printf("b) El byte de la derecha\n");
    imprimirBinario(num & 0x00FF, 16);
    printf("%X",num & 0x00FF);
    printf("\n\n");

    printf("c) Devolver 1 si el número es impar, y 0 si es par\n");
    imprimirBinario(num & 0x0001, 16);
    printf("%X",num & 0x0001);
    printf("\n\n");

    printf("d) Devolver -1 si el número es negativo, y 0 si es positivo\n");
    imprimirBinario(num & 0x8000, 16); // ?????
    printf("%X",num & 0x8000);
    printf("\n\n");

    printf("e) Devolver el número que representan los primeros 12 bits\n");
    imprimirBinario(num & 0xFFF0, 16);
    printf("%X",num & 0xFFF0);
    printf(" ");
    imprimirBinario((num & 0xFFF0) >> 4, 16);
    printf("%X",(num & 0xFFF0) >> 4);
    printf("\n\n");

    printf("f) Devolver el número que representan los últimos 4 bits\n");
    imprimirBinario(num & 0x000F, 16);
    printf("%X",num & 0x000F);
    printf("\n\n");
} 

int main(){
    unsigned int num; // 2 bytes

    printf("Ingrese número en hexadecimal \n");
    scanf("%x", &num);

    printf("Binario: \t ");
    imprimirBinario(num, 16);
    printf("\n");
    printf("Decimal: \t %d \n", num);
    printf("Hexadecimal: \t %X \n",num);
    printf("Octal: \t\t %o \n\n", num);
//    printf("Caracter ASCII: \t %c \n", num);

    ej9(num);

    printf("\n\n\n\n");
    return 0;
}