from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import Polizas, Clientes, Siniestros

@login_required
def dashboard_view(request):
    # Contamos los datos de tu base de datos MySQL
    total_polizas = Polizas.objects.filter(activo=True).count()
    total_clientes = Clientes.objects.count()
    siniestros_pendientes = Siniestros.objects.filter(id_estatus__nombre='Pendiente').count()
    
    context = {
        'total_polizas': total_polizas,
        'total_clientes': total_clientes,
        'siniestros_pendientes': siniestros_pendientes,
    }
    return render(request, 'dashboard.html', context)

@login_required
def crear_perfiles_view(request):
    # Esta vista solo muestra el formulario de perfiles
    return render(request, 'crear_perfiles.html')
@login_required
def perfil_nuevo_view(request):
    # Esta vista carga tu nuevo archivo perfil_nuevo.html
    return render(request, 'perfil_nuevo.html')
@login_required
def perfiles_view(request):
    # Esta vista carga tu nuevo archivo perfil_nuevo.html
    return render(request, 'perfiles.html')