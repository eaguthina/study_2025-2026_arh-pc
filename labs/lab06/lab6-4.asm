;--------------------------------
; Программа вычисления выражения
;--------------------------------

%include 'in_out.asm'   ; подключение внешнего файла

SECTION .data

    msg     DB 'Введите x: ', 0
    res     DB 'Результат: ', 0

SECTION .bss
    buf     RESB 10

SECTION .text
    GLOBAL _start
_start:

    mov eax, msg    ; вызов подпрограммы печати
    call sprint     ; сообщения 'Введите x: '

    mov ecx, buf    ; вызов подпрограммы чтения
    mov edx, 10     ; пользовательского ввода
    call sread      ; в буфер buf

    mov eax, buf    ; вызов подпрограммы преобразования
    call atoi       ; ASCII кода в число (в EAX)

    ; ---- Вычисление выражения
    dec eax         ; EAX=EAX-1
    mul eax         ; EAX=EAX*EAX
    mov ebx,5       ; EBX=5
    mul ebx         ; EAX=EAX*EBX
    mov edi,eax     ; запись результата вычисления в 'edi'

    ; ---- Вывод результата на экран

    mov eax,res     ; вызов подпрограммы печати
    call sprint     ; сообщения 'Результат: '
    mov eax,edi     ; вызов подпрограммы печати значения
    call iprintLF   ; из 'edi' в виде символов

    call quit       ; вызов подпрограммы завершения

