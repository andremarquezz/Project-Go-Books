# Use a imagem oficial do Go como base
FROM golang:1.20

# Instale o MinGW-w64 (para Windows)
RUN apt-get update && apt-get install -y mingw-w64

# Defina o diretório de trabalho
WORKDIR /app

# Copie o código fonte para o contêiner
COPY . .

# Defina o ambiente CGO_ENABLED para garantir a construção correta
ENV CGO_ENABLED=1

# Compile o projeto
RUN go build -o main ./cmd/gobook

# Defina o comando para rodar a aplicação
CMD ["./main"]
