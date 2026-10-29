\\ include buscar.asm
; nodo arbol
CLAVE equ 0
IZQ equ 2
DER equ 6

; especificación sub rutina btnList
; push <<listaNode*>>
; push << arbol** >>
; call btnList
; add sp, 8
; no devuelve nada (es void)

btnList:                push bp
                        mov bp, sp
                        push eax ; retorno de la función buscar
                        push ebx ; ptr simple
                        push edx ; ptr doble (luego la reuso para llamadaRecursiva)
                        
                        mov edx, [bp+12]
                        mov ebx, [edx]
                        cmp ebx, NULL
                        jz retornoBtnList

                        push [bp+8]
                        push w[ebx+VALOR]
                        call buscar
                        add sp, 8
                        cmp eax, NULL
                        jz recursividadBtnList

                        mov [eax], ebx ; conecto nodoLista con nodoArbol
                        mov [edx], NULL

                        ; edx pasa a ser mi puntero a campo izq o der
recursividadBtnList:    mov edx, ebx
                        add edx, IZQ
                        push edx
                        push [bp+12]
                        call btnList
                        add sp, 8

                        mov edx, ebx
                        add edx, DER
                        push edx
                        push [bp+12]
                        call btnList
                        add sp, 8

retornoBtnList:         pop eax
                        pop ebx
                        pop edx
                        mov sp, bp
                        pop bp
                        ret