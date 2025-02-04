# Usamos la imagen oficial de Node.js 18 como base
FROM node:18

# Directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiamos el package.json y el package-lock.json (si existen) para la instalación de dependencias
#COPY package*.json ./

# Instalamos las dependencias
#RUN npm install

# Instalamos SonarScanner en el contenedor
#RUN apt-get update && \
#    apt-get install -y wget openjdk-17-jre-headless && \
#    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip && \
#    unzip sonar-scanner-cli-4.6.2.2472-linux.zip && \
#    mv sonar-scanner-4.6.2.2472-linux /opt/sonar-scanner

# Añadimos al PATH de entorno la ubicación de SonarScanner
#ENV PATH="${PATH}:/opt/sonar-scanner/bin"

# Exponemos el puerto que SonarScanner puede utilizar (si es necesario)
#EXPOSE 9000

# El comando por defecto es iniciar el contenedor con bash
#CMD ["bash"]
