from django.urls import path
from . import views

# Esto le da un "apellido" a tus rutas para que no choquen con otras


urlpatterns = [
    path('dashboard/', views.dashboard_view, name='dashboard'),
    path('perfiles/crear/', views.crear_perfiles_view, name='crear_perfiles'),
    path('perfiles/crear/', views.crear_perfiles_view, name='crear_perfiles'), # La tabla/lista
    path('perfiles/nuevo/', views.perfil_nuevo_view, name='perfil_nuevo'),
    path('administracion/perfiles/', views.perfiles_view, name='perfiles'),
]
