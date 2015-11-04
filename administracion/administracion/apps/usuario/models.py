from django.db import models
from django.contrib.auth.forms import User
from administracion.apps.negocio.models import *
# Create your models here.
class Perfiles(models.Model):
	usuario = models.OneToOneField(User, unique=True, related_name='perfil')
	ci = models.IntegerField(max_length=10)
	#telefono = models.IntegerField(max_length=8)
	def __unicode__(self):
		return self.usuario.username

class Seguimiento(models.Model):
	user= models.ForeignKey(User)
	neg=models.ForeignKey(Negocio)
	fecha=models.DateTimeField(auto_now=True)
	def __unicode__(self):
		return self.user.username