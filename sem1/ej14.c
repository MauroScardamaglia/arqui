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

void weekday_set(char* c, int dia){
    *c |= 1 << dia;
}

void weekday_reset(char* c, int dia){
    *c &= (~(1 << dia));
}

int main(){
    char * c, opc;
    int dia;
    
    *c = 0;
    imprimirBinario(*c,8);

    printf("a -> agregar dia, q -> quitar dia, n -> terminar\n");
    scanf("%c",&opc);
    while(opc != 'n'){
        printf("Ingrese un numero del 0 al 6 \n");
        scanf(" %d",&dia);
        if (opc == 'a')
            weekday_set(c,dia);
        else
            weekday_reset(c,dia);
        imprimirBinario(*c,8);
        printf("a -> agregar dia, q -> quitar dia, n -> terminar\n");
        scanf(" %c",&opc); 
    }


    printf("\n\n\n");
    return 0;
}