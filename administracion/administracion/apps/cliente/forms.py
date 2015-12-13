from django import forms
from .models import *
from django.forms.extras.widgets import SelectDateWidget
peticion=(('Falta de Higiene','Falta de Higiene',),('Denuncia por corrupcion','Denuncia por corrupcion',),('Horario No Establecido','Horario No Establecido',),('Maltratos','Maltratos'),('Licencia vencida','Licencia vencida'),('Reclamo','Reclamo',),('sugerencias','sugerencia',),('Otros Casos','Otros Casos'),)
class Commentform(forms.ModelForm):
	Tipo_de_peticion=forms.ChoiceField(widget=forms.Select, choices=peticion)
	class Meta:
		model=Comment
		#exclude=('user','idNegocio',)