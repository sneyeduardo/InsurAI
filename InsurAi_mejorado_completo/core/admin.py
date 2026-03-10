from django.contrib import admin
from .models import PerfilUsuario
from .models import ( # pyright: ignore[reportMissingImports]
    CatPaises, CatEstados, CatCiudades, CatEstatusPoliza, CatEstatusSiniestro, # pyright: ignore[reportUnknownVariableType]
    CatMarcas, CatModelos, CatMetodosPago, CatMonedas, # pyright: ignore[reportUnknownVariableType]
    Clientes, CompaniasSeguros, Intermediarios, Financiadoras, # pyright: ignore[reportUnknownVariableType]
    Ramos, Productos, Vehiculos, Polizas, RecibosPrimas, Siniestros, # pyright: ignore[reportUnknownVariableType]
    Roles, Usuarios # pyright: ignore[reportUnknownVariableType]
)

# ==========================================
# 1. CATÁLOGOS (Registro simple)
# ==========================================
admin.site.register(CatPaises) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(CatEstados) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(CatCiudades) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(CatEstatusPoliza) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(CatEstatusSiniestro) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(CatMarcas) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(CatModelos) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(CatMetodosPago) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(CatMonedas) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(Ramos) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(Productos) # pyright: ignore[reportUnknownArgumentType]
admin.site.register(Roles) # pyright: ignore[reportUnknownArgumentType]

# ==========================================
# 2. ACTORES PRINCIPALES
# ==========================================

@admin.register(Clientes) # pyright: ignore[reportUnknownArgumentType]
class ClientesAdmin(admin.ModelAdmin): # pyright: ignore[reportMissingTypeArgument]
    # Columnas que se verán en la tabla principal
    list_display = ('nombres', 'apellidos', 'tipo_documento', 'numero_documento', 'email', 'activo')
    # Barra de búsqueda
    search_fields = ('nombres', 'apellidos', 'numero_documento', 'email')
    # Filtros laterales
    list_filter = ('tipo_cliente', 'activo', 'sexo')

@admin.register(CompaniasSeguros) # pyright: ignore[reportUnknownArgumentType]
class CompaniasSegurosAdmin(admin.ModelAdmin): # pyright: ignore[reportMissingTypeArgument]
    list_display = ('nombre', 'rif', 'telefono_contacto', 'activo')
    search_fields = ('nombre', 'rif')

@admin.register(Intermediarios) # pyright: ignore[reportUnknownArgumentType]
class IntermediariosAdmin(admin.ModelAdmin): # pyright: ignore[reportMissingTypeArgument]
    list_display = ('nombre_completo', 'codigo_sudeaseg', 'activo')

@admin.register(Financiadoras) # pyright: ignore[reportUnknownArgumentType]
class FinanciadorasAdmin(admin.ModelAdmin): # pyright: ignore[reportMissingTypeArgument]
    list_display = ('nombre', 'rif', 'tasa_interes', 'activo')

# ==========================================
# 3. CORE DEL NEGOCIO
# ==========================================

@admin.register(Vehiculos) # pyright: ignore[reportUnknownArgumentType]
class VehiculosAdmin(admin.ModelAdmin): # pyright: ignore[reportMissingTypeArgument]
    list_display = ('placa', 'id_cliente', 'id_modelo', 'anio', 'color')
    search_fields = ('placa', 'serial_motor', 'serial_carroceria', 'id_cliente__nombres')
    list_filter = ('anio',)

@admin.register(Polizas) # pyright: ignore[reportUnknownArgumentType]
class PolizasAdmin(admin.ModelAdmin): # pyright: ignore[reportMissingTypeArgument]
    list_display = ('numero_poliza', 'id_cliente', 'id_compania', 'id_ramo', 'vigencia_hasta', 'id_estatus')
    search_fields = ('numero_poliza', 'id_cliente__nombres', 'id_cliente__numero_documento')
    list_filter = ('id_estatus', 'id_compania', 'id_ramo')
    # Jerarquía por fechas para navegar fácilmente
    date_hierarchy = 'fecha_emision'

@admin.register(RecibosPrimas) # pyright: ignore[reportUnknownArgumentType]
class RecibosPrimasAdmin(admin.ModelAdmin): # pyright: ignore[reportMissingTypeArgument]
    list_display = ('id_recibo', 'id_poliza', 'monto_cuota', 'fecha_vencimiento', 'estatus_cobro')
    list_filter = ('estatus_cobro', 'fecha_vencimiento')
    search_fields = ('id_poliza__numero_poliza',)

@admin.register(Siniestros) # pyright: ignore[reportUnknownArgumentType]
class SiniestrosAdmin(admin.ModelAdmin): # pyright: ignore[reportMissingTypeArgument]
    list_display = ('numero_siniestro', 'id_poliza', 'fecha_ocurrencia', 'monto_estimado', 'id_estatus')
    search_fields = ('numero_siniestro', 'id_poliza__numero_poliza')
    list_filter = ('id_estatus',)

@admin.register(Usuarios) # pyright: ignore[reportUnknownArgumentType]
class UsuariosAdmin(admin.ModelAdmin): # pyright: ignore[reportMissingTypeArgument]
    list_display = ('username', 'nombre_completo', 'id_rol', 'email', 'activo')
    search_fields = ('username', 'nombre_completo', 'email')
    list_filter = ('id_rol', 'activo', 'bloqueado')
    # Evitar que la contraseña encriptada se muestre a simple vista
    exclude = ('password_hash', 'reset_token')
    
@admin.register(PerfilUsuario)
class PerfilUsuarioAdmin(admin.ModelAdmin):
    list_display = ('id_perfil', 'nombre_perfil', 'estatus', 'fecha_creacion')
    search_fields = ('nombre_perfil',)
    list_filter = ('estatus',)