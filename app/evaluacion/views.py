from django.shortcuts import render, redirect, HttpResponseRedirect, get_object_or_404, reverse
from django.urls import reverse_lazy
from app.evaluacion import models
from app.evaluacion import forms
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.views.generic import CreateView, ListView, UpdateView, DeleteView, TemplateView
from django.contrib.auth.hashers import make_password, check_password
from django.contrib import messages
from django.db.models import Avg, Sum

# Create your views here.


class IndexView(TemplateView):
    template_name = 'index.html'

    def get(self, request, *args, **kwargs):
        try:
            pea = models.Configuracion.getPeriodoEvaluacionActual()
            datos = dict(periodoEvaluacionActual=pea)
        except:
            datos = {'error': 'error de iniciar proyecto'}
        return render(request, self.template_name, datos)


def logueo(request):
    if request.method == 'POST':
        formulario = forms.FormularioLogin(request.POST)
        if formulario.is_valid():
            usuario = request.POST['username']
            clave = request.POST['password']
            # clave = make_password(request.POST['password'])
            user = authenticate(username=usuario, password=clave)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    context = {'pk': user.pk}
                    return HttpResponseRedirect(reverse('vista_cuestionario', args=[str(user.id)]))
                else:
                    return HttpResponseRedirect(reverse('noactivo.html'))
            else:
                messages.warning(request, 'Usuario y/o contraseña incorrecta')
    else:
        formulario = forms.FormularioLogin()
    context = {
        'form': formulario
    }
    return render(request, 'login.html', context)


@login_required
def dashboard(request):
    return render(request, 'evaluacion/dashboard.html')


@login_required
def vista_cuestionario(request, pk):

    data = {}
    error = {
        'Error': 'error de iniciar proyecto Porque usted debe ser administrador, si no no existe nigun ceustionario registrado',
    }

    try:
        if request.user.estudiante.is_estudiante:

            estudiante = models.EstudianteAsignaturaDocente.objects.get(pk=pk)
            data = {
                'estudiante': estudiante,
            }

            try:
                eva = models.Evaluacion.objects.get(estudiante=estudiante)
                data['voto'] = False
            except:
                pass
            else:
                data['voto'] = True
    except:
        try:
            if request.user.docente.is_docente:
                docente = models.DocenteAsignaturaDocente.objects.get(pk=pk)

                data = {
                    'docente': docente,
                }
                try:
                    eva = models.Evaluacion.objects.get(docente=docente)
                    data['voto'] = False
                except:
                    pass
                else:
                    data['voto'] = True
        except:
            try:
                if request.user.directivo.is_directivo:
                    directivo = models.DirectivoAsignaturaDocente.objects.get(
                        pk=pk)
                    data = {
                        'directivo': directivo,
                    }
                try:
                    eva = models.Evaluacion.objects.get(directivo=directivo)
                    data['voto'] = False
                except:
                    pass
                else:
                    data['voto'] = True
            except:
                data = error
    return render(request, 'evaluacion/asignaturas_docente.html', data)


@login_required
def registro_cuestionario(request, pk):
    data = {}
    error = {
        'Error': 'error de iniciar modulo de evaulacion por que no tiene cuestionarios',
    }
    try:

        if request.user.estudiante.is_estudiante:
            asignatura = models.Asignatura.objects.get(pk=pk)
            docente = models.DocenteAsignaturaDocente.objects.get(
                asignaturas=asignatura)
            print(asignatura)
            data = {
                'asignatura': asignatura,
                'docente': docente,
            }
    except:
        try:
            if request.user.docente.is_docente:
                docente = models.DocenteAsignaturaDocente.objects.get(pk=pk)
                data = {
                    'docente': docente,
                }
        except:
            try:
                if request.user.directivo.is_directivo:
                    docente = models.DocenteAsignaturaDocente.objects.get(
                        pk=pk)
                    directivo = models.DirectivoAsignaturaDocente.objects.get(
                        docente=docente)
                    data = {
                        'directivo': directivo,
                        'docente': docente,
                    }
            except:
                data = error

    return render(request, 'evaluacion/FrmRespuesta.html', data)


""" def voto(request):
    valores = request.POST
    lista = []
    id_p = []

    for i in valores:
        lista.append(request.POST[i])
        id_p.append(i)

    lista.pop(0)
    id_p.pop(0)

    cont = 0
    for pre in id_p:
        pregunta = get_object_or_404(models.Pregunta, pk=pre)
        try:
            opcion_elegida = pregunta.eleccion_set.get(pk=lista[cont])
        except (KeyError, models.Eleccion.DoesNotExist):
            return render(request, 'seguimiento/FrmEleccion.html', {
                'lista': lista,
                'id_p': id_p,
                'error_message': 'No seleccionó una opción.',
            })
        else:
            opcion_elegida.votos += 1
            opcion_elegida.save()
            cont += 1

    return HttpResponseRedirect(reverse('lista_oferta_laboral_index',)) """


@login_required
def voto(request, pk, docente_id):
    valores = request.POST
    lista = []
    id_p = []

    for i in valores:
        lista.append(request.POST[i])
        id_p.append(i)

    lista.pop(0)
    id_p.pop(0)

    print(lista)
    print(id_p)
    cont = 0
    for pre in id_p:

        try:
            pregunta = get_object_or_404(models.Pregunta, pk=pre)
        except (KeyError, models.Respuesta.DoesNotExist):
            return render(request, 'evaluacion/FrmRespuesta.html', {
                'error_message': 'No seleccionó una opción.',
            })
        else:
            respuesta = models.Respuesta(
                respuesta=lista[cont], pregunta=pregunta)
            respuesta.save()

            cont += 1

    cuestionario = models.Cuestionario.objects.get(
        pk=pregunta.cuestionario.pk)
    print(cuestionario)
    total = models.Respuesta.objects.filter(
        pregunta__cuestionario__pk=cuestionario.pk).aggregate(Sum('respuesta'))

    try:
        if request.user.estudiante.is_estudiante:
            estudiante = models.EstudianteAsignaturaDocente.objects.get(
                pk=pk)

            docente = models.DocenteAsignaturaDocente.objects.get(
                pk=docente_id)
            print(docente)

            evaluacion = models.Evaluacion(
                cuestionario=pregunta.cuestionario, docente=docente,  estudiante=estudiante, totalEvaluacion=total['respuesta__sum'])
            evaluacion.save()

    except:
        try:
            if request.user.docente.is_docente:
                docente = models.DocenteAsignaturaDocente.objects.get(
                    pk=pk)
                evaluacion = models.Evaluacion(
                    cuestionario=cuestionario, docente=docente, totalEvaluacion=total)
                evaluacion.save()
        except:
            try:
                if request.user.directivo.is_directivo:
                    directivo = models.DirectivoAsignaturaDocente.objects.get(
                        pk=pk)
                    docente = models.DocenteAsignaturaDocente.objects.get(
                        pk=docente_id)

                    evaluacion = models.Evaluacion(
                        cuestionario=pregunta.cuestionario, directivo=directivo, docente=docente, totalEvaluacion=total['respuesta__sum'])
                    evaluacion.save()
            except:
                pass

    return HttpResponseRedirect(reverse('vista_cuestionario', args=[str(pk)]))


""" @login_required
def votoDirectivo(request, pk, docente_id):
    valores = request.POST
    lista = []
    id_p = []

    for i in valores:
        lista.append(request.POST[i])
        id_p.append(i)

    lista.pop(0)
    id_p.pop(0)

    print(lista)
    print(id_p)
    cont = 0
    for pre in id_p:

        try:
            pregunta = get_object_or_404(models.Pregunta, pk=pre)
        except (KeyError, models.Respuesta.DoesNotExist):
            return render(request, 'evaluacion/FrmRespuesta.html', {
                'error_message': 'No seleccionó una opción.',
            })
        else:
            respuesta = models.Respuesta(
                respuesta=lista[cont], pregunta=pregunta)
            respuesta.save()

            cont += 1

    cuestionario = models.Cuestionario.objects.get(
        pk=pregunta.cuestionario.pk)
    print(cuestionario)
    total = models.Respuesta.objects.filter(
        pregunta__cuestionario__pk=cuestionario.pk).aggregate(Sum('respuesta'))

    try:
        if request.user.directivo.is_directivo:
            directivo = models.DirectivoAsignaturaDocente.objects.get(
                pk=pk)
            docente = models.DocenteAsignaturaDocente.objects.get(
                pk=docente_id)

            evaluacion = models.Evaluacion(
                cuestionario=pregunta.cuestionario, directivo=directivo, docente=docente, totalEvaluacion=total['respuesta__sum'])

            evaluacion.save()

    except:
        pass

    return HttpResponseRedirect(reverse('vista_cuestionario', args=[str(pk)]))
 """
