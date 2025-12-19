; lab4.asm
section .data                            ; Начало секции данных
    name:      db 'Гущина Екатерина',10  ; фамилия и имя плюс
                                         ; символ перевода строки
    nameLen    equ $-name                ; Длина строки name

section .text           ; Начало секции кода
    global _start

_start:                 ; Точка входа в программу
    mov eax, 4          ; Системный вызов для записи (sys_write)
    mov ebx, 1          ; описатель файла '1' - стандартный вывод
    mov ecx, name       ; адрес строки name в ecx
    mov edx, nameLen    ; размер строки name
    int 80h             ; вызов ядра
    
    mov eax, 1          ; Системный вызов для выхода (sys_exit)
    mov ebx, 0          ; Выход с кодом возврата '0' (без ошибок)
    int 80h             ; вызов ядра
