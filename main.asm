section .data
    arquivo db "texto.txt", 0

    msg_erro db "arquivo não existe!", 10
    tam_msg_erro equ $ - msg_erro

    msg_vazio db "Arquivo vazio!", 10
    tam_msg_vazio equ $ - msg_vazio

    msg_erro_leitura db "erro ao ler!", 10
    tam_msg_erro_leitura equ $ - msg_erro_leitura

    msg_sucesso db "arquivo possui conteúdo!", 10
    tam_msg_sucesso equ $ - msg_sucesso

section .bss
    buffer resb 100

section .text
    global _start

%macro imprimir 2
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

_start:
    ; openat
    mov rax, 257        ; numero da syscall
    mov rdi, -100       ; AT_FDCWD (Informa para procurar no diretório atual)
    mov rsi, arquivo    ; Nome do arquivo
    mov rdx, 0          ; O_RDONLY (Apenas leitura - antigo rsi do sys_open)
    mov r10, 0          ; Modo de permissão (não usado sem O_CREAT)
    syscall

    cmp rax, 0
    jl erro

    ; guardamos o fd
    mov rbx, rax

    ; sys_read
    mov rax, 0
    mov rdi, rbx
    mov rsi, buffer
    mov rdx, 100
    syscall

    cmp rax, 0
    jl erro_leitura

    cmp rax, 0
    je vazio

    ; bytes lidos
    mov r8, rax

    ; sys_close
    mov rax, 3
    mov rdi, rbx
    syscall


sucesso:
    imprimir msg_sucesso, tam_msg_sucesso

    jmp sair

erro:
    imprimir msg_erro, tam_msg_erro

    jmp sair

erro_leitura:
    imprimir msg_erro_leitura, tam_msg_erro_leitura

    jmp sair

vazio:
    imprimir msg_vazio, tam_msg_vazio

    jmp sair


sair:
    mov rax, 60
    xor rdi, rdi
    syscall