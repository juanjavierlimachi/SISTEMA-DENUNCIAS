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
# Create your views here.
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
	hoy=datetime.now()
	hoy = hoy.time()
	hoy=hoy.strftime('%M')
	ingreso_ultimo=usuario.last_login.time()
	ingreso_ultimo=ingreso_ultimo.strftime('%M')
	tiempo_espera = int(hoy) - int(ingreso_ultimo)
	#tiempo_espera=tiempo_espera
	print 'jajajaj',tiempo_espera
	#if tiempo_espera>=5:
		#return HttpResponseRedirect('/cerrar/')
	if request.user.is_staff and request.user.is_active and request.user.is_superuser:
		#denuncias=Comment.objects.all().order_by('-id')
		return render_to_response('usuario/ingreso.html',{'usuario':usuario},context_instance=RequestContext(request))
	else:
		#user.is_staff decimoe q el administrador le dio el permiso para subsustema secretria
		if request.user.is_active and request.user.is_staff:
			return render_to_response('inspector/inicio_inspector.html',{'usuario':usuario},context_instance=RequestContext(request))
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
			seg.save()
			if request.user.is_staff and request.user.is_active and request.user.is_superuser:
		#denuncias=Comment.objects.all().order_by('-id')
				return render_to_response('usuario/ingreso.html',{'usuario':usuario},context_instance=RequestContext(request))
			else:
		#user.is_staff decimoe q el administrador le dio el permiso para subsustema secretria
				if request.user.is_active and request.user.is_staff:
					return render_to_response('inspector/inicio_inspector.html',{'usuario':usuario},context_instance=RequestContext(request))
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
			return render_to_response('cliente/cliente.html',{'cod':cod,'uu':uu},context_instance=RequestContext(request))

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
	return render_to_response('usuario/datos.html',{'usuario':usuario,'dato':dato,'aux':aux},context_instance=RequestContext(request))
 
@login_required(login_url='/')
def serrar(request):
	logout(request)
	return HttpResponseRedirect('/')
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
		return HttpResponse("El Usuario ya exsiste Intente con otro nombre.")
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
	dato=Perfiles.objects.all()
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
			return HttpResponse("El usuario a sido Deshabilitado")
		else:
			return HttpResponse("Haga click en la casilla para Desactivar esta cuenta")
	except User.DoesNotExist:
		return HttpResponse("Haga click en la casilla para Desactivar esta cuenta")
@login_required(login_url='/')
def VolverHavilitar(request):
	try:
		nombre=request.GET['nombre']
		staff=request.GET['activo']
		user=User.objects.get(username=nombre)
		if staff =='on':
			user.is_staff=True
			user.is_active=True
			user.save()
			return HttpResponse("El usuario a sido Habilitado.")
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



# from datetime import datetime
# import os
# from subprocess import Popen, PIPE, STDOUT
# def crearBackup(request):
# 	#try:
# 	command = "mysqldump -h localhost -u root --password="" denuncia"
# 		#command= Popen('mysqldump -h localhost -P 3306 -u -root denuncia | mysql -h localhost -P 3306 -u root denuncia', shell=True)
# 	today = datetime.now()
# 	fecha = today.strftime("%d %m %Y")
# 	#print "esta es la fecha",fecha
# 	#ficheor de salida
# 	file="backup_servidor_"+fecha
# 	command = command+file+".sql"
# 	os.system(command)
# 	#except:
# 	return HttpResponse()


import ConfigParser
import os
import time
import getpass

def crearBackup(request):
    #print "Enter user:"
    user = "root"

    #print "Password will not be visible:"
    #password = getpass.getpass()
    password = ""

    #print "Enter host:"
    host = "localhost:8080"

    #print "Enter database name:"
    database = "denuncia"


    filestamp = time.strftime('%Y-%m-%d')
    #os.popen("mysqldump -u %s -p%s -h %s -e --opt -c %s | sql -G > %s.sql" % (user,password,host,database,database+"_"+filestamp))
    comant=os.popen("mysqldump -h 127.0.0.1 --u=root --password="" denuncia >copias"+filestamp+".sql")
    #comant=filestamp+".sql"
    #print command
    #os.system(comant)
    return HttpResponse()


