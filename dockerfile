FROM python:3.10-buster

ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt /requirements.txt

# Estos comandos funcionan para sistemas basado en Debian
# Actualizamos la lista de paquetes disponibles en los repositorios de Debian
RUN apt-get update && \

# Instalamos los paquetes necesarios para compilar e instalar otros paquetes, y el paquete python3-dev necesario para compilar algunas dependencias de Python
    apt-get install -y --no-install-recommends build-essential python3-dev && \

# Eliminamos la lista de paquetes disponibles descargados y no necesarios para reducir el tamaño de la imagen
    rm -rf /var/lib/apt/lists/* && \

# Instalamos las dependencias de Python especificadas en requirements.txt
    pip install -r /requirements.txt && \

# Desinstalamos los paquetes que se instalaron anteriormente y que ya no son necesarios, incluyendo los paquetes de compilación y desarrollo que instalamos anteriormente. 
    apt-get purge -y --auto-remove build-essential python3-dev && \

# Limpiamos la caché de paquetes y eliminamos archivos temporales para reducir el tamaño de la imagen.
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/* /root/.cache/*


RUN mkdir /app
COPY ./django_project /app
WORKDIR /app
COPY ./scripts /scripts

RUN chmod +X /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static


RUN adduser --disabled-password --gecos "" --no-create-home user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user 

CMD ["entrypoint.sh"]




