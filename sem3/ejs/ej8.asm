; 8. Se ingresan una serie de números naturales, terminada con un número negativo. Mostrar por
; cada número ingresado la cantidad de bits en 1 que contiene su representación binaria.
;
inicio:             mov EAX, 1
                    mov EDX, [8] ; voy a usar los primeros 2*4 bytes para mostrar la cant de bits y almacenar el tamaño de la lista
                    ldh ECX, 4
                    ldl ECX, 1
                    ;
                    mov EBX, 0 ; lo uso como contador de números
                    ;
cicloLectura:       sys 1
                    cmp [EDX], 0
                    JN sigue
                    add EDX, 4 ; me muevo a los siguientes 4 bytes en memoria
                    add EBX, 1 ; contador++
                    ;
sigue:              mov [4], EBX ; copiar EBX (cant de números a memoria [4])
                    mov EBX, 0 ; EBX ahora es contador (no cant)                    
                    mov EDX, [8] ; apunte al primer número de la lista
                    ;
preparacion:        ; para el ciclo que cuenta cantidad de bits no necesito hacer sys
                    mov EAX, 0 ; contador de bits
                    mov ECX, 0x80000000 ; mascara
                    mov EEX, [EDX] ; copio el número a registro
                    ; EFX va a guardar el resultado (0 o algo distinto de 0)
                    ;
cicloCantBits:      mov EFX, EEX
                    and EFX, ECX
                    cmp EFX, 0
                    JZ mueveMascara
                    add EAX, 1
                    ;
mueveMascara:       shr ECX, 1
                    cmp ECX, 0
                    JZ procesar
                    JMP cicloCantBits
                    ;
procesar:           add EBX, 1
                    ldh ECX, 4
                    ldl ECX, 1
                    mov EFX, EDX ; temporalmente guardo el puntero a la lista en EFX
                    mov [0], EAX
                    mov EAX, 1
                    mov EDX, [0]
                    sys 2
                    mov EDX, EFX ; devuelvo el puntero a la lista a EDX
                    cmp EBX, [4] ; comparo la iteración actual con la cantidad de números en la lista
                    JZ fin
                    add EDX, 4 ; siguiente número de la lista ()
                    JMP preparacion                     
                    ;
fin:                STOP