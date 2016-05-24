#encoding:utf-8
from django.contrib import admin
from django.forms import ModelForm
from django import forms
from .models import *
from django.contrib import admin
from django.forms import ModelForm
from django import forms
from django.forms.extras.widgets import SelectDateWidget

Memorial = (('Si', 'Presento',), ('No', 'Pendiente',))
Resolucion = (('Si', 'Presento',), ('No', 'Pendiente',))
class formNegocio(forms.ModelForm):
	memorial_apertura=forms.ChoiceField(widget=forms.RadioSelect, choices=Memorial)
	resolucion_municipal=forms.ChoiceField(widget=forms.RadioSelect, choices=Resolucion)
	direccion = forms.CharField(required=True,label="Dirección")
	class Meta:
		model=Negocio
		exclude=('user','estadoN','estadoD','qr','activo',)

class buscarForm(forms.Form):
	buscar=forms.CharField()

class regisArchivoForm(forms.Form):
	csv=forms.FileField()

#objeto = (('Horario No Establecido', 'Horario No Establecido',),('Falta de Higiene','Falta de Higiene',),('Alteracion al Negocio','Alteracion al Negocio',) ,('Infraestructura', 'Infraestructura',),('Equipamiento De Comodidades al cliente', 'Falta de Equipamiento',))
tipo = (('150', 'Por primera vez',), ('300', 'Por segunda vez',),('400', 'Por Clausura Temporal 5 Dias',),('1000','Clausuara Temporal 15 Dias',))
class FormCobro(forms.ModelForm):
	monto=forms.ChoiceField(widget=forms.Select, choices=tipo)
	#estado=forms.ChoiceField(widget=forms.Select, choices=objeto)
	class Meta:
		model=Cobro
		exclude=('idNotificacion',)


from administracion.apps.negocio.resources import NegocioResource
from import_export import resources
 
class NegocioResource(resources.ModelResource):

    class Meta:
        model = Negocio