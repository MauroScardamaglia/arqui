; 7. Dado un número natural, imprimir un 1 si es primo y un 0 si no lo es.
;
; asumo que la entrada es un entero no negativo
;
inicio:             mov EAX, 1
                    mov EDX, [0]
                    ldh ECX, 4
                    ldl ECX, 1
                    sys 1
                    mov EBX, [0]
                    ;
                    ; EBX -> n; EEX -> i (posible factor), EFX -> resultado (1-> primo; 0-> compuesto, -1-> [0-1])
                    ; uso temporalmente EAX como auxiliar
verif               mov EFX, -1
                    cmp EBX, 0     
                    JZ mostrar
                    cmp EBX, 1
                    JZ mostrar
                    mov EFX, 1
                    ;                     
                    mov EEX, 2
                    ;
ciclo:              mov EAX, EBX
                    div EBX, EEX
                    cmp ac, 0
                    JZ asignar
                    add EEX, 1
                    mov EAX, EEX
                    mul EAX, EAX
                    cmp EAX, EBX
                    JP mostrar ; si mi i² es mayor a mi número original entonces no voy a encontrar un factor, sé que es primo
                    JMP ciclo ; sigo buscando factor
                    ;
asignar:            mov EFX 0
                    ;
mostrar:            mov EAX, 1
                    ldh ECX, 4
                    ldl ECX, 1
                    mov [0], EFX
                    mov EDX, [0]
                    sys 2
                    ;
fin:                STOP