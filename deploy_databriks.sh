#!/bin/bash

# Solicitar al usuario la carpeta relativa local
read -p "Introduce la ruta relativa local de la carpeta a sincronizar: " local_path

# Solicitar al usuario la ruta de destino en Databricks (por ejemplo, dbfs:/FileStore/mi_proyecto/)
read -p "Introduce la ruta de destino en Databricks (ej: dbfs:/FileStore/mi_proyecto/): " databricks_path

# Verificar si la carpeta local existe
if [ ! -d "$local_path" ]; then
  echo "Error: La carpeta local '$local_path' no existe."
  exit 1
fi

# Ejecutar el comando databricks workspace cp para sincronizar el directorio
echo "Sincronizando la carpeta local '$local_path' con la ruta de Databricks '$databricks_path'..."
databricks workspace cp --recursive --overwrite "$local_path" "$databrick_path"

# Verificar el código de salida del comando databricks
if [ $? -eq 0 ]; then
  echo "Sincronización completada exitosamente."
else
  echo "Error durante la sincronización. Por favor, revisa la salida del comando databricks."
fi

exit 0