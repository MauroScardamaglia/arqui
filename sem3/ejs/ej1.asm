;           . Calcular e imprimir el promedio de una lista de números naturales que se ingresan 
;           por teclado. El fin de la lista se indica con un número negativo.
;
inicio:     mov EBX, 0; este va a ser mi contador n
            mov EEX, 0; este va a ser mi acumulador acum
            mov EFX, 0; este va a ser mi promedio
            mov EDX, DS
            add EDX, 12; uso 3 * 4 bytes para mostrar 3 valores después el n, acum y prom 
            ;
            mov EAX, 0
            ldh ECX, 2
            ldl ECX, 1
            ;
cicloLec:   sys 1
            cmp [EDX], 0
            JN proc ; si es negativo salta, sino seguí
            add EBX, 1; cont++
            add EEX, [EDX]
            add EDX, 2; siguiente par de celdas para guardar
            add EEX, [EDX]
            JMP cicloLec
proc:       ;
            cmp EBX, 0
            JNZ noNulo
            mov [0], EBX
            mov EDX, DS
            mov EAX, 0
            ldh ECX, 2
            ldl ECX, 4
            sys 1 ; va escribir un 0, para no hacer division por 0
            JMP fin
            ;
noNulo:     mov [0], EBX ; cont guardo en pos0
            mov [4], EEX
            mov EFX, EBX
            div EFX, EBX ; hace la division (entera)
            mov [8], EFX
            mov EDX; [4]
            sys 2
            ;
fin:        stop