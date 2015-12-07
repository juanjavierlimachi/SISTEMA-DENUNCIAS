#encoding:utf-8
from django.forms import ModelForm
from django.db import models
from django import forms
from .models import *
from administracion.apps.negocio.models import *
from django.forms.extras.widgets import SelectDateWidget

class FormCronograma(forms.ModelForm):
	#Fecha_inicio = forms.DateField(widget=SelectDateWidget())
	#Conclucion = forms.DateField(widget=SelectDateWidget())
	class Meta:
		model=Cronograma
		exclude=('Usuario',)
tipo = (('Restauran', 'Restauran',), ('Pub o Cafe Bar', 'Pub o Cafe Bar',),('Wisqueria', 'Wisqueria',),('Bar','Bar',),('Quinta','Quinta',),('Nicht','Nicht',),('Lenocimios','Lenocimios',),('Salones de Baile Popuares','Salones de Baile Popuares',),('Cafe Internet','Cafe Internet',))
Atencion = (('Dia de 08:00 am A 20:00 pm', 'Atencion de Dia',), ('Noche de 20:00 pm A 03:00 am', 'Atencion Noche',))
class FormTipo(forms.ModelForm):
	categoria=forms.ChoiceField(widget=forms.Select, choices=tipo)
	atencion=forms.ChoiceField(widget=forms.RadioSelect, choices=Atencion)
	class Meta:
		model=Categoria