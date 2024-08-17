#!/bin/bash
# Integrantes: Camilo Castano-Sofia Gil
# Creacion del usuario
nombre=$1          # Se da el nombre 
grupo=$2           # Se da el nombre del grupo 
descripcion=$3     # Descripcion entre comillas 
directorio=$4      # El directorio se da desde la raiz ej: /home
shell=$5           # El shell se da desde la raiz ej: /bin/bash
permiso_usuario=$6 # Permisos para el usuario
permiso_grupo=$7   # Permisos para el grupo
permiso_otros=$8   # Permisos para otros

# Verificar si el shell existe en /etc/shells
if grep -q "$shell" /etc/shells; then
    # Crear usuario
    useradd -m -d "$directorio/$nombre" -g "$grupo" -c "$descripcion" -s "$shell" "$nombre"
    
    # Asignar permisos al directorio del usuario
    chmod "$permiso_usuario$permiso_grupo$permiso_otros" "$directorio/$nombre"
    
    # Establecer la contrasena para el usuario
    passwd "$nombre"
    
    clear
    
    # Verificar si el usuario se creo exitosamente
    if id "$nombre" &>/dev/null; then
        echo "Usuario $nombre creado exitosamente."
    else
        echo "No se pudo crear el usuario $nombre."
    fi
else
    clear
    echo "El shell $shell no existe o no esta instalado, no se puede crear el usuario."
fi
