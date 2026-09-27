;           2. Dada una lista de ceros y unos que se ingresan por teclado, imprimir el valor decimal
;           equivalente. El fin de la lista se indica con un número distinto de 0 y 1.
;           a. La lista se ingresa del bit menos significativo al más significativo.
;           b. La lista se ingresa del bit más significativo al menos significativo.
           
;           Inciso a. little endian (un poco más complejo)
;               EBX -> contador
;               EEX -> numero
;               EFX -> ~"mascara" // dígitos a desplazar al final

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

avanza:         ldh EFX, 0x8000
                mul [0], EFX
                add EBX, 1                
                shr EEX, 1
                or EEX, [0]
                cmp EBX, 32
                JZ corte 
                JMP cicloLectura    

                ; si llegamos acá es porque el usuario ingresó un n° distinto a 0,1 o se llenó el registro
                ; si el registro no está lleno hay que hacer corrimiento

corte:          cmp EBX, 32
                JZ print
                mov EFX, 32
                sub EFX, EBX
                shr EEX, EFX

print:          mov [0], EEX
                mov EAX, 0x19 ; imprime en binario, hexadecimal y decimal
                ldh ECX, 4
                ldl ECX, 1
                mov EDX, DS
                sys 2

                STOP