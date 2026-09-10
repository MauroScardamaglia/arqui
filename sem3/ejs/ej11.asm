; 11. Desarrollar un algoritmo que permita hallar el valor máximo de un vector de enteros y su
; cantidad de apariciones.

; luego de leer el vector:

; ebx -> n (mismo método que en el ej anterior: lo voy disminuyendo hasta que sea 0)
; edx -> puntero a la lista
; eax -> valor máximo
; ecx -> cantidad de apariciones del valor máximo

; lectura(){ 
                mov eax, 1
                ldh ecx, 4
                ldl ecx, 1
                mov edx, ds
                mov ebx, 0

cicloLect:      sys 1
                cmp [edx], 0
                jn proc
                add ebx, 1
                add edx, 4
                jmp cicloLect
; }

proc:           mov edx, ds
                mov eax, 0x80000000 ; menor valor posible (algo así como un "imposible/improbable") (! -> puede aplicar inmediatos de 4 bytes ???)
                mov ecx, 0 ; si la lista aestaba vacia imprimo 0 en la cantidad de apariciones de máximo y 0x80... en el valor

cicloBusqueda:  cmp ebx, 0
                jnp muestro
                sub ebx, 1
                cmp [edx], eax
                jn sigue
                jp nuevoMax
                add ecx, 1
                jmp sigue

nuevoMax:       mov eax, [edx]
                mov ecx, 1                

sigue:          add edx, 4
                jmp cicloBusqueda

muestro:        mov [0], 'c'
                mov [1], 'a'
                mov [2], 'n'
                mov [3], 't'
                mov [4], ' '
                mov [5], ecx
                mov [9], " "
                mov [10], "m"
                mov [11], "a"
                mov [12], "x"
                mov [13], " "
                mov [14], eax

                mov eax, 2
                mov edx, ds
                ldh ecx, 1
                ldl ecx, 5
                sys 2

                mov eax, 1
                mov edx, [ds + 5]
                ldh ecx, 4
                ldl ecx, 1
                sys 2

                mov eax, 2
                mov edx, [ds + 9]
                ldh ecx, 1
                ldl ecx, 5
                sys 2

                mov eax, 1
                mov edx, [ds + 14]
                ldh ecx, 4
                ldl ecx, 1
            
fin:            stop