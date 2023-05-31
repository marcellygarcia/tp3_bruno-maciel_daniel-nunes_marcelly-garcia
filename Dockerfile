# Defina qual distro do linux vc quer usar
FROM alpine:latest


# Instale as dependencias do SISTEMA OPERACIONAL
# Exemplo de como seria no ubuntu: RUN apt update && apt install -y python3 python3-pip libpq-dev
RUN apk su-exec update
RUN apk upgrade
RUN apk add su-exec --no-cache build-base
RUN apk add su-exec --no-cache linux-headers
RUN apk add --update --no-cache su-exec python3 python3-dev
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install --no-cache --upgrade wheel
RUN pip3 install --no-cache --upgrade psutil
RUN apk add --update --no-cache postgresql-dev
RUN apk add --update --no-cache libpq-dev



WORKDIR /app
COPY . /app

# Sua imagem deve ter o python 3.8+ instalado e o pip
RUN pip3 install -r requirements.txt
