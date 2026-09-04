; 3. Dado un valor decimal ingresado por teclado, imprimir su valor binario equivalente como una
; secuencia de ceros y unos.
;
leo:            mov EAX, 1
                ldh ECX, 4
                ldl ECX, 1
                mov EDX, [DS + 2]
                sys 1 ; leí y guardé en [0]
                mov EBX, [0]
                mov EFX, 0x80000000 ; preparo la mascara para la primera iteración
                mov [0], 0
                mov [1], 1
                ;
ciclo:          mov EEX, EBX
                AND EEX, EFX
                cmp EEX, 0
                JZ
                ; el bit es 1
                mov EDX, [1]
                ldh ECX, 1
                s


                cmp EFX, 0
                JZ fin
                JMP ciclo

fin:            STOP