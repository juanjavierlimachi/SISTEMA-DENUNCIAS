from django.db import models
#from administracion.apps.negocio.models import Negocio
# Create your models here.
class Comment(models.Model):
	user = models.CharField(max_length=50)
	Tipo_de_peticion=models.CharField(max_length=100)
	comment = models.TextField()
	idNegocio=models.IntegerField()
	idUser = models.IntegerField(blank=True,null=True)
	#archivo=models.ImageField(upload_to='imagenes',blank=True,null=True,help_text='Puede agregar una Imagen o Archivo')
	fecha_denuncia=models.DateTimeField(auto_now=True)
	estado=models.IntegerField(default=0)
	def __unicode__(self):
		return self.user

