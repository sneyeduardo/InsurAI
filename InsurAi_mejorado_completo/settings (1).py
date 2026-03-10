import os
from pathlib import Path

INSTALLED_APPS = [
    # ... aplicaciones de django
    'rest_framework',
    'tu_app', # La app donde pusiste tus modelos
]
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'core',  # <-- Tu nueva aplicación
]

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],  # <-- Aquí es donde Django buscará tus HTML
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
# Configuración de la base de datos MySQL
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'sistema_corretaje',  # Pon el nombre exacto del esquema que creaste
        'USER': 'root',                          # Tu usuario de MySQL
        'PASSWORD': 'a-32001919',                          # Tu contraseña (déjalo vacío si no usas)
        'HOST': 'localhost',                     # o '127.0.0.1'
        'PORT': '3306',                          # El puerto estándar de MySQL
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        }
    }
}
