#!/bin/bash
# Integrantes: Camilo Castano-Sofia Gil
# Se debe entregar un path ej: /etc
path=$1
while true; do
    echo "Menu"
    echo "1. Ordenar por caracteristicas"
    echo "2. Ordenar por condiciones"
    echo "3. Finalizar"
    read -p "Ingresa tu opcion: " valor
    case $valor in
        1)
            echo "1. Ordenar archivos por mas reciente"
            echo "2. Ordenar archivos por mas antiguo"
            echo "3. Ordenar archivos de mayor a menor tamano"
            echo "4. Ordenar archivos de menor a mayor tamano"
            echo "5. Ordenar archivos por tipo"
            read -p "Ingresa tu opcion: " submenu
            case $submenu in
                1)
                    clear
                    ls -l --time=atime $path | less
                    ;;
                2)
                    clear
                    ls -ltr --time=atime $path | less
                    ;;
                3)
                    clear
                    ls -lS $path | less
                    ;;
                4)
                    clear
                    ls -ltrS $path | less
                    ;;
                5)
                    ls -lX $path | less
                    ;;
            esac
            ;;
        2)
            echo "1. Mostrar archivos que inicien con una cadena dada"
            echo "2. Mostrar archivos que terminen con una cadena dada"
            echo "3. Mostrar archivos que contengan una cadena dada"
            read -p "Ingresa tu opcion: " submenu2
            case $submenu2 in
                1)
                    clear
                    read -p "Ingrese la cadena:" cadena
                    ls $path/$cadena* 
                    ;;
                2)
                    clear
                    read -p "Ingrese la cadena:" cadena
                    ls $path/*$cadena 
                    ;;
                3)
                    clear
                    read -p "Ingrese la cadena:" cadena
                    ls $path/*$cadena* 
                    ;;
            esac
            ;;
        3)
            break
            ;;
    esac
done