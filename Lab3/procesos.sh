#!/bin/bash
# Integrantes: Camilo Castano-Sofia Gil
# Script que ejecuta un menu con opciones para los procesos en el sistema (Slackware).
clear

while true; do
    echo "==================== MENU ===================="
    echo "1. Ver los procesos que estan corriendo."
    echo "2. Buscar un proceso."
    echo "3. Finalizar un proceso."
    echo "4. Reiniciar el menu."
    echo "5. Finalizar el menu."
    echo "==============================================="
    read -p "Ingresa tu opcion: " valor

    case $valor in
        1)
            # Lista los procesos por ID, %CPU, %Mem, COMMAND
            echo "Proceso(s) ejecutandose:"
            ps aux | awk '{print $2, "  ", $3 "  ", $4 "  ", $11}' | less
        ;;
        2)
            read -p "Nombre del proceso: " psnombre
            echo "Proceso(s) encontrado(s):"
            ps aux | grep "$psnombre"
        ;;
        3)
            read -p "Nombre del proceso: " psnombre
            pkill "$psnombre"
            echo "Proceso(s) con nombre '$psnombre' finalizado(s)."
        ;;
        4)
            echo "Reiniciando el menu."
            break
        ;;
        5)
            echo "Saliendo del menu."
            exit 0
        ;;
        *)
            echo "Opcion no valida."
        ;;
    esac
done


