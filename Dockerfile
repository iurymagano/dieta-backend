# Defina a imagem base
FROM node:14

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos do projeto para o contêiner
COPY . /app

# Instale as dependências
RUN yarn install

# Exponha a porta necessária pelo seu projeto
EXPOSE 3333

FROM postgres

RUN apt-get update && apt-get install -y postgresql-client

# Defina o comando de inicialização do projeto
CMD yarn dev