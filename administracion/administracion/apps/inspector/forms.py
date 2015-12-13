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
		exclude=('estado',)
class FormMultaEditar(ModelForm):
	class Meta:
		model=multa
		exclude=('idUser','Usuario','Codigo','estado',)

from django.forms.extras.widgets import SelectDateWidget
peticion=(('Falta de Higiene','Falta de Higiene',),('Denuncia por corrupcion','Denuncia por corrupcion',),('Horario No Establecido','Horario No Establecido',),('Maltratos','Maltratos'),('No Emite Factura','No Emite Factura'),('Reclamo','Reclamo',),('sugerencias','sugerencia',),('Otros Casos','Otros Casos'),)
class EdirDenuncia(ModelForm):
	Tipo_de_peticion=forms.ChoiceField(widget=forms.Select, choices=peticion)
	class Meta:
		model=Comment
		exclude=('idUser','user','idNegocio','estado',)