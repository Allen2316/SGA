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
from django.contrib.auth.models import User


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


class Carrera(models.Model):
    nombre = models.CharField(max_length=100, null=False)
    periodoAcademico = models.ForeignKey(PeriodoAcademico, related_name='periodoAcademico',
                                         verbose_name='Periodo Académico', on_delete=models.CASCADE)

    class Meta:
        verbose_name = 'Carrera'
        verbose_name_plural = 'Carreras'

    def __str__(self):

        return self.nombre


class Asignatura(models.Model):
    carrera = models.ForeignKey(Carrera, on_delete=models.CASCADE)
    semestre = models.CharField(max_length=10, verbose_name='ciclo')
    paralelo = models.CharField(max_length=50)
    nombre = models.TextField(max_length=100)
    duracion = models.FloatField(verbose_name='duración en horas')

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

# Estudiante


class EstudianteAsignaturaDocente(models.Model):
    """ nombres = models.CharField(max_length=100, null=False)
    apellidos = models.CharField(
        max_length=100, verbose_name='ciclo', null=False)

     """
    estudiante = models.OneToOneField(
        User, related_name='estudiante', on_delete=models.CASCADE, primary_key=True)

    cedula = models.CharField(max_length=10, null=False, unique=True)
    is_estudiante = models.BooleanField(default=True, null=False)

    carrera = models.ForeignKey(
        Carrera, verbose_name='Carrera', on_delete=models.CASCADE)

    def __str__(self):
        return '{0} - {1}'.format(self.estudiante.first_name, self.carrera.asignatura_set.all())

    class Meta:
        verbose_name = 'Estudiante'
        verbose_name_plural = 'Estudiantes'


# Docente
class DocenteAsignaturaDocente(models.Model):
    docente = models.OneToOneField(
        User, related_name='docente', on_delete=models.CASCADE, primary_key=True)

    is_docente = models.BooleanField(default=True, null=False)

    cedula = models.CharField(max_length=10, null=False, unique=True)

    asignatura = models.ForeignKey(
        Asignatura, verbose_name='Asignatura del docente', related_name='asignatura', on_delete=models.CASCADE)

    cuestionarios = models.ManyToManyField(
        Cuestionario, blank=True)

    def __str__(self):
        return '{0} | {1} - {2} ->| {3}| <-{4}'.format(self.pk,self.cedula, self.docente.first_name, self.asignatura.nombre, self.asignatura.carrera.nombre)

    class Meta:
        verbose_name = 'Docente'
        verbose_name_plural = 'Docentes'


# Directivo

class DirectivoAsignaturaDocente(models.Model):

    directivo = models.OneToOneField(
        User, related_name='directivo', on_delete=models.CASCADE, primary_key=True)

    is_directivo = models.BooleanField(default=True, null=False)

    cedula = models.CharField(max_length=10, null=False, unique=True)

    docente = models.ManyToManyField(
        DocenteAsignaturaDocente, related_name='docenteD', verbose_name='Directivo - Docente', blank=True)

    def __str__(self):
        return '%s %s (%s)' % (self.directivo.first_name, self.directivo.last_name, self.directivo.username)

    class Meta:
        verbose_name = 'Directivo'
        verbose_name_plural = 'Directivos'


# ===================================================================================================
#   Evaluaciones
# ===================================================================================================


class Pregunta(models.Model):

    texto = models.TextField()
    # observaciones = models.CharField(max_length=70, null=True, blank=True)
    orden = models.IntegerField()

    # cuestionario = models.ForeignKey(Cuestionario, blank=True, null=True, related_name='preguntas', on_delete=models.PROTECT)
    cuestionario = models.ForeignKey(
        Cuestionario, related_name='cuestionarios', on_delete=models.PROTECT)

    def __str__(self):
        return '{0} - {1}'.format(self.orden, self.texto)

    class Meta:
        ordering = ['id']
        verbose_name = 'Pregunta'
        verbose_name_plural = 'Preguntas'


class Respuesta(models.Model):
    opciones_choices = (
        ('0', '-----'),
        ('1', 'Opcion 1'),
        ('2', 'Opcion 2'),
        ('3', 'Opcion 3'),
        ('4', 'Opcion 4'),
        ('5', 'Opcion 5')
    )
    pregunta = models.ForeignKey(Pregunta, on_delete=models.CASCADE)

    respuesta = models.CharField(
        max_length=15, choices=opciones_choices, verbose_name='Respuesta', default='0')

    class Meta:
        verbose_name = 'Respuesta'
        verbose_name_plural = 'Respuestas'

    def __str__(self):
        return ('%s, %s') % (self.pregunta.texto, self.respuesta)


# id sesion

class Evaluacion(models.Model):
    cuestionario = models.ForeignKey(
        Cuestionario, related_name='cuestionario', on_delete=models.CASCADE)
    estudiante = models.ForeignKey(EstudianteAsignaturaDocente, null=True,
                                   blank=True, related_name='ev_estudiante', on_delete=models.CASCADE)
    docente = models.ForeignKey(DocenteAsignaturaDocente, null=True,
                                blank=True, related_name='ev_docente', on_delete=models.CASCADE)
    directivo = models.ForeignKey(DirectivoAsignaturaDocente, null=True,
                                  blank=True,  related_name='ev_directivo', on_delete=models.CASCADE)
    totalEvaluacion = models.DecimalField(
        max_digits=5, decimal_places=2, null=True, blank=True)

    def __str__(self):
        return '{0}'.format(self.pk)

    class Meta:
        verbose_name = 'Evaluacion'
        verbose_name_plural = 'Evaluaciones'
        ordering = ['id']


class Tabulacion(models.Model):
    docente = models.ForeignKey(
        DocenteAsignaturaDocente, null=False, on_delete=models.CASCADE)
    estTotal = models.DecimalField(
        default=0, decimal_places=2, max_digits=5, null=False)
    docTotal = models.DecimalField(
        default=0, decimal_places=2, max_digits=5, null=False)
    dirTotal = models.DecimalField(
        default=0, decimal_places=2, max_digits=5, null=False)
    total = models.DecimalField(
        default=0, decimal_places=2, max_digits=5, null=True, blank=True)

    class Meta:
        verbose_name = 'Tabulacion'
        verbose_name_plural = 'Tabulaciones'

    def __str__(self):

        return 'Tabulacion %s' % str(self.pk)

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
