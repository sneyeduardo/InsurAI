from django.db import models
from django.utils import timezone # pyright: ignore[reportUnusedImport]

# ==========================================
# 1. CATÁLOGOS (Tablas de referencia)
# ==========================================

class CatCiudades(models.Model):
    id_ciudad = models.AutoField(primary_key=True)
    id_estado = models.ForeignKey('CatEstados', models.DO_NOTHING, db_column='id_estado')
    nombre = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'cat_ciudades'


class CatEstados(models.Model):
    id_estado = models.AutoField(primary_key=True)
    id_pais = models.ForeignKey('CatPaises', models.DO_NOTHING, db_column='id_pais')
    nombre = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'cat_estados'


class CatEstatusPoliza(models.Model):
    id_estatus = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cat_estatus_poliza'


class CatEstatusSiniestro(models.Model):
    id_estatus = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'cat_estatus_siniestro'


class CatMarcas(models.Model):
    id_marca = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'cat_marcas'


class CatMetodosPago(models.Model):
    id_metodo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100, blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cat_metodos_pago'


class CatModelos(models.Model):
    id_modelo = models.AutoField(primary_key=True)
    id_marca = models.ForeignKey(CatMarcas, models.DO_NOTHING, db_column='id_marca')
    nombre = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'cat_modelos'


class CatMonedas(models.Model):
    id_moneda = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    codigo = models.CharField(max_length=5, blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cat_monedas'


class CatPaises(models.Model):
    id_pais = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    codigo_iso = models.CharField(max_length=3, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cat_paises'


class Clientes(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    tipo_cliente = models.CharField(max_length=13)
    tipo_documento = models.CharField(max_length=3)
    numero_documento = models.CharField(max_length=20)
    nombres = models.CharField(max_length=100)
    apellidos = models.CharField(max_length=100, blank=True, null=True)
    telefono_movil = models.CharField(max_length=20, blank=True, null=True)
    telefono_fijo = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=100)
    direccion = models.TextField(blank=True, null=True)
    id_ciudad = models.ForeignKey(CatCiudades, models.DO_NOTHING, db_column='id_ciudad', blank=True, null=True)
    profesion_oficio = models.CharField(max_length=100, blank=True, null=True)
    fecha_nacimiento = models.DateField(blank=True, null=True)
    sexo = models.CharField(max_length=1, blank=True, null=True)
    fecha_registro = models.DateTimeField(blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clientes'
        unique_together = (('tipo_documento', 'numero_documento'),)


class Cobranzas(models.Model):
    id_cobranza = models.AutoField(primary_key=True)
    id_recibo = models.ForeignKey('RecibosPrimas', models.DO_NOTHING, db_column='id_recibo')
    fecha_pago = models.DateField()
    monto_pagado = models.DecimalField(max_digits=15, decimal_places=2)
    referencia = models.CharField(max_length=50)
    banco_origen = models.CharField(max_length=50, blank=True, null=True)
    forma_pago = models.CharField(max_length=13)
    estatus = models.CharField(max_length=13, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cobranzas'


class CompaniasSeguros(models.Model):
    id_compania = models.AutoField(primary_key=True)
    rif = models.CharField(unique=True, max_length=20)
    nombre = models.CharField(max_length=100)
    direccion = models.TextField(blank=True, null=True)
    telefono_contacto = models.CharField(max_length=20, blank=True, null=True)
    persona_contacto = models.CharField(max_length=100, blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'companias_seguros'


class ConfigComisiones(models.Model):
    id_config = models.AutoField(primary_key=True)
    id_compania = models.ForeignKey(CompaniasSeguros, models.DO_NOTHING, db_column='id_compania')
    id_ramo = models.ForeignKey('Ramos', models.DO_NOTHING, db_column='id_ramo')
    porcentaje_comision = models.DecimalField(max_digits=5, decimal_places=2)
    fecha_acuerdo = models.DateField(blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'config_comisiones'


class Cotizaciones(models.Model):
    id_cotizacion = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(Clientes, models.DO_NOTHING, db_column='id_cliente')
    id_ramo = models.ForeignKey('Ramos', models.DO_NOTHING, db_column='id_ramo')
    fecha_solicitud = models.DateTimeField(blank=True, null=True)
    vigencia_hasta = models.DateField()
    observaciones = models.TextField(blank=True, null=True)
    estatus = models.CharField(max_length=9, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cotizaciones'


class DetalleCotizacion(models.Model):
    id_detalle = models.AutoField(primary_key=True)
    id_cotizacion = models.ForeignKey(Cotizaciones, models.DO_NOTHING, db_column='id_cotizacion')
    id_compania = models.ForeignKey(CompaniasSeguros, models.DO_NOTHING, db_column='id_compania')
    id_producto = models.ForeignKey('Productos', models.DO_NOTHING, db_column='id_producto')
    suma_asegurada = models.DecimalField(max_digits=15, decimal_places=2)
    prima_anual = models.DecimalField(max_digits=15, decimal_places=2)
    deducible = models.CharField(max_length=100, blank=True, null=True)
    seleccionada = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'detalle_cotizacion'


class Financiadoras(models.Model):
    id_financiadora = models.AutoField(primary_key=True)
    rif = models.CharField(unique=True, max_length=20)
    nombre = models.CharField(max_length=100)
    tasa_interes = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'financiadoras'


class IngresosComisiones(models.Model):
    id_ingreso = models.AutoField(primary_key=True)
    id_poliza = models.ForeignKey('Polizas', models.DO_NOTHING, db_column='id_poliza')
    id_recibo = models.ForeignKey('RecibosPrimas', models.DO_NOTHING, db_column='id_recibo')
    monto_comision_recibida = models.DecimalField(max_digits=15, decimal_places=2)
    fecha_cobro_comision = models.DateTimeField(blank=True, null=True)
    numero_referencia_pago = models.CharField(max_length=100, blank=True, null=True)
    estatus_conciliacion = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ingresos_comisiones'


class Intermediarios(models.Model):
    id_intermediario = models.AutoField(primary_key=True)
    nombre_completo = models.CharField(max_length=150)
    codigo_sudeaseg = models.CharField(max_length=50, blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'intermediarios'

class PerfilUsuario(models.Model):
    id_perfil = models.AutoField(primary_key=True)
    nombre_perfil = models.CharField(max_length=50, unique=True, help_text='Ej: Administrador, Corredor, Analista')
    descripcion = models.CharField(max_length=255, null=True, blank=True)
    estatus = models.BooleanField(default=True, help_text='True = Activo, False = Inactivo')
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'perfiles_usuario'
        
class Polizas(models.Model):
    id_poliza = models.AutoField(primary_key=True)
    numero_poliza = models.CharField(max_length=50)
    id_cliente = models.ForeignKey(Clientes, models.DO_NOTHING, db_column='id_cliente')
    id_vehiculo = models.ForeignKey('Vehiculos', models.DO_NOTHING, db_column='id_vehiculo', blank=True, null=True)
    id_compania = models.ForeignKey(CompaniasSeguros, models.DO_NOTHING, db_column='id_compania')
    id_ramo = models.IntegerField()
    id_intermediario = models.IntegerField(blank=True, null=True)
    id_producto = models.ForeignKey('Productos', models.DO_NOTHING, db_column='id_producto')
    id_estatus = models.ForeignKey(CatEstatusPoliza, models.DO_NOTHING, db_column='id_estatus')
    id_moneda = models.ForeignKey(CatMonedas, models.DO_NOTHING, db_column='id_moneda')
    suma_asegurada = models.DecimalField(max_digits=15, decimal_places=2)
    prima_neta = models.DecimalField(max_digits=15, decimal_places=2)
    fecha_emision = models.DateField()
    fecha_fin = models.DateField()
    vigencia_desde = models.DateField()
    vigencia_hasta = models.DateField()
    fecha_registro = models.DateTimeField(blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'polizas'


class Productos(models.Model):
    id_producto = models.AutoField(primary_key=True)
    id_ramo = models.ForeignKey('Ramos', models.DO_NOTHING, db_column='id_ramo')
    nombre_producto = models.CharField(max_length=100)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'productos'


class Ramos(models.Model):
    id_ramo = models.AutoField(primary_key=True)
    nombre_ramo = models.CharField(max_length=100)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ramos'


class RecibosPrimas(models.Model):
    id_recibo = models.AutoField(primary_key=True)
    id_poliza = models.ForeignKey(Polizas, models.DO_NOTHING, db_column='id_poliza')
    monto_cuota = models.DecimalField(max_digits=15, decimal_places=2)
    fecha_vencimiento = models.DateField()
    estatus_cobro = models.CharField(max_length=9, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'recibos_primas'


class Roles(models.Model):
    id_rol = models.AutoField(primary_key=True)
    nombre_rol = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=255, blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'roles'


class Siniestros(models.Model):
    id_siniestro = models.AutoField(primary_key=True)
    numero_siniestro = models.CharField(max_length=50)
    id_poliza = models.ForeignKey(Polizas, models.DO_NOTHING, db_column='id_poliza')
    id_estatus = models.ForeignKey(CatEstatusSiniestro, models.DO_NOTHING, db_column='id_estatus')
    fecha_ocurrencia = models.DateTimeField()
    fecha_notificacion = models.DateTimeField(blank=True, null=True)
    descripcion_evento = models.TextField()
    lugar_evento = models.CharField(max_length=200, blank=True, null=True)
    monto_estimado = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    monto_aprobado = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    nombre_contacto_emergencia = models.CharField(max_length=100, blank=True, null=True)
    telefono_contacto_emergencia = models.CharField(max_length=20, blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'siniestros'


class Suscripciones(models.Model):
    id_suscripcion = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(Clientes, models.DO_NOTHING, db_column='id_cliente')
    id_vehiculo = models.IntegerField(blank=True, null=True)
    fecha_solicitud = models.DateTimeField(blank=True, null=True)
    id_analista = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='id_analista')
    estatus_suscripcion = models.CharField(max_length=19, blank=True, null=True)
    observaciones_tecnicas = models.TextField(blank=True, null=True)
    monto_inspeccion = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'suscripciones'


class Usuarios(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    id_rol = models.ForeignKey(Roles, models.DO_NOTHING, db_column='id_rol')
    username = models.CharField(unique=True, max_length=50)
    password_hash = models.CharField(max_length=255)
    email = models.CharField(unique=True, max_length=100)
    nombre_completo = models.CharField(max_length=100)
    ultimo_login = models.DateTimeField(blank=True, null=True)
    intentos_fallidos = models.IntegerField(blank=True, null=True)
    bloqueado = models.IntegerField(blank=True, null=True)
    reset_token = models.CharField(max_length=100, blank=True, null=True)
    fecha_creacion = models.DateTimeField(blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'usuarios'


class Vehiculos(models.Model):
    id_vehiculo = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(Clientes, models.DO_NOTHING, db_column='id_cliente')
    id_modelo = models.ForeignKey(CatModelos, models.DO_NOTHING, db_column='id_modelo')
    anio = models.IntegerField()
    placa = models.CharField(unique=True, max_length=20)
    serial_motor = models.CharField(max_length=50)
    serial_carroceria = models.CharField(max_length=50)
    color = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'vehiculos'
