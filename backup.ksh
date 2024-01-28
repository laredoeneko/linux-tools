#!/bin/bash

# Ruta del directorio a respaldar
SOURCE_DIR="/home"

# Ruta del directorio de destino para el backup
DEST_DIR="/ruta/del/directorio/de/backup"

# Nombre del archivo de backup
BACKUP_FILE="backup_$(date +\%Y\%m\%d).tar.gz"

# Crear un backup completo los sábados y backups incrementales los demás días
if [ "$(date +%u)" -eq 6 ]; then
    tar -czvf "$DEST_DIR/$BACKUP_FILE" "$SOURCE_DIR"
else
    tar -czvf "$DEST_DIR/incremental_backup_$(date +\%Y\%m\%d).tar.gz" --directory="$SOURCE_DIR" --listed-incremental="$DEST_DIR/incremental.snar" .
fi
