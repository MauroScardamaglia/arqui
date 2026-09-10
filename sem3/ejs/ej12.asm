; 12. Construir un programa que almacene en un vector los mínimos de cada columna de una matriz
; de números enteros.

; [0] -> filas matriz
; [4] -> columnas matriz
; [8....] -> mat
; mat + [0] * [4] -> vec
; el largo del vector es [4] (no lo necesito en sí)

; eax, minimo de la columna actual
; ebx, indica columna actual
; ecx, indica fila actual
; edx, puntero al elemento actual de la matriz
; eex, apunta a elemento actual del vector
; efx, auxiliar para calcular posiciones 

; me da paja escribir el código para la carga de la matriz
                        mov efx, [0]
                        mul efx, [4]
                        mov eex, ds
                        add eex, 8
                        add eex, efx ; me posiciono en la pos0 del vec
                        mov ebx, 0 ; j = 0

sigCol                  cmp ebx, [4]
                        JNN fin

                        mov ecx, 0 ; i = 0
                        mov efx, ebx
                        mul efx, 4
                        mov edx, ds
                        add edx, 8 ; me posiciono al inicio de la matriz
                        add edx, efx ; me muevo a la columna actual en la fila 0
                        mov eax, 0x7FFFFFFF ; valor "imposible"

sigFila                 cmp ecx, [0]
                        JNN escriboVec
                        cmp [edx],eax
                        JNN avanzo
                        mov eax, [edx]
avanzo:                 mov efx, [4]
                        mul efx, 4
                        add edx, efx ; me desplazo a la siguiente fila
                        add ecx, 1
                        jmp sigFila

escriboVec:             mov eex, eax ; copio el minimo en el vec
                        add eex, 4 ; avanzo en el vec
                        add ebx, 1
                        jmp sigCol

fin:                    stop