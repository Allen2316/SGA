from django import forms
from django.views.generic.edit import UpdateView
from app.evaluacion import models


class FormularioLogin(forms.Form):
    username = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'name':'username'}), label='Usuario')
    password = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'name':'password'}), label='Contraseña')

class FormularioEleccion(forms.ModelForm):
    class Meta:
        model = models.Pregunta
        fields = ['respuesta']

        labels = {
            'respuesta': 'Eliga su respuesta',                        
        }

        widgets = {
            'respuesta': forms.RadioSelect(attrs={'class': 'form-check'}),            
        }