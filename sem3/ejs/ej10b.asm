; 10. Hacer un programa que permita ingresar una lista de números que finaliza con un número
; negativo. Luego, el programa pedirá ingresar n-1 números de la misma lista y, al finalizar la
; carga, deberá mostrar el número que falta. Los números de las listas pueden ser ingresados en
; cualquier orden. Ejemplo: se ingresan 4,5,3,7,-1 luego 3,7,4 y muestra 5.

; a. Resolver el problema utilizando un vector.
; b. Proponer una solución sin utilizar arreglos.

; luego de la lectura inicial:
; como leo los números de la 2da lista necesito eax, ecx y edx
; ebx -> acumulador de la lista original
; eex -> acumulador de la segunda lista
; efx -> n de la primera lista, que voy haciendo -= 1, mientras sea mayor a 1 sigo iterando la ingresa de números

                    mov eax, 1
                    mov edx, ds
                    ldh ecx, 4
                    ldl ecx, 1
                    mov efx, 0 ; contador
                    mov ebx, 0
                    
cicloLectura:       sys 1
                    cmp [edx], 0
                    jn segundoCiclo

                    add efx, 1 ; contador++
                    add ebx, [edx] ; acumulador +=
                    add edx, 4 ; avanzo (i++)
                    jmp cicloLectura

segundoCiclo:       mov eax, 1
                    mov edx, 4
                    ldh ecx, 4
                    ldl ecx, 1
                    mov eex, 0

segundaLectura:     cmp efx, 1
                    jn numeroRestante
                    sys 1
                    sub efx, 1
                    add eex, [edx]
                    jmp segundaLectura

numeroRestante:     sub ebx, efx ; acumOriginal -= acumSecuela (= nroRestante)
                    mov eax, 1
                    ldh ecx, 4
                    ldl ecx, 1
                    mov [ds], ebx ; paso a memoria el número que falta
                    mov edx, ds
                    sys 2 ; lo muestro por pantalla

fin:                stop