from django.contrib import admin
from app.evaluacion import models
#from django.contrib.auth.models import User
# Register your models here.

# Estudiante


""" class UsuarioEInline(admin.StackedInline):
    model = models.Estudiante


class UserE_Admin(admin.ModelAdmin):
    def dni(self, obj):
        return obj.estudiante.dni

    dni.admin_order_field = 'estudiante'  # permite ordenar
    dni.short_description = 'DNI'  # renombra el titulo de columna

    @admin.display(description='Nombres')
    def nombre(obj):
        return ("%s %s" % (obj.first_name, obj.last_name)).upper()

    inlines = [UsuarioEInline]

    list_display = ('username', nombre, 'dni')
    list_filter = ['username']
    search_fields = ['username', 'dni']

# Docente


class UsuarioDoInline(admin.StackedInline):
    model = models.Docente


class UserDo_Admin(admin.ModelAdmin):
    def dni(self, obj):
        return obj.docente.dni

    dni.admin_order_field = 'docente'  # permite ordenar
    dni.short_description = 'DNI'  # renombra el titulo de columna

    @admin.display(description='Nombres')
    def nombre(obj):
        return ("%s %s" % (obj.first_name, obj.last_name)).upper()

    inlines = [UsuarioDoInline]

    list_display = ('username', nombre, 'dni')
    list_filter = ['username']
    search_fields = ['username', 'dni'] """


""" admin.site.register(
    models.User, UserE_Admin)
admin.site.register(
    models.User, UserDo_Admin) """
#admin.site.register(models.UserDi, UserDi_Admin)
# admin.site.register(models.Estudiante)
# admin.site.register(models.Docente)
# admin.site.register(models.Directivo)


admin.site.register(models.Configuracion)
admin.site.register(models.PeriodoEvaluacion)
admin.site.register(models.Asignatura)
admin.site.register(models.PeriodoAcademico)

admin.site.register(models.Evaluacion)
admin.site.register(models.Pregunta)
admin.site.register(models.Cuestionario)

admin.site.register(models.EstudianteAsignaturaDocente)
admin.site.register(models.DirectivoAsignaturaDocente)
admin.site.register(models.DocenteAsignaturaDocente)
admin.site.register(models.User)
