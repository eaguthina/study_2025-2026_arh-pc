; hello.asm
section .data                           ; Начало секции данных
    hello:      db 'Hello world!',10    ; 'Hello world!' плюс
                                        ; символ перевода строки
    helloLen    equ $-hello             ; Длина строки hello

section .text           ; Начало секции кода
    global _start

_start:                 ; Точка входа в программу
    mov eax, 4          ; Системный вызов для записи (sys_write)
    mov ebx, 1          ; описатель файла '1' - стандартный вывод
    mov ecx, hello      ; адрес строки hello в ecx
    mov edx, helloLen   ; размер строки hello
    int 80h             ; вызов ядра
    
    mov eax, 1          ; Системный вызов для выхода (sys_exit)
    mov ebx, 0          ; Выход с кодом возврата '0' (без ошибок)
    int 80h             ; вызов ядра
