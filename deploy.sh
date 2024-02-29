#!/bin/bash

# Apagar NGINX
sudo systemctl stop nginx

# Apagar NGROK
killall ngrok

# Clonar el repositorio (asegurando que estás en el directorio correcto)
cd /ruta/a/tu/repositorio
git pull

# Encender NGINX
sudo systemctl start nginx

# Generar URL de NGROK y desplegarla
ngrok_url=$(ngrok http 80 | grep -oE "http://[a-z0-9\.]+.ngrok.io")
echo "La URL de NGROK es: $ngrok_url"

# Mantener el script en espera hasta que se interrumpa manualmente (Ctrl+C)
echo "Presiona Ctrl+C para salir y detener NGROK"
trap "killall ngrok" INT
sleep infinity
