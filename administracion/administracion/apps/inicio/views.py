from django.shortcuts import render, render_to_response,redirect
from django.views.generic import TemplateView, FormView
from django.contrib.auth.decorators import login_required
from django.template import RequestContext
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse, HttpResponse,HttpResponseRedirect
from administracion.apps.cliente.models import Comment
from administracion.apps.cliente.forms import Commentform
from .forms import *
from administracion.apps.negocio.models import multa
from administracion.apps.inspector.forms import *
from administracion.apps.inspector.forms import *
from django.core import serializers
from administracion.apps.usuario.models import *
import os
import datetime
from datetime import *
import StringIO
from xhtml2pdf import pisa
from django.template.loader import render_to_string
from datetime import date
#from django.utils.timesince import timesince
# Create your views here.
class AvisosDenuncias(TemplateView):
	def get(self, request, *args, **kwargs):
		#idNe=request.GET.get('id')#puede ser una opcion para enviar el id del negocio
		#nego=Negocio.objects.get(id=idNe)
		#print "este es el negocio:",nego
		#if request.session.get('name'):
		cuantaDenuncias=Comment.objects.all().count()
		comments=Comment.objects.all().order_by("-id")[0:5]
		hoy=date.today()
		print "este es el dia",hoy

		countDia=Comment.objects.filter(fecha_denuncia__range=(hoy,hoy)).count()
		print "Denuncias",countDia
			#este es el formato de la url en el QR http://localhost:8000/denuncias/?id=23
		dic = {
				#'ne':request.GET.get('id'),#asi mento el num envio en id del negocio mediante
			'cont':cuantaDenuncias,
			'form': Commentform(),
			'comments':comments,
			'user':request.user
		}
		return render(request, 'inicio/denuncias.html', dic)
		
	def post(self, request, *args, **kwargs):
		"""Comment.objects.create(
				user = request.session['name'],
				comment = request.POST['comment'],
				idNegocio = request.POST['idNegocio']
			)"""
		return redirect('/AvisosDenuncias/')
class AvisosNotificaciones(TemplateView):
	def get(self, request, *args, **kwargs):
		multas=multa.objects.all().order_by("-id")[0:4]
		contexto=request.user
		contarmultas = multa.objects.all().count()
		dic = {
			'cont':contarmultas,
			'user':contexto,
			'form': FormMulta(),
			'multa':multas
		}
		return render(request, 'inicio/Notificaciones.html', dic)
	def post(self, request, *args, **kwargs):
		print 'as guardado la informacion'
		multa.objects.create(
				idUser = request.POST['idUser'],
				Usuario = request.POST['Usuario'],
				descripcion = request.POST['descripcion'],
				Codigo = request.POST['Codigo'],
				fecha_presentacion=request.POST['fecha_presentacion'],
				hora = request.POST['hora']
			)
		return redirect('/privado/')
@login_required(login_url='/')
def EnviarNotificacion(request):
	return render_to_response('inicio/formAvisos.html',{},context_instance=RequestContext(request))
@login_required(login_url='/')
def Notiicaciones(request,id):
	return render_to_response('inicio/NotificacionesNegocio.html',{},context_instance=RequestContext(request))
@login_required(login_url='/')
def RegistroCronograma(request):
	datos=Cronograma.objects.all().order_by('-id')[0:1]
	if request.method == 'POST':
		Usuario=Cronograma(Usuario=request.user)
		form=FormCronograma(request.POST,instance=Usuario)
		if form.is_valid():
			form.save()
			return HttpResponseRedirect('/Cronograma/')
	else:
		form=FormCronograma()
	return render_to_response('inicio/registroConograma.html',{'form':form,'datos':datos},context_instance=RequestContext(request))
@login_required(login_url='/')
def EditarCronograma(request,id):
	datos=Cronograma.objects.all().order_by('-id')[0:1]
	cronograma=Cronograma.objects.get(id=id)
	if request.method == 'POST':
		#Usuario=Cronograma(Usuario=request.user)
		form=FormCronograma(request.POST,instance=cronograma)
		if form.is_valid():
			form.save()
			return HttpResponseRedirect('/Cronograma/')
	else:
		form=FormCronograma(instance=cronograma)
	return render_to_response('inicio/registroConograma.html',{'form':form,'datos':datos},context_instance=RequestContext(request))

@login_required(login_url='/')
def datosDenuncia(request,id):
	nego=Negocio.objects.get(id=int(id))
	datosN=multa.objects.filter(Codigo=int(id)).order_by('-id')[0:50]
	return render_to_response('inicio/DatosNegocio.html',{'datosN':datosN,'nego':nego},context_instance=RequestContext(request))

@login_required(login_url='/')
def allNotDeUnNegocio(request,id):
	negocio=Negocio.objects.get(id=int(id))
	todasN=multa.objects.filter(Codigo=int(id)).order_by('-id')
	return render_to_response('inicio/allNotDeUnNegocio.html',{'todasN':todasN,'negocio':negocio},context_instance=RequestContext(request))
@login_required(login_url='/')
def detDenuncias(request,id):
	dni=int(id)
	denuncia=multa.objects.filter(id=int(id))
	nombre=Negocio.objects.all()
	return render_to_response('inicio/DenunciaNegocio.html',{'denuncia':denuncia,'nombre':nombre,'dni':dni},context_instance=RequestContext(request))
@login_required(login_url='/')
def ImprimirNotificacion(request,id):
	cod=int(id)
	denuncia=multa.objects.filter(id=int(id))
	nombre=Negocio.objects.all()
	bs=0.0
	try:
		bs=Cobro.objects.get(idNotificacion=cod)
		pass
	except Cobro.DoesNotExist:
		pass
	hoy=date.today()
	hoy=hoy.strftime('%d-%m-%Y')
	html=render_to_string("inicio/reportesDiarios.html",{'pagesize':'later','denuncia':denuncia,'nombre':nombre,'cod':cod,'bs':bs,'hoy':hoy},context_instance=RequestContext(request))
	return generar_pdf(html)

@login_required(login_url='/')
def soloActivos(request):
	perfil=Perfiles.objects.all()
	user=User.objects.all()
	tota_user=Perfiles.objects.all().count()
	cli=request.user
	html=render_to_string('inicio/usuariosActivos.html',{'pagesize':'later','cli':cli,'perfil':perfil,'user':user,'tota_user':tota_user},context_instance=RequestContext(request))
	return generar_pdf(html)

def generar_pdf(html):
	resultado=StringIO.StringIO()
	pdf=pisa.pisaDocument(StringIO.StringIO(html.encode("UTF:8")),resultado)
	if not pdf.err:
		return HttpResponse(resultado.getvalue(),'application/pdf')
	return HttpResponse("Error al generar el reporte")
@login_required(login_url='/')
def imprimirNegociosPorId(request, id):
	aux=Negocio.objects.filter(categoria=int(id)).count()
	elecion = Negocio.objects.filter(categoria=int(id)).order_by('propietario')
	html=render_to_string('inicio/imprimirNegociosPorId.html',{'pagesize':'A4','elecion':elecion,'aux':aux},context_instance=RequestContext(request))
	return generar_pdf(html)
@login_required(login_url='/')
def imprimirUser(request):
	perfil=Perfiles.objects.all()
	user=User.objects.all()
	tota_user=Perfiles.objects.all().count()
	html=render_to_string('inicio/imprimirUser.html',{'pagesize':'A4','perfil':perfil,'user':user,'tota_user':tota_user},context_instance=RequestContext(request))
	return generar_pdf(html)
@login_required(login_url='/')
def ImprecionDenuncia(request, id, fin):
	i=id
	f=fin
	denuncia = multa.objects.filter(fecha_notificacion__range=(i,f))
	nombre=Negocio.objects.all()
	hoy=date.today()
	hoy=hoy.strftime('%d-%m-%Y')
	html=render_to_string('inicio/imprecion.html',{'pagesize':'later','i':i,'f':f,'denuncia':denuncia,'nombre':nombre,'hoy':hoy},context_instance=RequestContext(request))
	return generar_pdf(html)
@login_required(login_url='/')
def ImprecionDenunciaClientes(request, id, fin):
	inicio=id
	fin=fin
	reclamos=Comment.objects.filter(fecha_denuncia__range=(inicio,fin))
	negocio=Negocio.objects.all()
	html = render_to_string('negocio/reclamosAdmin.html',{'pagesize':'A4','inicio':inicio,'fin':fin,'reclamos':reclamos,'negocio':negocio},context_instance=RequestContext(request))
	return generar_pdf(html)
def InprecionReclamoDenuncias(request, id):
	cod=int(id)
	reclamos=Comment.objects.filter(id=int(id))
	negocio=Negocio.objects.all()
	hoy=date.today()
	hoy=hoy.strftime('%d-%m-%Y')
	html = render_to_string('negocio/InprecionDenuncias.html',{'pagesize':'A4','cod':cod,'reclamos':reclamos,'negocio':negocio,'hoy':hoy},context_instance=RequestContext(request))
	return generar_pdf(html)
@login_required(login_url='/')
def InprecionReclamo(request, id):
	reclamos=Comment.objects.filter(id=int(id))
	negocio=Negocio.objects.all()
	html = render_to_string('negocio/reclamosAdmin.html',{'pagesize':'A4','reclamos':reclamos,'negocio':negocio},context_instance=RequestContext(request))
	return generar_pdf(html)
@login_required(login_url='/')
def DetalleDenuncias(request, id):
	nego=Negocio.objects.all()
	denuncia=Comment.objects.filter(id=int(id))
	return render_to_response('inicio/DatosDenunciaCliente.html',{'denuncia':denuncia,'nego':nego},context_instance=RequestContext(request))
@login_required(login_url='/')
def VerNotificacionesInspector(request,id):
	inspecciones=multa.objects.filter(idUser=int(id)).order_by('-id')[0:20]
	print inspecciones
	nego=Negocio.objects.all()
	return render_to_response('inicio/MisInspecciones.html',{'inspecciones':inspecciones,'nego':nego},context_instance=RequestContext(request))
@login_required(login_url='/')
def TodaslasNotificaciones(request):
	hoy=datetime.now()
	hoy=hoy.strftime('%Y-%m-%d')
	datos=multa.objects.filter(fecha_notificacion__gte = hoy)
	conta=multa.objects.filter(fecha_notificacion__gte = hoy).count()
	return render_to_response('inicio/TodaslasNotificaciones.html',{'datos':datos,'conta':conta,'hoy':hoy},context_instance=RequestContext(request))
@login_required(login_url='/')
def TodaslasDenuncias(request):
	hoy=datetime.now()
	hoy=hoy.strftime('%Y-%m-%d')
	datos=Comment.objects.filter(fecha_denuncia__gte = hoy)
	conta=Comment.objects.filter(fecha_denuncia__gte = hoy).count()
	return render_to_response('inicio/TodaslasComentarios.html',{'datos':datos,'conta':conta,'hoy':hoy},context_instance=RequestContext(request))

class ConsultarDenunciaFecha(TemplateView):
	def get(self, request, *args, **kwargs):
		fechas = request.GET['fe']
		fin=request.GET['fn']
		#fecha= fecha.strftime("%Y/%m/%d")ponemos un formato a la fecha __gte es >=
		#consulta = multa.objects.filter(fecha_notificacion__gte=fechas,fecha_notificacion__Ite=fin)
		consulta = multa.objects.filter(fecha_notificacion__range=(fechas,fin))
		print 'Esta es la fecha:',consulta
		data = serializers.serialize('json', consulta,fields=('id','Usuario','fecha_notificacion','descripcion','fecha_presentacion','hora'))
		return HttpResponse(data, 'application/json')

class ConsultarDenunciaClienteFecha(TemplateView):
	def get(self, request, *args, **kwargs):
		fechas = request.GET['fe']
		fin=request.GET['fn']
		#fecha = fecha.strftime("%Y/%m/%d")ponemos un formato a la fecha __gte es >=
		#consulta = multa.objects.filter(fecha_notificacion__gte=fechas,fecha_notificacion__Ite=fin)
		consulta = Comment.objects.filter(fecha_denuncia__range=(fechas,fin))
		print 'Esta es la fecha:',consulta
		data = serializers.serialize('json', consulta,fields=('id','user','Tipo_de_peticion','comment','fecha_denuncia','idNegocio'))
		return HttpResponse(data, 'application/json')
@login_required(login_url='/')
def Registertype(request):
	if request.method=='POST':
		print request.POST
		forms=FormTipo(request.POST)
		if forms.is_valid():
			forms.save()
			return HttpResponse("Registro Exitoso")
	else:
		forms=FormTipo()
	return render_to_response('inicio/Registertype.html',{'forms':forms},context_instance=RequestContext(request))
@login_required(login_url='/')
def MisdatosAdmin(request):
	user=request.user
	if request.user.is_staff and request.user.is_active and request.user.is_superuser:
		return render_to_response('inicio/MisdatosAdmin.html',{'user':user},context_instance=RequestContext(request))
	else:
		return HttpResponse("Ud no esta autorizado para ver la informacion.")
@login_required(login_url='/')
def MisDenunciasAdmin(request, id):
	ind=int(id)
	n=Negocio.objects.all().order_by('-id')
	user=request.user
	datos=Comment.objects.filter(idUser=ind).order_by('-id')
	print datos
	return render_to_response('inicio/MisDenunciasAdmin.html',{'datos':datos,'n':n},context_instance=RequestContext(request))
#MisNotificacionesAdmin
@login_required(login_url='/')
def MisNotificacionesAdmin(request, id):
	ind=int(id)
	n=Negocio.objects.all().order_by('-id')
	user=request.user
	datos=multa.objects.filter(idUser=ind).order_by('-id')
	print datos
	return render_to_response('inicio/MisNotificacionesAdmin.html',{'datos':datos,'n':n},context_instance=RequestContext(request))

def VerPorDia(request, id):
	num=int(id)
	print "ahu esta",num
	hoy=date.today()
	print "Fecha de hoy",hoy
	hoy=hoy.strftime('%Y-%m-%d')
	result=date.today()-timedelta(days=num)
	result=result.strftime('%Y-%m-%d')
	datos=multa.objects.filter(fecha_notificacion__gte = result)
	conta=multa.objects.filter(fecha_notificacion__gte = result).count()
	return render_to_response('inicio/VerPorDia.html',{'datos':datos,'conta':conta,'result':result},context_instance=RequestContext(request))

def VerPorDiaDenuncias(request, id):
	num=int(id)
	print "ahu esta",num
	hoy=date.today()
	print "Fecha de hoy",hoy
	hoy=hoy.strftime('%Y-%m-%d')
	result=date.today()-timedelta(days=num)
	result=result.strftime('%Y-%m-%d')
	datos=Comment.objects.filter(fecha_denuncia__gte = result)
	conta=Comment.objects.filter(fecha_denuncia__gte = result).count()
	return render_to_response('inicio/VerPorDiaDenuncias.html',{'datos':datos,'conta':conta,'result':result},context_instance=RequestContext(request))

