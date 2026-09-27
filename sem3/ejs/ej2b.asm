;           2. Dada una lista de ceros y unos que se ingresan por teclado, imprimir el valor decimal
;           equivalente. El fin de la lista se indica con un número distinto de 0 y 1.
;           a. La lista se ingresa del bit menos significativo al más significativo.
;           b. La lista se ingresa del bit más significativo al menos significativo.

;           Inciso b. Big Endian (más sencillo)

;               EBX -> contador
;               EEX -> número

                mov EAX, 1
                mov EDX, DS
                ldl ECX, 1
                ldh ECX, 4
                mov EBX, 0
                mov EEX, 0
                
cicloLectura:   sys 1
                cmp [0], 0
                JZ avanza
                cmp [0], 1
                JZ avanza
                JMP corte
                
avanza:         add EBX, 1                
                shl EEX, 1
                or EEX, [0]
                cmp EBX, 32
                JZ corte 
                JMP cicloLectura    

corte:          mov [4], EEX
                mov EAX, 0x19 ; imprime en binario, hexadecimal y decimal
                ldh ECX, 4
                ldl ECX, 1
                mov EDX, DS
                add EDX, 4
                sys 2

                STOP