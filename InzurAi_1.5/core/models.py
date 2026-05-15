# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class ActividadesEconomicas(models.Model):
    id_actividad = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100) # <--- Cambiado a 100

    class Meta:
        managed = False
        db_table = 'actividades_economicas'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Bancos(models.Model):
    id_banco = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100) # <--- Asegúrate de que diga 100

    class Meta:
        managed = False
        db_table = 'bancos'


class CatCiudades(models.Model):
    id_ciudad = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    id_estado = models.ForeignKey('CatEstados', models.DO_NOTHING, db_column='id_estado')

    class Meta:
        managed = False
        db_table = 'cat_ciudades'


class CatEstados(models.Model):
    id_estado = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    id_pais = models.ForeignKey('CatPaises', models.DO_NOTHING, db_column='id_pais')

    class Meta:
        managed = False
        db_table = 'cat_estados'


class CatEstatusPoliza(models.Model):
    id_estatus = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    activo = models.IntegerField()

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
    activo = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'cat_metodos_pago'


class CatModelos(models.Model):
    id_modelo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    id_marca = models.ForeignKey(CatMarcas, models.DO_NOTHING, db_column='id_marca')

    class Meta:
        managed = False
        db_table = 'cat_modelos'


class CatMonedas(models.Model):
    id_moneda = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    codigo = models.CharField(max_length=5, blank=True, null=True)
    activo = models.IntegerField()

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
    tipo_cliente = models.CharField(max_length=20)
    tipo_documento = models.CharField(max_length=3)
    numero_documento = models.CharField(max_length=20)
    nombres = models.CharField(max_length=100)
    apellidos = models.CharField(max_length=100, blank=True, null=True)
    telefono_movil = models.CharField(max_length=20, blank=True, null=True)
    telefono_fijo = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=100)
    direccion = models.TextField(blank=True, null=True)
    cuenta_bancaria = models.CharField(max_length=50, blank=True, null=True)
    ingreso_promedio = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    profesion_oficio = models.CharField(max_length=100, blank=True, null=True)
    fecha_nacimiento = models.DateField(blank=True, null=True)
    sexo = models.CharField(max_length=1, blank=True, null=True)
    nacionalidad = models.CharField(max_length=50, blank=True, null=True)
    pais_residencia = models.CharField(max_length=50, blank=True, null=True)
    actividad_economica = models.CharField(max_length=100, blank=True, null=True)
    tipo_persona = models.CharField(max_length=20, blank=True, null=True)
    fecha_registro = models.DateTimeField()
    activo = models.IntegerField()
    id_ciudad = models.ForeignKey(CatCiudades, models.DO_NOTHING, db_column='id_ciudad', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clientes'
        unique_together = (('tipo_documento', 'numero_documento'),)


class CompaniasSeguros(models.Model):
    id_compania = models.AutoField(primary_key=True)
    rif = models.CharField(unique=True, max_length=20)
    nombre = models.CharField(max_length=100)
    direccion = models.TextField(blank=True, null=True)
    telefono_contacto = models.CharField(max_length=20, blank=True, null=True)
    persona_contacto = models.CharField(max_length=100, blank=True, null=True)
    activo = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'companias_seguros'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Financiadoras(models.Model):
    id_financiadora = models.AutoField(primary_key=True)
    rif = models.CharField(unique=True, max_length=20)
    nombre = models.CharField(max_length=100)
    tasa_interes = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    activo = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'financiadoras'


class Intermediarios(models.Model):
    id_intermediario = models.AutoField(primary_key=True)
    nombre_completo = models.CharField(max_length=150)
    codigo_sudeaseg = models.CharField(max_length=50, blank=True, null=True)
    activo = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'intermediarios'


class OperadorasMoviles(models.Model):
    id_operadora = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=10)
    nombre = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'operadoras_moviles'


class PerfilesUsuario(models.Model):
    id_perfil = models.AutoField(primary_key=True)
    nombre_perfil = models.CharField(unique=True, max_length=50)
    descripcion = models.CharField(max_length=255, blank=True, null=True)
    estatus = models.IntegerField()
    fecha_creacion = models.DateTimeField(blank=True, null=True)
    fecha_actualizacion = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'perfiles_usuario'


class Polizas(models.Model):
    id_poliza = models.AutoField(primary_key=True)
    numero_poliza = models.CharField(max_length=50)
    suma_asegurada = models.DecimalField(max_digits=15, decimal_places=2)
    prima_neta = models.DecimalField(max_digits=15, decimal_places=2)
    fecha_emision = models.DateField()
    fecha_fin = models.DateField()
    vigencia_desde = models.DateField()
    vigencia_hasta = models.DateField()
    fecha_registro = models.DateTimeField()
    activo = models.IntegerField()
    id_cliente = models.ForeignKey(Clientes, models.DO_NOTHING, db_column='id_cliente')
    id_compania = models.ForeignKey(CompaniasSeguros, models.DO_NOTHING, db_column='id_compania')
    id_estatus = models.ForeignKey(CatEstatusPoliza, models.DO_NOTHING, db_column='id_estatus')
    id_moneda = models.ForeignKey(CatMonedas, models.DO_NOTHING, db_column='id_moneda')
    id_producto = models.ForeignKey('Productos', models.DO_NOTHING, db_column='id_producto')
    id_ramo = models.ForeignKey('Ramos', models.DO_NOTHING, db_column='id_ramo')
    id_vehiculo = models.ForeignKey('Vehiculos', models.DO_NOTHING, db_column='id_vehiculo', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'polizas'


class Productos(models.Model):
    id_producto = models.AutoField(primary_key=True)
    nombre_producto = models.CharField(max_length=100)
    activo = models.IntegerField()
    id_ramo = models.ForeignKey('Ramos', models.DO_NOTHING, db_column='id_ramo')

    class Meta:
        managed = False
        db_table = 'productos'


class Profesiones(models.Model):
    id_profesion = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100) # <--- Asegúrate de que diga 100

    class Meta:
        managed = False
        db_table = 'profesiones'


class Ramos(models.Model):
    id_ramo = models.AutoField(primary_key=True)
    nombre_ramo = models.CharField(max_length=100)
    activo = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'ramos'


class RecibosPrimas(models.Model):
    id_recibo = models.AutoField(primary_key=True)
    monto_cuota = models.DecimalField(max_digits=15, decimal_places=2)
    fecha_vencimiento = models.DateField()
    estatus_cobro = models.CharField(max_length=20)
    id_poliza = models.ForeignKey(Polizas, models.DO_NOTHING, db_column='id_poliza')

    class Meta:
        managed = False
        db_table = 'recibos_primas'


class Roles(models.Model):
    id_rol = models.AutoField(primary_key=True)
    nombre_rol = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=255, blank=True, null=True)
    estatus = models.CharField(max_length=20, blank=True, null=True)
    fecha_creacion = models.DateTimeField(blank=True, null=True)
    fecha_actualizacion = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'roles'


class Sexos(models.Model):
    id_sexo = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=20)
     
    class Meta:
        managed = False
        db_table = 'sexos'


class Siniestros(models.Model):
    id_siniestro = models.AutoField(primary_key=True)
    numero_siniestro = models.CharField(max_length=50)
    fecha_ocurrencia = models.DateTimeField()
    fecha_notificacion = models.DateTimeField()
    descripcion_evento = models.TextField()
    lugar_evento = models.CharField(max_length=200, blank=True, null=True)
    monto_estimado = models.DecimalField(max_digits=15, decimal_places=2)
    monto_aprobado = models.DecimalField(max_digits=15, decimal_places=2)
    nombre_contacto_emergencia = models.CharField(max_length=100, blank=True, null=True)
    telefono_contacto_emergencia = models.CharField(max_length=20, blank=True, null=True)
    activo = models.IntegerField()
    id_estatus = models.ForeignKey(CatEstatusSiniestro, models.DO_NOTHING, db_column='id_estatus')
    id_poliza = models.ForeignKey(Polizas, models.DO_NOTHING, db_column='id_poliza')

    class Meta:
        managed = False
        db_table = 'siniestros'


class TiposDocumento(models.Model):
    id_tipo_documento = models.AutoField(primary_key=True)
    siglas = models.CharField(max_length=10)
    descripcion = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'tipos_documento'


class TiposPersona(models.Model):
    id_tipo_persona = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'tipos_persona'


class Usuarios(models.Model):
    cedula = models.CharField(primary_key=True, max_length=20)
    username = models.CharField(unique=True, max_length=50)
    password_hash = models.CharField(max_length=255)
    email = models.CharField(unique=True, max_length=100)
    nombre_completo = models.CharField(max_length=100)
    ultimo_login = models.DateTimeField(blank=True, null=True)
    intentos_fallidos = models.IntegerField()
    bloqueado = models.IntegerField()
    reset_token = models.CharField(max_length=100, blank=True, null=True)
    fecha_creacion = models.DateTimeField()
    estatus = models.CharField(max_length=20, blank=True, null=True)
    id_rol = models.ForeignKey(Roles, models.DO_NOTHING, db_column='id_rol')
    tipo_cliente = models.CharField(max_length=20, blank=True, null=True)
    fecha_nacimiento_constitucion = models.DateField(blank=True, null=True)
    sexo = models.CharField(max_length=20, blank=True, null=True)
    nacionalidad_pais = models.CharField(max_length=100, blank=True, null=True)
    actividad_economica = models.CharField(max_length=100, blank=True, null=True)
    profesion = models.CharField(max_length=100, blank=True, null=True)
    tipo_persona_seguros = models.CharField(max_length=50, blank=True, null=True)
    direccion_fiscal = models.TextField(blank=True, null=True)
    telefono_movil = models.CharField(max_length=25, blank=True, null=True)
    telefono_oficina = models.CharField(max_length=25, blank=True, null=True)
    cuenta_bancaria = models.CharField(max_length=50, blank=True, null=True)
    ingreso_promedio = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    imagen_perfil = models.CharField(max_length=100, blank=True, null=True)
    banco = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'usuarios'


class Vehiculos(models.Model):
    id_vehiculo = models.AutoField(primary_key=True)
    anio = models.IntegerField()
    placa = models.CharField(unique=True, max_length=20)
    serial_motor = models.CharField(max_length=50)
    serial_carroceria = models.CharField(max_length=50)
    color = models.CharField(max_length=30, blank=True, null=True)
    id_cliente = models.ForeignKey(Clientes, models.DO_NOTHING, db_column='id_cliente')
    id_modelo = models.ForeignKey(CatModelos, models.DO_NOTHING, db_column='id_modelo')

    class Meta:
        managed = False
        db_table = 'vehiculos'

class Cedulas(models.Model):
    cedula = models.CharField(primary_key=True, max_length=20)

    class Meta:
        managed = False
        db_table = 'cedulas'

class TelefonosMoviles(models.Model):
    telefono_movil = models.CharField(primary_key=True, max_length=25)

    class Meta:
        managed = False
        db_table = 'telefonos_moviles'