#!/bin/bash
# Integrantes: Camilo Castano-Sofia Gil
# Se debe ingresar el numero n ej: 1
clear
cant=$1

while true; do
    echo "Menu"
    echo "1. Mostrar las $cant primeras y ultimas lineas de los archivos de log"
    echo "2. Mostrar las $cant lineas de los archivos de log que contengan una palabra"
    echo "3. Finalizar"
    read -p "Ingresa tu opcion: " valor

    case $valor in
        1)
            for log_file in /var/log/messages /var/log/syslog /var/log/maillog; do
                echo "Del log $log_file las primeras $cant lineas son"
                less "$log_file" | head -n "$cant"
                echo "Del log $log_file las ultimas $cant lineas son"
                less "$log_file" | tail -n "$cant"
            done
            ;;
        2)
            read -p "Ingresa la palabra: " word
            for log_file in /var/log/messages /var/log/syslog /var/log/maillog; do
                echo "Del log $log_file con la palabra ('$word') en las primeras $cant lineas son"
                less "$log_file" | head -n "$cant" | grep "$word"
                echo "Del log $log_file con la palabra ('$word') en las ultimas $cant lineas son"
                less "$log_file" | tail -n "$cant" | grep "$word"
            done
            ;;
        3)
            break
            ;;
        *)
            echo "Opcion no valida. Intentalo de nuevo."
            ;;
    esac
done
