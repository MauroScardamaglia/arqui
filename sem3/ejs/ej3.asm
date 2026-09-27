; 3. Dado un valor decimal ingresado por teclado, imprimir su valor binario equivalente como una
; secuencia de ceros y unos.

leo:            mov EAX, 1
                ldh ECX, 4
                ldl ECX, 1
                mov EDX, DS
                sys 1 ; leí y guardé en [0]
                mov EFX, 0
                ldh EFX, 0x8000 ; preparo la mascara para la primera iteración 
                mov [4], 0 ; constante en pos [4 - 7]
                mov [8], 1 ; constante en pos [8 - 11]

ciclo:          mov EEX, [0]
                and EEX, EFX
                cmp EEX, 0
                JZ bitCero ; salta si es 0

                ; el bit es 1
                mov EDX, DS
                add EDX, 8
                JMP escribe

                ; el bit es 0
bitCero:        mov EDX, DS
                add EDX, 4
                
escribe:        ldh ECX, 4
                ldl ECX, 1
                mov EAX, 1 ; imprime decimal (un 0 o 1)
                sys 2

                shr EFX, 1 ; hago >>> shift lógico a derecha de la mascara para "leer" el siguiente bit
                cmp EFX, 0 ; si la mascara es 0 es porque ya se "leyeron" todos los 32 bits
                JZ fin
                JMP ciclo

fin:            STOP