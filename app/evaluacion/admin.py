from django.contrib import admin
from django.contrib.auth.models import User
from app.evaluacion import models

""" class PreguntaInline(admin.TabularInline):
    model = models.Pregunta
    extra = 3


class Cuestionario_Admin(admin.ModelAdmin):
    fieldsets = [
        ('Informacion de fecha', {'fields': [
         'fecha_pub'], }),
    ]
    inlines = [PreguntaInline]

    list_display = ('fecha_pub',)
    list_filter = ['fecha_pub']
    search_fields = ['texto_pregunta'] """


""" class EstudianteInline(admin.StackedInline):
    model = models.EstudianteAsignaturaDocente


class UserAdmin(admin.ModelAdmin):

    inlines = [EstudianteInline]

    list_display = ('username','first_name', 'last_name')
    list_filter = ['username']
    search_fields = ['username','first_name', 'last_name'] """


""" admin.site.unregister(User)
admin.site.register(User, UserAdmin) """

admin.site.register(models.Configuracion)
admin.site.register(models.PeriodoEvaluacion)
admin.site.register(models.Asignatura)
admin.site.register(models.PeriodoAcademico)

admin.site.register(models.Evaluacion)
admin.site.register(models.Pregunta)
admin.site.register(models.Cuestionario)
admin.site.register(models.Respuesta)
admin.site.register(models.EstudianteAsignaturaDocente)
admin.site.register(models.DirectivoAsignaturaDocente)
admin.site.register(models.DocenteAsignaturaDocente)
admin.site.register(models.Tabulacion)
admin.site.register(models.Carrera)
