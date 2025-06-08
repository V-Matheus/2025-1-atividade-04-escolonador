FROM fedora:latest

RUN dnf -y update && \
    dnf -y install findutils fish gcc && \
    dnf clean all

# Cria um diretório para a aplicação (onde os arquivos do host serão mapeados)
RUN mkdir -p /app

# Define o diretório de trabalho padrão dentro do container
WORKDIR /app

# Comando padrão ao iniciar o container: inicia o shell fish
# Isso permite que o usuário compile e execute os códigos C manualmente
CMD ["fish"]

COPY threads_cpu_io.c .

# Compile o código C. O executável será chamado "tarefa"
RUN gcc -o program threads_cpu_io.c -lm

# Comando padrão ao iniciar o container: executa o programa C compilado
CMD ["./threads_cpu_io"]