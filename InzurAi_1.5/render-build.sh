#!/usr/bin/env bash
# Salir inmediatamente si un comando falla
set -o errexit

# Instalar dependencias
pip install -r requirements.txt

# Reunir archivos estáticos (CSS, JS, Imágenes)
python manage.py collectstatic --no-input

# Ejecutar migraciones de la base de datos
python manage.py migrate