NULL equ -1

; nodo lista
VALOR equ 0
DATO equ 2
SIG equ 6

; especificación sub rutina buscar
; push <<valor>>
; push <<lista * >>
; call buscar
; add sp, 8
; eax <- dato * (dato es ptr, osea que es un doble puntero)


buscar:             push bp
                    mov bp, sp
                    ; voy a usar eax (lo que retorno) como mi variable local puntero doble ** ret
                    push ebx; * lista

                    mov edx, NULL
                    mov ebx, [bp+8] ; lista *
                    cmp ebx, NULL
                    jz retornoBuscar

                    cmp w[ebx + VALOR], [bp + 12] ; lista->valor == valor
                    jnz llamadaRecursiva
                    mov eax, ebx
                    add eax, DATO
                    jmp retornoBuscar

llamadaRecursiva:   push [ebx+SIG]
                    push [bp+12]
                    call buscar
                    add sp, 8
                    
retornoBuscar:      pop ebx
                    mov sp, bp
                    pop bp
                    ret