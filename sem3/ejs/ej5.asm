; 5. Utilizando el algoritmo anterior, construya un programa que calcule el factorial de un número
; ingresado por teclado.
;               
inicio:         mov EAX 1
                ldh ECX, 4
                ldl ECX, 1
                mov EDX, [0]
                sys 1
                ;
                mov EBX, [0] ; copio el valor original
                mov EEX, EBX
                sub EEX, -1
                ;
verifInicial:   cmp EBX, 0
                JN fin ; si es negativo no calculo ni muestro nada
                JZ casoBase
                cmp EBX, 1
                JZ casoBase
                JMP ciclo
casoBaseInicial:mov EBX, 1
                JMP mostrar
                ;
cicloGral       mov EFX, 0
                mov ac, 0
                ;
cicloMultip:    add ac, 1
                add EFX, EBX
                cmp ac, EEX
                JNZ cicloMultip
                mov EBX, EFX
                sub EEX, 1
verificacion:   cmp EEX, 0
                JZ mostrar
                JMP cicloGral
                ;
mostrar:        mov [4], EBX ; paso el resultado a memoria (en [0] esta x, en [4] está x!)
                mov EAX, 1
                ldh ECX, 4
                ldl ECX, 1
                mov EDX, [4]
                sys 2 ; muestra el resultado
                ;
fin:            STOP
                ;