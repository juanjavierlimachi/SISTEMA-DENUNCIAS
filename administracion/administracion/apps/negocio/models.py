#encoding:utf-8
from django.db import models
from django.contrib.auth.forms import User
# Create your models here.
class Categoria(models.Model):
	categoria=models.CharField(max_length=50)
	fecha_registro = models.DateTimeField(auto_now=True)
	def __unicode__(self):
		return self.categoria

class Negocio(models.Model):
	user = models.ForeignKey(User, blank=True, null=True)
	propietario = models.CharField(max_length=100)
	memorial_apertura = models.CharField(max_length=20)
	resolucion_municipal = models.CharField(max_length=20)
	direccion=models.CharField(max_length=80)
	categoria=models.ForeignKey(Categoria)
	fecha_registro = models.DateTimeField(auto_now=True)
	estadoN=models.IntegerField(default=0)
	estadoD=models.IntegerField(default=0)
	def __unicode__(self):
		return self.propietario

class multa(models.Model):
	idUser=models.IntegerField()
	Usuario=models.CharField(max_length=100)
	fecha_notificacion=models.DateTimeField(auto_now=True)
	descripcion=models.TextField()
	#opservaciones=models.CharField(max_length=150)
	Codigo=models.IntegerField()# es el ID del Negocio
	fecha_presentacion=models.DateField()
	hora=models.CharField(max_length=12)
	def __unicode__(self):
		return self.Usuario

class Cobro(models.Model):
	monto=models.FloatField()
	idNotificacion=models.OneToOneField(multa)
	fecha=models.DateTimeField(auto_now=True)
	def __unicode__(self):
		return "%s"%self.idNotificacion
