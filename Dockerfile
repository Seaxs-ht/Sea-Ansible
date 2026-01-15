# Usamos una base ligera de Ubuntu
FROM ubuntu:latest

# Evitamos que nos haga preguntas durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalamos Ansible y herramientas de red útiles
# sshpass: vital para conectar por contraseña inicial a los routers
# iputils-ping: para hacer ping desde dentro del contenedor
# nano: por si hay que editar algo rápido dentro
RUN apt-get update && \
    apt-get install -y ansible sshpass openssh-client iputils-ping nano python3-paramiko && \
    rm -rf /var/lib/apt/lists/*

# Creamos una carpeta de trabajo dentro del contenedor
WORKDIR /ansible

# (Opcional) Comando por defecto al iniciar
CMD ["/bin/bash"]
