#include <stdio.h>

int main(){
    int a[3] = {0x0A0B0C0D, 0x1A1B1C1D, 0x0};
    char* c = (char*) &a[0];

    while (*c != 0x0){
        printf(" %02X\n", *c);
        c++;
    }

    printf("\n\n\n");
    return 0;
}