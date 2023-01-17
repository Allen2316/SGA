from django.shortcuts import render, redirect, HttpResponseRedirect, get_object_or_404, reverse
from django.urls import reverse_lazy
from app.evaluacion import models
from app.evaluacion import forms
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.views.generic import CreateView, ListView, UpdateView, DeleteView, TemplateView
from django.contrib.auth.hashers import make_password, check_password
from django.contrib import messages
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
            #clave = make_password(request.POST['password'])
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
    
    try:        
        estudiante = models.EstudianteAsignaturaDocente.objects.get(pk=pk)        
        data = {                        
            'estudiante': estudiante,            
            'userE': request.user.estudiante,
        }
    except:
        data = {
            'Error': 'error de iniciar proyecto',
        }

    return render(request, 'evaluacion/asignaturas_docente.html', data)


@login_required
def registro_cuestionario(request, pk):
    try:
        modelo = models.Asignatura.objects.get(pk=pk)
        data = {
            'asignatura': modelo,
        }
    except:
        data = {
            'Error': 'error de iniciar ASIGNATURA',
        }

    return render(request, 'evaluacion/FrmRespuesta.html', data)


@login_required
def voto(request, pk):
    valores = request.POST
    lista = []
    id_p = []

    
    for i in valores:        
        lista.append(request.POST[i])
        id_p.append(i)
        
    lista.pop(0)
    id_p.pop(0)
    print(lista)
    cont = 1
    for pre in lista:
        print(pre)
        try:
            pregunta = get_object_or_404(models.Pregunta, pk=cont)

        except (KeyError, models.Pregunta.DoesNotExist):
            return render(request, 'evaluacion/FrmRespuesta.html', {
                'lista': lista,
                'id_p': id_p,
                'error_message': 'No seleccionó una opción.',
            })
        else:
            pregunta.respuesta = pre
            pregunta.save()
            cont += 1

    return HttpResponseRedirect(reverse('vista_cuestionario', args=[str(pk)]))
