; 6. Suponiendo que no existe la instrucción DIV, crear un algoritmo que reciba en EBX y ECX los
; dos valores y retorne en EAX el resultado de la división, dejando en AC el resto.
;
; a = b * c + d
; EBX -> dividendo (a)
; ECX -> divisor (b)
; EAX -> cociente (c)
; acc -> resto (d)
;
;   Asumo que ambos valores de entrada son positivos, sino se hace re largo
;
verifCero:          ; verificar si ECX es 0
                    cmp ECX, 0
                    JZ fin
                    ;
division:           mov EAX, 0 ; cociente empieza en 1
                    ;
ciclo:              add EAX, 1
                    mov EFX, ECX
                    mul EFX, EAX
                    cmp EBX, EFX
                    JNN ciclo
                    ; si llegamos acá es porque el cociente era el anterior
                    sub EAX, 1 ; listo, tengo el cociente
                    mov ac, EBX
                    mov EFX, ECX
                    mul EFX, EAX
                    sub ac, EFX ; listo, tengo el divisor
                    ;
fin:                STOP