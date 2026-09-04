;           2. Dada una lista de ceros y unos que se ingresan por teclado, imprimir el valor decimal
;           equivalente. El fin de la lista se indica con un número distinto de 0 y 1.
;           a. La lista se ingresa del bit menos significativo al más significativo.
;           b. La lista se ingresa del bit más significativo al menos significativo.
;
;           Inciso b. Big Endian (más sencillo)
;           
inicio:          ; preparo los parametros del sys
                mov EAX, 1
                mov EDX, DS
                ldl ECX, 1
                ldh ECX, 1 ; 1
                ; inicializo en 0 contador y registro binario, respectivamente
                mov EBX, 0
                mov EEX, 0
                ;
cicloLectura:   ; leo:
                sys 1
                cmp [0], 0
                JZ avanza
                cmp [0], 1
                JZ avanza
                JMP corte ; si llegamos acá es porque el usuario ingresó un n° distinto a 0,1
                ;
avanza:         ; si llegamos a esta línea es porque el usuario ingresó un dato valido
                cmp EBX, 0
                ; acá hago una diferenciación entre el primer bit a ingresar y el resto (en el primero no hago SHL)
                JNZ procNormal
                mov EBX, 1
                mov EEX, [0]
                jmp cicloLectura
                ;
procNormal:      ;
                add EBX, 1                
                shl EEX, 1
                or EEX, [0]
                cmp EBX, 32
                JZ corte 
                JMP cicloLectura    
                ;
corte:          ; si llegamos acá es porque el usuario ingresó un n° distinto a 0,1 o se llenó el registro
                ; movemos el binario a memoria, configuramos el print
                mov [1], EEX
                mov EAX, 0x19 ; imprime en binario, hexadecimal y decimal
                ldh ECX, 4 ; imprime 32 bits
                ldl ECX, 1
                ldl EDX, [1]
                sys 2
                ;
                STOP ; termina el programa xD