#encoding:utf-8
from django.shortcuts import render, render_to_response
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext
from django.contrib.auth.forms import User
from .forms import *#aki estoy importando todos mis formularios de mi achivo form.py
from .models import *##aki estoy importando todos mis models de mi achivo models.py
from django.views.generic import TemplateView, FormView,ListView,CreateView
from django.core.urlresolvers import reverse_lazy
from administracion.apps.inicio.models import Cronograma
from django.db.models import Q
from administracion.apps.cliente.models import *
from administracion.apps.negocio.models import *
from datetime import datetime
from administracion.apps.inspector.forms import *
import datetime
# Create your views here.
def ValidarUser(request):
	usuario=request.POST['user']
	clave=request.POST['pass']
	acceso=authenticate(username=usuario,password=clave)
	if acceso:
		return HttpResponse("Ud. puede Restaurar o impotar la base de datos")
	else:
		#return HttpResponse("Aceso Incorrecto Intente nuevamente Gracias")
		pass
def Usuario(request):
	if not request.user.is_anonymous():
		return HttpResponseRedirect('/privado/')
	if request.method=='POST':
		formulario=AuthenticationForm(request.POST)
		if formulario.is_valid:
			usuario=request.POST['username']
			clave=request.POST['password']
			acceso=authenticate(username=usuario,password=clave)
			if acceso is not None:
				#si es el super usuario ingresa a privado
				if acceso.is_active and acceso.is_superuser and acceso.is_staff:
					login(request,acceso)
					return HttpResponseRedirect('/privado/')
				else:
					if acceso.is_active and acceso.is_staff:
						login(request,acceso)
						return HttpResponseRedirect('/privado/')
					else:
						if acceso.is_active:
							login(request,acceso)
							return HttpResponseRedirect('/privado/')
						else:
							return render_to_response('usuario/noactivo.html',context_instance=RequestContext(request))
			else:
				return render_to_response('usuario/nousuario.html',context_instance=RequestContext(request))
	else:
		formulario=AuthenticationForm()
	return render_to_response('index.html',{'formulario':formulario},context_instance=RequestContext(request))
@login_required(login_url='/')
def ingreso(request):
	usuario=request.user
	# hoy=datetime.now()
	# hoy = hoy.time()
	# hoy=hoy.strftime('%M')
	# ingreso_ultimo=usuario.last_login.time()
	# ingreso_ultimo=ingreso_ultimo.strftime('%M')
	# tiempo_espera = int(hoy) - int(ingreso_ultimo)
	#tiempo_espera=tiempo_espera
	
	#if tiempo_espera>=5:
		#return HttpResponseRedirect('/cerrar/')
	if request.user.is_staff and request.user.is_active and request.user.is_superuser:
		#denuncias=Comment.objects.all().order_by('-id')
		return render_to_response('usuario/ingreso.html',{'usuario':usuario},context_instance=RequestContext(request))
	else:
		#user.is_staff decimoe q el administrador le dio el permiso para subsustema secretria
		if request.user.is_active and request.user.is_staff:
			conogramas=Cronograma.objects.all().order_by('-id')[0:3]
			return render_to_response('inspector/inicio_inspector.html',{'usuario':usuario,'conogramas':conogramas},context_instance=RequestContext(request))
		else:
			USER=request.user.id
			print "Este es el Perfil:",USER
			try:
				dto=Perfiles.objects.get(usuario=USER)
				if dto:
					return render_to_response('inspector/Activar.html',{'usuario':usuario},context_instance=RequestContext(request))
				else:
					return HttpResponse("Posisione su camara al Codigo QR")
			except Perfiles.DoesNotExist:
				return HttpResponse("Posisione su camara al Codigo QR")
			
			#return render_to_response('inspector/Activar.html',{'usuario':usuario},context_instance=RequestContext(request))
			# if request.user.is_active:
			# 	conogramas=Cronograma.objects.all().order_by('-id')[0:1]
			# 	return render_to_response('inspector/inicio_inspector.html',{'usuario':usuario,'conogramas':conogramas},context_instance=RequestContext(request))
def ingresoQR(request, id):#accediendo desde el Codigo QR del Negocio
	fecha=datetime.datetime.now()
	fecha=fecha.strftime('%Y-%m-%d')
	if request.user.is_anonymous() and not request.user.is_authenticated():
		cod=int(id)
		uu=request.user
		return render_to_response('cliente/cliente.html',{'cod':cod,'uu':uu},context_instance=RequestContext(request))
	else:
		if request.user.is_authenticated() and request.user.is_staff:
			cod=int(id)
			usuario=request.user
			idNegocio=int(id)
			inspector=request.user.id
			seg=Seguimiento()
			seg.user_id=inspector
			seg.neg_id=idNegocio
			#seg.save()
			Negocio.objects.filter(id=id).update(estadoD=0)
			if request.user.is_staff and request.user.is_active and request.user.is_superuser:

				return render_to_response('inicio/Notificaciones.html',{'usuario':usuario,'cod':int(id),'fecha':fecha},context_instance=RequestContext(request))
			else:
		#user.is_staff decimoe q el administrador le dio el permiso para subsustema secretria
				if request.user.is_active and request.user.is_staff:
					conogramas=Cronograma.objects.all().order_by('-id')[0:3]
					contexto=request.user
					multas=multa.objects.all().order_by("-id")[0:3]
					dic = {
						'cod':cod,
						'conogramas':conogramas,
						'user':contexto,
						'form': FormMulta(),
						'multa':multas,
						'fecha':fecha,
						'estado':True
					}
					return render(request, 'inspector/formMultas.html', dic)
					#return render_to_response('inspector/formMultas.html',{'usuario':usuario,'conogramas':conogramas,dic},context_instance=RequestContext(request))
				else:
					USER=request.user.id
					try:
						dto=Perfiles.objects.get(usuario=USER)
						if dto:
							return render_to_response('inspector/Activar.html',{'usuario':usuario},context_instance=RequestContext(request))
						else:
							return HttpResponse("Posisione su camara al Codigo QR")
					except Perfiles.DoesNotExist:
						return HttpResponse("Posisione su camara al Codigo QR")
		else:#Viene aki si el usuario ya realizo una denuncia algunaves!!!
			cod=int(id)
			uu=request.user
			denuncias=Comment.objects.filter(idUser=int(request.user.id)).order_by("-id")
			print "Holas:",denuncias
			return render_to_response('cliente/cliente.html',{'cod':cod,'uu':uu,'denuncias':denuncias},context_instance=RequestContext(request))

class nuevoUser(FormView):
	#usuario=request.cleaned_data['username']
	#templeta_name es para enviar un atributo form para mi formulariode registro
	template_name = 'usuario/nuevo.html'
	#con form_class indico el formularios estoy utilizando
	#model = User 
	form_class=UserForm
	success_url = reverse_lazy('nuevoUser')
	def form_valid(self,form):
		user=form.save()
		perfil=Perfiles()
		perfil.usuario = user
		#perfil.nombre=form.cleaned_data['nombre']
		perfil.ci=form.cleaned_data['ci']
		#perfil.telefono=form.cleaned_data['telefono']
		perfil.save()
		#crear_grupo=Group.objects.get_or_create(name='Cliente')
		#usuario.groups.add(usuario)
		return super(nuevoUser, self).form_valid(form)
@login_required(login_url='/')
def Datos(request,id):
	user=request.user
	usuario=User.objects.filter(id=id)
	aux=int(id)
	dato=Perfiles.objects.all()
	return render_to_response('usuario/datosUser.html',{'usuario':usuario,'dato':dato,'aux':aux},context_instance=RequestContext(request))
 
@login_required(login_url='/')
def serrar(request):
	logout(request)
	return HttpResponseRedirect('/')
@login_required(login_url='/')
def Finalizar(request):
	logout(request)
	return HttpResponse("Muchas gracias por usar nuestra Pagina Web, Vuelve pronto!!!")
@login_required(login_url='/')
def editar_perfil(request):
	if request.method=='POST':
		user_form=UserForms(request.POST,instance=request.user)
		perfil_form=formPerfiles(request.POST,instance=request.user.perfil)
		if user_form.is_valid() and perfil_form.is_valid():
			user_form.save()
			perfil_form.save()
			return HttpResponseRedirect('/')
	else:
		user_form=UserForms(instance=request.user)
		perfil_form=formPerfiles(instance=request.user.perfil)
	return render_to_response('usuario/datossss.html',{'user_form':user_form,'perfil_form':perfil_form},context_instance=RequestContext(request))

@login_required(login_url='/')
def editar_perfil_Inspector(request):
	if request.method=='POST':
		user_form=UserForms(request.POST,instance=request.user)
		perfil_form=formPerfiles(request.POST,instance=request.user.perfil)
		if user_form.is_valid() and perfil_form.is_valid():
			user_form.save()
			perfil_form.save()
			return HttpResponseRedirect('/')
	else:
		user_form=UserForms(instance=request.user)
		perfil_form=formPerfiles(instance=request.user.perfil)
	return render_to_response('usuario/datos_Inspector.html',{'user_form':user_form,'perfil_form':perfil_form},context_instance=RequestContext(request))
@login_required(login_url='/')
def verificacion(request):
	use=request.GET['use']
	try:
		us=User.objects.get(username=use)
		return HttpResponse("El Nombre de Usuario ya exsiste Intente con otro nombre.")
	except User.DoesNotExist:
		return HttpResponse()
@login_required(login_url='/')
def buscarUsuario(request):
	if request.method=='POST':
		return HttpResponse("echo")
	else:
		texto=request.GET['textoo']
		busqueda = (
				Q(username__icontains=texto) |
				Q(first_name__icontains=texto) |
				Q(last_name__icontains=texto)
			)
		resultados = User.objects.filter(busqueda).distinct()
		#resultados=User.objects.filter(username__icontains=texto).distinct()
		html="<ul class='ul_lista'>"
		for i in resultados:
			html=html+"<li><a href='/datosUsuario/"+str(i.id)+"/'>"+i.username+"</a></li>"
		html=html+"</ul>"
		return HttpResponse(html)

@login_required(login_url='/')
def datosUsuario(request, id):
	usuario=User.objects.filter(id=id)
	userr=request.user
	dato=Perfiles.objects.filter(usuario_id=int(id))
	return render_to_response('usuario/datos.html',{'usuario':usuario,'dato':dato,'userr':userr},context_instance=RequestContext(request))
@login_required(login_url='/')
def editarcontracenia(request,id):
	#id_user=int(id)
	id_user=User.objects.get(id=int(id))
	print id_user
	if request.method=='POST':
		forms=CambioForm(request.POST)
		if forms.is_valid():
			con=request.POST['Nueva_Contracenia']
			fir=request.POST['Confirmacion']
			id_user.set_password(con)
			id_user.save()
			return HttpResponseRedirect('/')
	else:
		forms=CambioForm()
	return render_to_response('usuario/cambio.html',{'id_user':id_user,'forms':forms},context_instance=RequestContext(request))
@login_required(login_url='/')
def EditarcontraceniaInspector(request,id):
	#id_user=int(id)
	id_user=User.objects.get(id=int(id))
	print id_user
	if request.method=='POST':
		forms=CambioForm(request.POST)
		if forms.is_valid():
			con=request.POST['Nueva_Contracenia']
			fir=request.POST['Confirmacion']
			id_user.set_password(con)
			id_user.save()
			return HttpResponseRedirect('/')
	else:
		forms=CambioForm()
	return render_to_response('usuario/EdirPassIns.html',{'id_user':id_user,'forms':forms},context_instance=RequestContext(request))


@login_required(login_url='/')
def ActivarCuenta(request):
	user=request.user
	use=request.GET['use']
	try:
		us=Perfiles.objects.get(ci=use)
		user.is_staff=True
		#user.is_active=True
		user.save()
		if not user.is_active:
			return HttpResponse("Su cuenta a sido Deshabilitado. consulte con el administrador")
		return HttpResponseRedirect('/privado/')
	except Perfiles.DoesNotExist:
		return HttpResponse("El Usuario no esta activo en el sistema por favor Verifique sus datos o de lo cantrario consulte con el administrador del sistema, Gracias.")
@login_required(login_url='/')
def DasactivarUser(request):
	try:
		nombre=request.GET['nombre']
		staff=request.GET['staff']
		user=User.objects.get(username=nombre)
		if staff=='on':
			user.is_staff=False
			user.is_active=False
			user.save()
			return HttpResponse("El Usuario a sido Deshabilitado")
		else:
			return HttpResponse("Haga click en la casilla para Desactivar esta cuenta")
	except User.DoesNotExist:
		return HttpResponse("Haga click en la casilla para Desactivar esta cuenta")
@login_required(login_url='/')
def VolverHavilitar(request):
	try:
		nombre=request.GET['nombre']
		
		user=User.objects.get(username=nombre)
		print user.id
		if request.GET['op']== 'ins':
			user.is_staff=True
			user.is_active=True
			user.is_superuser=False
			user.save()
			return HttpResponse("El Usuario a sido Habilitado como Inspector.")
		if request.GET['op']== 'sp':
			user.is_staff=True
			user.is_active=True
			user.is_superuser=True
			user.save()
			return HttpResponse("El Usuario a sido Habilitado como Administrador.")
		else:
			return HttpResponse("Haga click en la casilla para Habilitado esta cuenta")
	except User.DoesNotExist:
		return HttpResponse("Haga click en la casilla para Habilitado esta cuenta")
@login_required(login_url='/')
def verUsers(request):
	perfil=Perfiles.objects.all()
	user=User.objects.all()
	tota_user=Perfiles.objects.all().count()
	cli=request.user
	return render_to_response('usuario/todos_usuarios.html',{'cli':cli,'perfil':perfil,'user':user,'tota_user':tota_user},context_instance=RequestContext(request))

def datosRegistroUser(request, id):
	user=User.objects.get(id=int(id))
	name=request.user
	return render_to_response('usuario/datosRegistroUser.html',{'user':user,'name':name},context_instance=RequestContext(request))
def UserDenuncias(request, id):
	denuncias=Comment.objects.filter(idUser=id)
	print denuncias
	return render_to_response('usuario/UserDenuncias.html',{'denuncias':denuncias},context_instance=RequestContext(request))
def UserNotificaciones(request, id):
	noti=multa.objects.filter(idUser=int(id))
	print noti
	return render_to_response('usuario/UserNotificaciones.html',{'noti':noti},context_instance=RequestContext(request))


import time
import os
import MySQLdb
import shutil
def crearBackup(request):
	RUTA_PROYECTO=str(os.path.dirname(os.path.realpath(__file__)))
	command = "mysqldump -h localhost -u root denuncia"
	fecha=time.strftime("%Y-%m-%d")

# Fichero de salida
	file = "backup_"+fecha

	command = command+"> bd_"+file+".sql"

	os.system(command)
	#os.path.isdir(os.system(command))
	src = 'G:\sistemasDenuncias/administracion/bd_'+file+'.sql'
	dst = 'G:\sistemasDenuncias/administracion/administracion/media/bd_'+file+'.sql'
	shutil.copy(src, dst)
	return HttpResponse("Respaldo de la base de datos correctamente!!!<a href='/media/bd_"+file+".sql' download='bd_"+file+".sql'>Descargar</a>")

def ImportarBackup(request):
	if request.method=='POST':
		forms=dbArchivoForm(request.POST,request.FILES)
		if forms.is_valid():
			estado=False
			dato=str(request.FILES['base'])
			print dato
			command = "mysql -h localhost -u root denuncia"
			command=command+"<"+dato+""
			os.system(command)
			estado=True
			if estado == True:
				return render_to_response('usuario/respaldo.html',{'forms':forms,'estado':True},context_instance=RequestContext(request))
	else:
		forms=dbArchivoForm()
	return render_to_response('usuario/respaldo.html',{'forms':forms},context_instance=RequestContext(request))
