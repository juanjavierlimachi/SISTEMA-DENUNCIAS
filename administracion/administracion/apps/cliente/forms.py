from django import forms
from .models import *
from django.forms.extras.widgets import SelectDateWidget
peticion=(('Actos Irregulares','Actos Irregulares',),('Falta de Higiene','Falta de Higiene',),('Actos de Corrupcion','Actos de Corrupcion',),('Horario No Establecido','Horario No Establecido',),('Maltratos','Maltratos'),('Licencia vencida','Licencia vencida'),('Reclamo','Reclamo',),('sugerencias','sugerencia',),('Otros Casos','Otros Casos'),)
class Commentform(forms.ModelForm):
	Tipo_de_peticion=forms.ChoiceField(widget=forms.Select, choices=peticion)
	class Meta:
		model=Comment
		#exclude=('user','idNegocio',)