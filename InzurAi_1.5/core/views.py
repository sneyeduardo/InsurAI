# core/views.py
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.hashers import check_password
from .models import Usuarios, Polizas, Clientes, Siniestros
from functools import wraps
from .models import Usuarios, Roles
from django.shortcuts import render, redirect, get_object_or_404
import requests
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json



# Decorador de seguridad que ya tienes
def requiere_autenticacion(view_func):
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        if 'usuario_id' not in request.session:
            return redirect('login')
        return view_func(request, *args, **kwargs)
    return _wrapped_view

# --- VISTA DE LOGIN ---
# views.py

# views.py

def login_view(request):
    if 'usuario_id' in request.session:
        return redirect('dashboard')

    if request.method == 'POST':
        cedula_input = request.POST.get('cedula', '').strip().upper()
        password_input = request.POST.get('password', '')

        # Normalización para el formato de tu BD (V-32001919)
        if cedula_input.isdigit():
            cedula_busqueda = f"V-{cedula_input}"
        else:
            cedula_busqueda = cedula_input

        try:
            usuario = Usuarios.objects.get(cedula=cedula_busqueda)
            
            # Validación de bloqueo (campo 'bloqueado' en tu modelo)
            if usuario.bloqueado == 1:
                messages.error(request, "Tu cuenta está bloqueada.")
                return render(request, 'login.html')

            # Validación de contraseña usando 'password_hash'
            if password_input == usuario.password_hash or check_password(password_input, usuario.password_hash):
                
                # Datos de sesión usando los nombres reales de tu models.py
                request.session['usuario_id'] = usuario.cedula
                request.session['usuario_nombre'] = usuario.nombre_completo
                
                # ¡CORRECCIÓN FINAL! Usamos 'nombre_rol'
                if usuario.id_rol:
                    request.session['usuario_rol'] = usuario.id_rol.nombre_rol
                else:
                    request.session['usuario_rol'] = "Usuario"
                
                return redirect('dashboard')
            else:
                messages.error(request, "La contraseña es incorrecta.")
                
        except Usuarios.DoesNotExist:
            messages.error(request, f"La cédula '{cedula_busqueda}' no existe.")
            
    return render(request, 'login.html')

# --- VISTA DEL DASHBOARD ---
@requiere_autenticacion
def dashboard_view(request):
    # Consultamos datos reales para las tarjetas de InzurAi+
    context = {
        'total_polizas': Polizas.objects.count(),
        'total_clientes': Clientes.objects.count(),
        'siniestros_pendientes': Siniestros.objects.count(), 
        
        # EL CAMBIO ESTÁ AQUÍ: Usamos '-fecha_registro' que sí existe en tu modelo Polizas
        'ultimas_polizas': Polizas.objects.order_by('-fecha_registro')[:5], 
    }
    return render(request, 'dashboard.html', context)
# --- VISTA DE LOGOUT (La que faltaba) ---
def logout_view(request):
    request.session.flush() # Limpia toda la sesión
    return redirect('login')

# --- VISTAS DE REGISTRO (Esqueletos) ---
@requiere_autenticacion
def registrar_cliente_view(request):
    if request.method == 'POST':
        # Aquí irá la lógica para guardar en el modelo Clientes
        pass
    return render(request, 'registrar_cliente.html')

@requiere_autenticacion
def registrar_poliza_view(request):
    if request.method == 'POST':
        # Aquí irá la lógica para guardar en el modelo Polizas
        pass
    return render(request, 'registrar_poliza.html')
# --- VISTAS DE USUARIOS / CLIENTES ---
@requiere_autenticacion
def usuarios_view(request):
    # Consultamos todos los usuarios registrados, ordenados por su cédula (Primary Key)
    lista_usuarios = Usuarios.objects.all().order_by('-cedula')
    
    context = {
        'usuarios': lista_usuarios
    }
    return render(request, 'usuarios.html', context)

# Esqueleto para la vista de crear/editar que también tienes en tus urls.py
@requiere_autenticacion
def vista_crear_editar_usuario(request, cedula=None):
    if request.method == 'POST':
        # Lógica para guardar o editar
        pass
    return render(request, 'crear_usuario.html')

def usuarios_view(request):
    if 'usuario_id' not in request.session:
        return redirect('login')
    # Traemos todos los usuarios usando tu modelo
    usuarios = Usuarios.objects.all()
    return render(request, 'usuarios.html', {'usuarios': usuarios})

def perfiles_view(request):
    if 'usuario_id' not in request.session:
        return redirect('login')
    # Traemos todos los roles/perfiles
    roles = Roles.objects.all()
    return render(request, 'perfiles.html', {'roles': roles})

def crear_perfil_view(request, id=None):
    if 'usuario_id' not in request.session:
        return redirect('login')
    
    perfil = None
    if id:
        perfil = get_object_or_404(Roles, id_rol=id)

    if request.method == 'POST':
        nombre = request.POST.get('nombre_rol')
        descripcion = request.POST.get('descripcion')
        estatus = request.POST.get('estatus')

        if id:
            perfil.nombre_rol = nombre
            perfil.descripcion = descripcion
            perfil.estatus = estatus
            perfil.save()
            messages.success(request, "Perfil actualizado con éxito.")
        else:
            Roles.objects.create(nombre_rol=nombre, descripcion=descripcion, estatus=estatus)
            messages.success(request, "Perfil creado con éxito.")
        
        return redirect('perfiles')

    return render(request, 'crear_perfil.html', {'perfil': perfil})

# VISTA PARA USUARIOS
def crear_usuario_view(request, cedula=None):
    if 'usuario_id' not in request.session:
        return redirect('login')
    
    usuario = None
    if cedula:
        usuario = get_object_or_404(Usuarios, cedula=cedula)
    
    roles = Roles.objects.filter(estatus='Activo')

    if request.method == 'POST':
        # Aquí capturarías todos los campos (Nombre, Email, etc.)
        # y guardarías usando Usuarios.objects.create() o usuario.save()
        messages.success(request, "Datos procesados correctamente.")
        return redirect('usuarios')

    return render(request, 'crear_usuario.html', {'usuario': usuario, 'roles': roles})

@csrf_exempt
def api_zybanna(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        mensaje_usuario = data.get('mensaje')

        # AQUÍ PEGA LA URL QUE TE DIO EL NODO WEBHOOK EN N8N
        N8N_WEBHOOK_URL = "http://localhost:5678/webhook-test/18f13f67-841c-4e9c-b920-157dbca64c8a"

        try:
            response = requests.post(N8N_WEBHOOK_URL, json={"chatInput": mensaje_usuario})
            respuesta_ia = response.json()
            
            # Devolvemos la respuesta de la IA a nuestro frontend
            return JsonResponse({"respuesta": respuesta_ia.get('output', 'Lo siento, no pude procesar eso.')})
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)
    
    return JsonResponse({"error": "Método no permitido"}, status=405)