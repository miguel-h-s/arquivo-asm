# arquivo-asm

Este projeto apresenta um exemplo de um programa usando arquivos em assembly

## 🧠 Detalhes Técnicos e Arquitetura
* **Arquitetura:** x86_64 (64 bits)
* **Sintaxe:** Intel
* **Montador:** NASM (Netwide Assembler)
* **Linker:** GNU ld
* **Sistema Operacional:** Linux
* **Chamadas de Sistema (Syscalls):** Utiliza as syscalls nativas do Linux de 64 bits (`sys_write` para saída e `sys_exit` para finalização).


## 🚀 Como Compilar e Executar

Certifique-se de ter o `nasm` e as ferramentas de build essenciais (`build-essential`) instaladas no seu Linux.

1. **Clone o repositório:**
   ```bash
   git clone <link-do-seu-repositorio>
   cd <nome-da-pasta>
   ```

2. **Compile o código-fonte (Montagem):**
   ```bash
   nasm -f elf64 main.asm -o main.o
   ```

3. **Gere o executável (Linkagem):**
   ```bash
   ld main.o -o main
   ```

4. **Execute o programa:**
   ```bash
   ./main
   ```
