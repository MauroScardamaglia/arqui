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

void diasActivos(char c, char* semana ){
    printf("\n");
    int i;
    for (i=0;i<7;i++){
        if((c >> i) & 1)
            printf("%s", semana + i*10);
        printf("\n");
    }



}

int main(){
    char semana[7][10] = {
        "Lunes",
        "Martes",
        "Miercoles",
        "Jueves",
        "Viernes",
        "Sabado",
        "Domingo"
    };

    char c;
    int num;
    printf("Ingrese valor (00 - FF)\n");
    scanf("%X",&num);
    c = num;
    imprimirBinario(c,8);

    diasActivos(c, semana);

    printf("\n\n\n");
    return 0;
}