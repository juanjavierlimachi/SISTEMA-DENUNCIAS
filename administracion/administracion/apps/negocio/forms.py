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
	class Meta:
		model=Negocio
		exclude=('user','estadoN','estadoD',)

class buscarForm(forms.Form):
	buscar=forms.CharField()

class regisArchivoForm(forms.Form):
	csv=forms.FileField()

class FormCobro(forms.ModelForm):
	class Meta:
		model=Cobro
		exclude=('idNotificacion',)


from administracion.apps.negocio.resources import NegocioResource
from import_export import resources
 
class NegocioResource(resources.ModelResource):

    class Meta:
        model = Negocio