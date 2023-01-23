from django.shortcuts import render, redirect, HttpResponseRedirect, get_object_or_404, reverse
from django.urls import reverse_lazy
from app.evaluacion import models
from app.evaluacion import forms
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.views.generic import CreateView, ListView, UpdateView, DeleteView, TemplateView
from django.contrib.auth.hashers import make_password, check_password
from django.contrib import messages
from django.db.models import Avg, Sum, Max

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
                    if request.user.is_superuser:
                        return HttpResponseRedirect(reverse('dashboard'))
                    else:
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
    data = {}
    try:
        tabulacion = models.Tabulacion.objects.all()

        # obtener el resultado mayo
        doc = models.Tabulacion.objects.aggregate(Max('total'))['total__max']
        print(doc)
        # obtener la tabulacion que contiene el docente con el resultado mayor
        ta = models.Tabulacion.objects.filter(total=doc).first()
        # obtener el docente ganador o mejor puntuado
        docente_g = models.DocenteAsignaturaDocente.objects.get(
            pk=ta.docente.pk)

    except:
        data = {'error': 'Error no existe niguna encuesta respondida'}
    else:
        data = {
            'tabulacion': tabulacion,
            'docente': docente_g,
        }
    return render(request, 'evaluacion/dashboard.html', data)


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
                tab = models.Evaluacion.objects.all().exclude(
                    estudiante=None)

                doc = estudiante.carrera.asignatura_set.all()

                lista = list()

                for d in doc:
                    re = False
                    for e in tab:
                        if e.docente.pk == d.asignatura.first().pk:
                            re = True
                            continue
                    if re == False:
                        lista.append(d)

                if len(lista) == 0:
                    data = {
                        'errorV': 'Encuesta realizada',
                    }

            except:
                pass
            else:
                data['voto'] = lista

    except:
        try:
            if request.user.docente.is_docente:
                docente = models.DocenteAsignaturaDocente.objects.get(pk=pk)

                tab = models.Evaluacion.objects.all().filter(
                    estudiante=None, directivo=None, docente=docente)

                try:
                    tab = models.Evaluacion.objects.all().filter(
                        estudiante=None, directivo=None, docente=docente)

                    lista = list()

                    for e in tab:
                        re = False
                        if e.docente.pk == docente.pk:
                            re = True
                            lista.append(docente)

                    print(lista)
                    if len(lista) == 0:
                        data = {
                            'docente': docente,
                        }
                    else:
                        data = {
                            'errorVDo': 'Encuesta realizada',
                        }

                except:
                    pass

        except:
            try:
                if request.user.directivo.is_directivo:
                    directivo = models.DirectivoAsignaturaDocente.objects.get(
                        pk=pk)
                    data = {
                        'directivo': directivo,
                    }
                    
                    try:
                        tab = models.Evaluacion.objects.all().exclude(
                        directivo=None)

                        doc = directivo.docente.all()

                        lista = list()

                        for d in doc:
                            re = False
                            for e in tab:
                                if e.docente.pk == d.pk:
                                    re = True
                                    continue
                            if re == False:
                                lista.append(d)

                        if len(lista) == 0:
                            data = {
                                'errorVDi': 'Encuesta realizada',
                            }
                    except Exception as e:
                        print('Error: ', e)
                    else:
                        data['votoDi'] = lista
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
                asignatura=asignatura)
            print(asignatura)
            data = {
                'asignatura': asignatura,
                'docenteE': docente,
            }
    except:
        try:
            if request.user.docente.is_docente:
                docente = models.DocenteAsignaturaDocente.objects.get(pk=pk)
                data = {
                    'docenteDo': docente,
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
                        'docenteDi': docente,
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

    cont = 0
    total = 0

    if len(id_p) == 0:
        return render(request, 'evaluacion/FrmRespuesta.html', {
            'error_message': 'No seleccionó una opción.',
        })

    for pre in id_p:

        try:
            pregunta = get_object_or_404(models.Pregunta, pk=pre)
        except (KeyError, models.Pregunta.DoesNotExist):
            return render(request, 'evaluacion/FrmRespuesta.html', {
                'error_message': 'No seleccionó una opción.',
            })
        else:
            respuesta = models.Respuesta(
                respuesta=lista[cont], pregunta=pregunta)

            respuesta.save()
            total = total + int(respuesta.respuesta)
            cont += 1
    cuestionario = models.Cuestionario.objects.get(
        pk=pregunta.cuestionario.pk)

    docente = models.DocenteAsignaturaDocente.objects.get(
        pk=docente_id)

    try:
        if request.user.estudiante.is_estudiante:
            estudiante = models.EstudianteAsignaturaDocente.objects.get(
                pk=pk)
            print(docente)

            pre = models.Pregunta.objects.filter(
                cuestionario=cuestionario).count()

            evaluacion = models.Evaluacion(
                cuestionario=pregunta.cuestionario, estudiante=estudiante, docente=docente, totalEvaluacion=total/pre)
            evaluacion.save()

            tot = models.Evaluacion.objects.all().exclude(
                estudiante=None).aggregate(Sum('totalEvaluacion'))

            count = models.Evaluacion.objects.all().exclude(estudiante=None).count()
            estTotal = tot['totalEvaluacion__sum'] / count

            obj, created = models.Tabulacion.objects.get_or_create(
                id=docente.pk,
                defaults={'docente': docente},
            )

            obj.estTotal = estTotal
            obj.save()

    except:
        try:
            if request.user.docente.is_docente:

                pre = models.Pregunta.objects.filter(
                    cuestionario=cuestionario).count()

                evaluacion = models.Evaluacion(
                    cuestionario=cuestionario, docente=docente, totalEvaluacion=total/pre)
                evaluacion.save()

                tot = models.Evaluacion.objects.all().filter(
                    estudiante=None, directivo=None).aggregate(Sum('totalEvaluacion'))

                count = models.Evaluacion.objects.all().filter(
                    estudiante=None, directivo=None).count()
                estTotal = tot['totalEvaluacion__sum'] / count

                obj, created = models.Tabulacion.objects.get_or_create(
                    id=docente.pk,
                    defaults={'docente': docente},
                )
                obj.docTotal = estTotal
                obj.save()

        except:
            try:
                if request.user.directivo.is_directivo:
                    directivo = models.DirectivoAsignaturaDocente.objects.get(
                        pk=pk)

                    pre = models.Pregunta.objects.filter(
                        cuestionario=cuestionario).count()

                    evaluacion = models.Evaluacion(
                        cuestionario=pregunta.cuestionario,  docente=docente, directivo=directivo, totalEvaluacion=total/pre)
                    evaluacion.save()

                    tot = models.Evaluacion.objects.all().exclude(
                        directivo=None).aggregate(Sum('totalEvaluacion'))

                    count = models.Evaluacion.objects.all().exclude(directivo=None).count()
                    estTotal = tot['totalEvaluacion__sum'] / count

                    obj, created = models.Tabulacion.objects.get_or_create(
                        id=docente.pk,
                        defaults={'docente': docente},
                    )
                    obj.dirTotal = estTotal
                    obj.save()

            except Exception as e:
                print(e)

    obj, created = models.Tabulacion.objects.get_or_create(
        id=docente.pk,
        defaults={'docente': docente},
    )

    tota = (obj.estTotal + obj.docTotal + obj.dirTotal) / 3
    print(tota)
    obj.docente = docente
    obj.total = tota
    obj.save()

    return HttpResponseRedirect(reverse('vista_cuestionario', args=[str(pk)]))

#!TODO
# hacer un for para recorrer todos los doocentes evaluados comparando con los campos registrados en evaluiacion docente.all() para el for y evaluacion.all() y sacar solo los estudiantes y directivos para promediar y ver al mejor docente puntuado, anotado para no olvidarme de la logica
