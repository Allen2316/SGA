from django.db import models
from datetime import datetime
from django.db import connection
# from django.forms import model_to_dict
from django.contrib.auth.models import User
from django.db.models import Count
from django.db.models import Q
from django.core.exceptions import MultipleObjectsReturned
from collections import OrderedDict
from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import User, AbstractUser


class User(AbstractUser):
    is_estudiante = models.BooleanField(default=False)
    is_docente = models.BooleanField(default=False)
    is_directivo = models.BooleanField(default=False)
    first_name = models.CharField(max_length=80)
    last_name = models.CharField(max_length=80)
    
    #!todo corregir encriptacion
    def save(self, *args, **kwargs):
        self.password = make_password(self.password)
        super(User, self).save(*args, **kwargs)

    """  def save(self, commit=True):
        # Save the provided password in hashed format
        user = super(User, self).save(commit=False)
        user.set_password(self.password)
        if commit:
            user.save()
        return user """


class PeriodoAcademico(models.Model):
    nombre = models.CharField(max_length=50)
    fecha_inicio = models.DateField()
    fecha_fin = models.DateField()
    periodoLectivo = models.CharField(
        max_length=100, db_column='periodo_lectivo')

    class Meta:
        ordering = ['fecha_inicio', 'fecha_fin']
        verbose_name = 'Periodo Académico'
        verbose_name_plural = 'Periodos Académicos'

    def rango(self):
        return '{0} / {1}'.format(self.fecha_inicio.strftime('%b %Y'), self.fecha_fin.strftime('%b %Y'))

    def __str__(self):
        return self.nombre


class PeriodoEvaluacion(models.Model):
    nombre = models.CharField(max_length=100)
    titulo = models.CharField(max_length=300)
    descripcion = models.TextField(null=True, blank=True)
    observaciones = models.TextField(null=True, blank=True)
    fecha_autorizacion = models.DateTimeField()
    fecha_aprobacion = models.DateTimeField()
    fecha_inicio_publicacion = models.DateTimeField()
    fecha_fin = models.DateTimeField()
    periodoAcademico = models.ForeignKey(
        PeriodoAcademico, related_name='periodosEvaluacion', verbose_name="Periodo Académico", on_delete=models.RESTRICT)

    class Meta:
        ordering = ['fecha_inicio_publicacion', 'fecha_fin']
        verbose_name = 'Periodo Evaluación'
        verbose_name_plural = 'Periodos de Evaluación'

    def noIniciado(self):
        ahora = datetime.today()
        return ahora < self.fecha_inicio_publicacion

    def vigente(self):
        ahora = datetime.today()
        vigente = self.fecha_inicio_publicacion <= ahora <= self.fecha_fin
        return vigente

    def finalizado(self):
        ahora = datetime.today()
        return ahora > self.fecha_fin

    def __str__(self):
        return self.nombre


class Cuestionario(models.Model):
    categoria_choices = (
        ('academico', 'Academico'),
        ('gestion', 'Gestion'),
        ('didactico', 'Didactico'),
    )
    nombre = models.CharField(
        max_length=150, default='Cuestionario Sin Nombre')
    titulo = models.CharField(max_length=255)
    encabezado = models.TextField()
    fecha_inicio = models.DateTimeField(
        default=datetime.now, verbose_name='Inicio de la Encuesta')
    fecha_fin = models.DateTimeField(
        default=datetime.now, verbose_name='Fin de la Encuesta')
    peso = models.IntegerField(default=1)
    tipoInformante = models.CharField(
        max_length=15, choices=categoria_choices, default='academico', verbose_name='TipoInformante')
    periodoEvaluacion = models.ForeignKey(PeriodoEvaluacion, blank=True, null=True,
                                          related_name='periodoEvaluacion', verbose_name='Periodo de Evaluación', on_delete=models.PROTECT)

    def __str__(self):
        return self.nombre

    """ def toJSON(self):
        item = model_to_dict(self)
        return item """

    class Meta:
        verbose_name = 'Cuestionario'
        verbose_name_plural = 'Cuestionarios'


class Asignatura(models.Model):
    carrera = models.CharField(max_length=100)
    semestre = models.CharField(max_length=10, verbose_name='ciclo')
    paralelo = models.CharField(max_length=50)
    nombre = models.TextField()
    duracion = models.FloatField(verbose_name='duración en horas')
    periodoAcademico = models.ForeignKey(PeriodoAcademico, related_name='periodoAcademico',
                                         verbose_name='Periodo Académico', on_delete=models.CASCADE)
    estadoAsignatura = models.BooleanField(default=True)

    cuestionario = models.ForeignKey(
        Cuestionario, blank=True, null=True, on_delete=models.CASCADE)

    def esVigente(self):
        if self.estadoAsignatura == True:
            return True
        else:
            return False

    def get_carrera(self):
        return self.carrera[:60]
    get_carrera.short_description = 'Carrera'

    def get_semestre(self):
        return self.semestre
    get_semestre.short_description = 'Semestre'

    def get_paralelo(self):
        return self.paralelo
    get_paralelo.short_description = 'Paralelo'

    """ def get_docente(self):
        return self.docente.nombres
    get_paralelo.short_description = 'Docente' """

    """ def datosDocente(self):
        return '{0} - {1} / {3}'.format(self.docente.nombres, self.docente.apellidos, self.docente.dni) """

    def __str__(self):
        return '{0} - {1}'.format(self.carrera, self.nombre)

# class AsignaturaDocentePeriodo
# pk

# id sesion estudiante


class EstudianteAsignaturaDocente(models.Model):
    estudiante = models.OneToOneField(
        User, related_name='estudiante', on_delete=models.CASCADE, primary_key=True)
    asignaturaEstudiante = models.ManyToManyField(
        Asignatura, related_name='estudiantesAsignaturaDocente', verbose_name='Estudiante - Docente')

    def __str__(self):
        return '{0} - {1}'.format(self.estudiante.first_name, self.asignaturaEstudiante.all())

    class Meta:
        verbose_name = 'EstudianteAsignaturaDocente'
        verbose_name_plural = 'EstudianteAsignaturaDocentes'


class DirectivoAsignaturaDocente(models.Model):

    directivo = models.OneToOneField(
        User, related_name='directivo', on_delete=models.CASCADE, primary_key=True)
    docente = models.ManyToManyField(
        User, related_name='directivoAsignaturaDocente', verbose_name='Directivo - Docente')

    def __str__(self):
        return '{0} - {1}'.format(self.directivo.first_name, self.docente.all())

    class Meta:
        verbose_name = 'DirectivoAsignaturaDocente'
        verbose_name_plural = 'DirectivoAsignaturaDocentes'


class DocenteAsignaturaDocente(models.Model):
    docente = models.OneToOneField(
        User, related_name='docente', on_delete=models.CASCADE, primary_key=True)
    asignaturas = models.ManyToManyField(
        Asignatura, related_name='docenteAsignaturaDocente', verbose_name='Autoevaluacion - Docente')

    def __str__(self):
        return '{0} - {1}'.format(self.docente.first_name, self.asignaturas.all())

    class Meta:
        verbose_name = 'Asignatura'
        verbose_name_plural = 'AsignaturasDocentes'


# ===================================================================================================
#   Evaluaciones
# ===================================================================================================


class Pregunta(models.Model):
    opciones_choices = (
        ('0', '-----'),
        ('1', 'Opcion 1'),
        ('2', 'Opcion 2'),
        ('3', 'Opcion 3'),
        ('4', 'Opcion 4'),
        ('5', 'Opcion 5')
    )
    texto = models.TextField()
    # observaciones = models.CharField(max_length=70, null=True, blank=True)
    orden = models.IntegerField()
    respuesta = models.CharField(
        max_length=15, choices=opciones_choices, verbose_name='Respuesta', default='0')
    # cuestionario = models.ForeignKey(Cuestionario, blank=True, null=True, related_name='preguntas', on_delete=models.PROTECT)
    cuestionario = models.ForeignKey(
        Cuestionario, related_name='cuestionarios', on_delete=models.PROTECT)

    def __str__(self):
        return '{0} - {1}'.format(self.orden, self.texto)

    class Meta:
        ordering = ['id']
        verbose_name = 'Pregunta'
        verbose_name_plural = 'Preguntas'


# id sesion

class Evaluacion(models.Model):
    cuestionario = models.ForeignKey(
        Cuestionario, related_name='preguntas', on_delete=models.PROTECT)
    estudiante = models.ForeignKey(EstudianteAsignaturaDocente, null=True,
                                   blank=True, related_name='ev_estudiante', on_delete=models.PROTECT)
    docente = models.ForeignKey(DirectivoAsignaturaDocente, null=True,
                                blank=True, related_name='ev_docente', on_delete=models.PROTECT)
    directivo = models.ForeignKey(DocenteAsignaturaDocente, null=True,
                                  blank=True,  related_name='ev_directivo', on_delete=models.PROTECT)
    totalEvaluacion = models.IntegerField(null=True, blank=True)

    def __str__(self):
        return '{0} - {1}'.format(self.orden, self.texto)

    class Meta:
        verbose_name = 'Evaluacion'
        verbose_name_plural = 'Evaluaciones'
        ordering = ['id']

# ===================================================================================================
#   Configuraciones
# ===================================================================================================


class Configuracion(models.Model):
    periodoAcademicoActual = models.OneToOneField(
        PeriodoAcademico, null=True, blank=True, verbose_name='Periodo Académico Actual', on_delete=models.RESTRICT)
    periodoEvaluacionActual = models.OneToOneField(
        PeriodoEvaluacion, null=True, blank=True, verbose_name='Periodo Evaluación Actual', on_delete=models.RESTRICT)

    @classmethod
    def getPeriodoAcademicoActual(self):

        return Configuracion.objects.latest('id').periodoAcademicoActual

    @classmethod
    def getPeriodoEvaluacionActual(self):
        return Configuracion.objects.latest('id').periodoEvaluacionActual

    class Meta:
        verbose_name = 'Configuracion'
        verbose_name_plural = 'Configuraciones'

    def __str__(self):
        return "Configuraciones de la Aplicación"
