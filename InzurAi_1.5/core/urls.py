# core/urls.py
from django.urls import path
from . import views

urlpatterns = [
    # Autenticación
    path('', views.login_view, name='login'),
    path('dashboard/', views.dashboard_view, name='dashboard'),
    path('logout/', views.logout_view, name='logout'),

    # Clientes (HU-011)
    path('clientes/registrar/', views.registrar_cliente_view, name='registrar_cliente'),
    path('clientes/listar/', views.usuarios_view, name='usuarios'), # Ajustado a tu snippet

    # Pólizas (HU-014)
    path('polizas/registrar/', views.registrar_poliza_view, name='registrar_poliza'),

    # Rutas para el Módulo de Administración
    path('usuarios/', views.usuarios_view, name='usuarios'),
    path('perfiles/', views.perfiles_view, name='perfiles'),

    path('usuarios/', views.usuarios_view, name='usuarios'),
    path('usuarios/nuevo/', views.crear_usuario_view, name='crear_usuario'),
    path('usuarios/editar/<str:cedula>/', views.crear_usuario_view, name='editar_usuario'),

    # Rutas para Perfiles
    path('perfiles/', views.perfiles_view, name='perfiles'),
    path('perfiles/nuevo/', views.crear_perfil_view, name='crear_perfil'),
    path('perfiles/editar/<int:id>/', views.crear_perfil_view, name='editar_perfil'),

    path('api/zybanna/', views.api_zybanna, name='api_zybanna'),
]