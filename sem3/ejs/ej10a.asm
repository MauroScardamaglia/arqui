; 10. Hacer un programa que permita ingresar una lista de números que finaliza con un número
; negativo. Luego, el programa pedirá ingresar n-1 números de la misma lista y, al finalizar la
; carga, deberá mostrar el número que falta. Los números de las listas pueden ser ingresados en
; cualquier orden. Ejemplo: se ingresan 4,5,3,7,-1 luego 3,7,4 y muestra 5.

; a. Resolver el problema utilizando un vector.
; b. Proponer una solución sin utilizar arreglos.

; luego de la lectura inicial:
; como leo los números de la 2da lista necesito eax, ecx y edx
; ebx -> puntero para buscar en la lista original
; eex -> no lo uso
; efx -> n de la primera lista, que voy haciendo -= 1, mientras sea mayor a 1 sigo iterando la ingresa de números

                    mov eax, 1
                    mov edx, ds
                    ldh ecx, 4
                    ldl ecx, 1
                    mov efx, 0 ; contador
                    
cicloLectura:       sys 1
                    cmp [edx], 0
                    jn segundoCiclo

                    add efx, 1
                    add edx, 4
                    mov [edx], 0
                    add edx, 4
                    jmp cicloLectura

segundoCiclo:       mov eax, 1
                    add edx, 4
                    ldh ecx, 4
                    ldl ecx, 1

ingresoNum:         cmp efx, 1
                    jnp numeroRestante
                    sys 1
                    sub efx, 1
                    mov ebx, ds

avanzo              cmp [ebx], [edx]
                    JZ marco
                    add ebx, 8
                    jmp avanzo ; asumo que va a encontrar una coincidencia porque los números ingresados tienen que pertenecer a la lista original

marco:              add ebx, 4
                    mov ebx, 1
                    jmp ingresoNum

numeroRestante:     mov ebx, ds
                    add ebx, 4

buscoRestante:      cmp [ebx], 1
                    jn muestro
                    add ebx, 8
                    jmp buscoRestante

muestro:            sub ebx, 4
                    mov eax, 1
                    ldh ecx, 4
                    ldl ecx, 1
                    mov edx, ebx
                    sys 2

fin:                stop                    