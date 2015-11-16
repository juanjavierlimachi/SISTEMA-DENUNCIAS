#encoding:utf-8
from django.forms import ModelForm
from django.db import models
from django import forms
from administracion.apps.negocio.models import *
from administracion.apps.cliente.models import *
#from django.forms.extras.widgets import SelectDateWidget

class FormMulta(ModelForm):
	#fecha_presentacion=forms.DateField(widget=SelectDateWidget())
	class Meta:
		model=multa
class FormMultaEditar(ModelForm):
	class Meta:
		model=multa
		exclude=('idUser','Usuario','Codigo',)

class EdirDenuncia(ModelForm):
	class Meta:
		model=Comment
		exclude=('idUser','user','idNegocio',)