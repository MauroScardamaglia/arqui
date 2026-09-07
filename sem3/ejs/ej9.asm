; 9. Modificar el ejercicio anterior de modo que antes de ingresar la lista se lea un valor que
; represente una máscara con la cual se debe realizar un AND a cada número de la lista antes de
; calcular la cantidad de bits en 1.
;
; [0-3] -> cantBits (uso temporal)
; [4-7] -> mascara que se ingresa antes que la lista
; [8-11] -> cantNumeros (n)
; [12-15, 16-19, ...] -> lista
;
inicio:             ldh ECX, 4
                    ldl ECX, 1
                    ;
leoMascara:         mov EDX, [4]
                    mov EAX, 0x08 ; leo hexadecimal (era lo mismo poner 8)
                    sys 1
                    ;
preparoLeer:        mov EBX, 0 ; lo uso como contador de números
                    mov EAX, 1 ; leo decimales
                    mov EDX, [12]
                    ;
cicloLectura:       sys 1
                    cmp [EDX], 0
                    JN sigue
                    add EDX, 4 ; me muevo a los siguientes 4 bytes en memoria
                    add EBX, 1 ; contador++
                    ;
sigue:              mov [8], EBX ; copiar EBX (cant de números a memoria [8])
                    mov EBX, 0 ; EBX ahora es contador (no cant)                    
                    mov EDX, [12] ; apunte al primer número de la lista
                    ;
aplicoMascaraLista: and EDX, [4] ; aplico la mascara
                    add EBX
                    cmp EBX, [8]
                    JZ inicioCiclo
                    add EDX, 4
                    JMP aplicoMascaraLista
                    ;
inicioCiclo:        mov EBX, 0
                    mov EDX, [12]
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
                    cmp EBX, [8] ; comparo la iteración actual con la cantidad de números en la lista
                    JZ fin
                    add EDX, 4 ; siguiente número de la lista ()
                    JMP preparacion                     
                    ;
fin:                STOP
                    ; acá hay 3 recorridos:
                    ; 1. Leo la lista de números
                    ; 2. Aplico la mascara leída a la lista
                    ; 3. Calculo la cantidad de bits de cada número de la lista y los muestro (dentro de cada iteración hay un ciclo para contar bits)