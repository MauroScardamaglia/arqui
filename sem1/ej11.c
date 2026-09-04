#include <stdio.h>

void imprimirBinario(unsigned int c, int n){
    int i;
    for (i = n-1; i>=0; i--){
        printf("%d", (c >> i) & 1);
        if (i % 4 == 0)
            printf(" ");
    }
    printf("\n");
}

void imprimirHexadecimal(int x){
    printf("%X",x);
    printf("\n");
}

void ej11(char s[], int nro){
    int i;
    unsigned int mascara = 0x80000000;

    for (i=0; i < 32; i++){
        if (nro & mascara)
            s[i] = '1';
        else
            s[i] = '0';
        mascara = mascara >> 1;
        printf("%c\n",s[i]);
    }

    s[32]='\0';
}

int main(){
    char s[33];
    int nro;

    printf("Ingrese numero \n");    
    scanf("%X",&nro);
    imprimirBinario(nro,32);
    imprimirHexadecimal(nro);

    ej11(s, nro);
    printf("%X = \"%s\"", nro, s);

    printf("\n\n\n\n");
    return 0;
}