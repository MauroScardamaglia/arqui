; 13. Validar si una matriz es simétrica respecto de su diagonal principal.

; [0] -> n
; [4] -> m
; [8] -> mat[0][0]

; eax -> fila actual
; ebx -> col actual
; ecx -> puntero al elemento opuesto (relativo a la diag principal) mat[j][i] (y)
; edx -> puntero al elemento actual de la matriz mat[i][j] (x)
; eex -> ?
; efx -> calculos auxiliares

                        mov eax, 0
                        
                        mov edx, ds
                        add edx, 12

                        mov ecx, ds
                        mov efx, [4]
                        mul efx, 4
                        add ecx, efx

sigFila:                cmp eax, [0]
                        jnn sim

                        mov edx, ds
                        add edx, 8
                        mov efx, [4]
                        mul efx, 4
                        mul efx, eax
                        add edx, efx
                        mov efx, eax
                        mul efx, 4
                        add edx, efx ; (me situo con x) 

                        mov ecx, ds
                        add ecx, 8
                        mov efx, eax
                        add efx, 1
                        mul efx, [4]
                        mul efx, 4
                        add ecx, efx
                        mov efx, eax
                        mul efx, 4
                        add ecx, efx ; (me situo con y)


                        mov ebx, eax
                        add ebx, 1
sigCol:                 cmp ebx, [8]
                        jnn sigFila

                        cmp [ecx], [edx] ; x == y
                        jnz noSim

                        add edx, 4 ; me muevo con elemento x

                        mov efx, [4]
                        mul efx, 4
                        add ecx, efx ; me muevo con el elemento y

                        add ebx, 1
                        jmp sigCol


sim:                    print("La matriz es simétrica\n") ; ojalá fuera tan fácil..
                        jmp fin

noSim:                  print("La matriz no es simétrica\n") ; ojalá fuera tan fácil..
                        jmp fin

fin:                    stop