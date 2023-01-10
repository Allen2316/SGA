from django.urls import path
from app.evaluacion import views
from app.evaluacion import models
from django.contrib.auth.decorators import login_required
from django.contrib.auth import views as auth_views
from django.utils.decorators import method_decorator



urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    path('login/', views.logueo, name='logueo'),
    path('deslogueo', auth_views.LogoutView.as_view( template_name="index.html",), name='deslogueo'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('vista_cuestionario/<pk>', views.vista_cuestionario,
         name='vista_cuestionario'),

    path('registro_cuestionario/<pk>', views.registro_cuestionario,
         name='registro_cuestionario'),

    path('voto/<pk>/', views.voto, name="voto"),

]
