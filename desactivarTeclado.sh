#!/bin/bash

# Ruta al archivo authorized
AUTHORIZED_FILE="/sys/bus/usb/devices/1-9/authorized"

# Verifica si el archivo existe
if [ ! -f "$AUTHORIZED_FILE" ]; then
    echo "Error: El archivo $AUTHORIZED_FILE no existe."
    exit 1
fi

# Verifica el valor actual del archivo
CURRENT_VALUE=$(cat "$AUTHORIZED_FILE")

# Alterna entre 0 y 1
if [ "$CURRENT_VALUE" -eq 0 ]; then
    NEW_VALUE=1
else
    NEW_VALUE=0
fi

# Cambia el valor
echo "$NEW_VALUE" | sudo tee "$AUTHORIZED_FILE"

# Confirmación
echo "El valor del archivo authorized se ha cambiado a $NEW_VALUE"

