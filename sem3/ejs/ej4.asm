                ; 4. Suponiendo que no existe la instrucción MUL, crear un algoritmo que reciba en EBX y ECX los
                ; dos valores y retorne en EAX su producto.
                ;
inicio:         ; asumo que ya están almacenados los valores en EBX y ECX (se hace re largo sino y de todos modos no tengo mv para ejecutar, pero la lectura es sencilla)
                mov acc, 0 ; contador para ciclar suma
                mov EAX, 0 ; donde irá el resultado
                ;
preparacion:    ;
                mov EDX, 0 ; cantidad de entradas negativas
                cmp EBX , 0
                JZ fin ; si es 0 salta a STOP
                JP sigue
                ; EBX = - EBX {
                add EDX, 1 ; EBX es negativo
                mov EFX, EBX ; auxiliar
                sub EFX, 0x80000001
                mov EBX, 0x7FFFFFFF
                sub EBX, EFX
                ; }
sigue:          ;
                cmp ECX, 0
                JZ fin
                JP multPosit
                ; ECX = - ECX {
                add EDX, 1
                mov EFX, EBX
                sub EFX, 0x80000001
                mov EBX, 0x7FFFFFFF
                sub EBX, EFX
                ; }
                ;
multPosit:      ; 
                cmp EBX, ECX
                JN ciclo ; EBX < ECX
                swap EBX, ECX ; EBX > ECX, por lo tanto los intercambio
                ;
ciclo:          ; sumo EBX veces ECX
                add acc, 1
                add EAX, ECX
                cmp acc, EBX 
                JZ procesamiento
                JMP ciclo
                ;
procesamiento:  ; si EDX es 0 o 2 el resultado es positivo por lo tanto salto a STOP
                ; si EDX es 1, convierto a negativo el resultado
                cmp EDX, 0
                JZ fin
                cmp EDX, 2
                JZ fin
                ; entonces EDX = 1
                ; EAX = - EAX {
                mov EFX, EAX
                sub EFX, 0x80000001
                mov EAX, 0x7FFFFFFF
                sub EAX, EFX
                ; }
                ;
fin:            STOP
                ;
                ; reflexiones:
                ; 1. no perduran los datos iniciales (EBX, ECX), se podrían guardar en memoria y luego copiar a los registros nuevamente
                ; 2. verifiqué que dato era menor para hacer la mínima cantidad de iteraciones del ciclo de multiplicación
                ; 3. num = - num:
                ; deseo obtener el módulo del número negativo (la distancia al 0)
                ; obtengo la distancia del n negativo al extremo negativo +1 (que en módulo es igual al extremo positivo)
                ; resto esa distancia al extremo positivo -> obtengo el módulo = el número positivo
                ; 4. No leo EBX y ECX ni muestro EAX
                ; esto por reducir el tamaño del código, y porque por consigna tengo que utilizar los mismos registros que necesito para hacer llamado al sistema (eso me indica que no es la idea hacer sys)
                ;