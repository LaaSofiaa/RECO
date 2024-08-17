#!/bin/bash
# Integrantes: Camilo Castano-Sofia Gil
# Script para configurar una tarea que se ejecuta periodicamente en el sistema

# Verificar si se proporcionaron suficientes parametros
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <nombre_tarea> <periodicidad_en_minutos>"
    exit 1
fi

nombre_tarea="$1" # Path del script
periodicidad="$2" # Dada en minutos

# Configurar la tarea en crontab
echo "$periodicidad * * * * $nombre_tarea" | crontab -

# Verificar si la configuracion se realizo correctamente
if [ $? -eq 0 ]; then
    echo "Tarea configurada con exito."
else
    echo "Error al configurar la tarea en crontab."
fi

