#!/bin/bash

# Script para instalar y configurar la CLI de Databricks

echo "Iniciando la instalación y configuración de la CLI de Databricks..."

# Paso 2: Instalar la CLI de Databricks
echo "Instalando la CLI de Databricks..."
pip install --upgrade databricks-cli

if [ $? -eq 0 ]; then
    echo "La CLI de Databricks se instaló correctamente."
else
    echo "Error al instalar la CLI de Databricks. Por favor, revisa los mensajes de error anteriores."
    exit 1
fi

# Paso 3: Configurar la CLI de Databricks
echo "Iniciando la configuración de la CLI de Databricks..."
echo "Necesitarás la URL de tu espacio de trabajo de Databricks y un token de acceso personal."
echo "Puedes encontrar la URL de tu espacio de trabajo en la barra de direcciones de tu navegador."
echo "Para generar un token de acceso personal en Databricks:"
echo "1. Ve a tu espacio de trabajo de Databricks."
echo "2. Haz clic en tu nombre de usuario en la esquina superior derecha."
echo "3. Selecciona 'User Settings'."
echo "4. Ve a la pestaña 'Access Tokens'."
echo "5. Haz clic en 'Generate New Token'."
echo "6. Introduce una descripción (opcional) y la duración del token."
echo "7. Haz clic en 'Generate'."
echo "8. Copia el token generado. ¡Esta será la única vez que se muestre!"

read -p "Introduce la URL de tu espacio de trabajo de Databricks (ej: https://adb-xxxxxxxxxxxxxxx.azuredatabricks.net): " databricks_host
read -s -p "Introduce tu token de acceso personal de Databricks: " databricks_token
echo  # Añadir una nueva línea después de la entrada oculta del token

# Configurar el perfil predeterminado
echo "Configurando el perfil predeterminado..."
databricks configure --host "$databricks_host" --token "$databricks_token"

if [ $? -eq 0 ]; then
    echo "La CLI de Databricks se configuró correctamente con el perfil predeterminado."
else
    echo "Error al configurar la CLI de Databricks. Por favor, revisa los mensajes de error anteriores."
    exit 1
fi

echo "¡La CLI de Databricks está instalada y configurada!"
echo "Puedes probarla ejecutando el comando: databricks --version"

exit 0