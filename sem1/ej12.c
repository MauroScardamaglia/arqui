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

int main(){
    printf("Ingrese un numero\n");
    int num;
    scanf("%d",&num);
    imprimirBinario(num,32);

    printf("\n\n\n");
    return 0;
}