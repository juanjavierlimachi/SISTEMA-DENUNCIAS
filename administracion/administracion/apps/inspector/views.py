from django.shortcuts import render,render_to_response,redirect
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.template import RequestContext
from administracion.apps.negocio.models import *
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse, HttpResponse
from administracion.apps.negocio.models import multa
from django.views.generic import TemplateView, FormView
from django.contrib.auth.forms import User
from administracion.apps.usuario.models import *
from .forms import *
from django.db.models import Q
from administracion.apps.negocio.models import Negocio
from administracion.apps.cliente.models import *
from administracion.apps.cliente.forms import *
# Create your views here.
@login_required(login_url='/')
def perfilinspector(request,id):
	perfil=User.objects.filter(id=id)
	dato=Perfiles.objects.all()
	return render_to_response('inspector/perfil.html',{'perfil':perfil,'dato':dato},context_instance=RequestContext(request))
@login_required(login_url='/')
def buscarNegocio(request):
    if request.method=="POST":
    	texto=request.POST['texto']
    	dato=int(texto)
    	negocios=Negocio.objects.all()
    	cont=0
    	negocio=[]
    	for i in negocios:
    		if dato==i.id:
    			cont=1
    			negocio=Negocio.objects.get(id=int(texto))
    	#acceso.is_active and acceso.is_superuser and acceso.is_staff:
        		return render_to_response('inspector/resultadoBusNegocio.html',{'negocio':negocio},context_instance=RequestContext(request))
        		break
        if cont==0:
        	return HttpResponse('No existe')
    else:
        texto=request.GET["texto"]
        print texto
        busqueda=(
            Q(propietario__icontains=texto) |
            Q(propietario__icontains=texto) |
            Q(propietario__icontains=texto)
        )
        datos=Negocio.objects.filter(busqueda).distinct()
        html="<ul class='ul_lista'>"
        for i in datos:
            html=html+"<li><a href='/DetalleNegocio/"+str(i.id)+"/'>"+i.propietario+"</a></li>"
        html=html+"<ul>"
        return HttpResponse(html)
@login_required(login_url='/')
def DetalleNegocio(request, id):
	negocio=Negocio.objects.get(id=id)
	return render_to_response('inspector/resultadoBusNegocio.html',{'negocio':negocio},context_instance=RequestContext(request))

class emitirInfraccion(TemplateView):
	def get(self, request, *args, **kwargs):
		contexto=request.user
		multas=multa.objects.all().order_by("-id")[0:3]
		dic = {
			'user':contexto,
			'form': FormMulta(),
			'multa':multas
		}
			#una ves optenido el nombre enviamos al templete cliente.html
		return render(request, 'inspector/formMultas.html', dic)
	def post(self, request, *args, **kwargs):
		multa.objects.create(
				idUser = request.POST['idUser'],
				Usuario = request.POST['Usuario'],
				descripcion = request.POST['descripcion'],
				Codigo = request.POST['Codigo'],
				fecha_presentacion=request.POST['fecha_presentacion'],
				hora = request.POST['hora']
			)
		#aki redirecciono a la url emitirInfraccion despues de aver ingresado los datos
		return redirect('/emitirInfraccion/')

@csrf_exempt
def crear_notificacion(request):
	m=multa()
	m.idUser=request.POST['idUser']
	m.Usuario=request.POST['Usuario']
	m.descripcion=request.POST['descripcion']
	m.Codigo=request.POST['Codigo']
	m.fecha_presentacion=request.POST['fecha_presentacion']
	m.hora=request.POST['hora']
	m.save()
	ddd=int(request.POST['Codigo'])
	print ddd
	cont=multa.objects.all().count()
	response = JsonResponse({'cont':cont,
							'idUser':request.POST['idUser'],
							'Usuario':request.POST['Usuario'],
							'descripcion':request.POST['descripcion'],
							'Codigo':request.POST['Codigo'],
							'fecha_presentacion':request.POST['fecha_presentacion'],
							'hora': request.POST['hora']})
	#esto informacion mandamos al server 
	Negocio.objects.filter(id=ddd).update(estadoN=1)
	#up.save()
	return HttpResponse(response.content)
class AvisosDenunciasCliente(TemplateView):
	def get(self, request, *args, **kwargs):
		comments=Comment.objects.all().order_by("-id")[0:5]
		user=request.user
		dic = {
			'form': Commentform(),
			'comments':comments,
			'user':user
				#'nego':nego,
				#'idNe':idNe
		}
			#una ves optenido el nombre enviamos al templete cliente.html
		return render(request, 'inspector/denunciasCliente.html', dic)
		
	def post(self, request, *args, **kwargs):
		"""Comment.objects.create(
				user = request.session['name'],
				comment = request.POST['comment'],
				idNegocio = request.POST['idNegocio']
			)"""
		return redirect('/Denuncias-cliente/')

@login_required(login_url='/')
def VerDenunciasInspector(request,id):
	user=User.objects.get(id=int(id))
	notificacion=Comment.objects.all().order_by('-id')
	cont=Comment.objects.filter(idUser=int(id)).count()
	return render_to_response('inspector/MisNotificaciones.html',{'cont':cont,'notificacion':notificacion,'user':user},context_instance=RequestContext(request))
@login_required(login_url='/')
def EditarNotificacion(request,id):#no funciona
	notificacion=multa.objects.get(id=int(id))
	if request.method=='POST':
		form=FormMultaEditar(request.POST,instance=notificacion)
		if form.is_valid():
			form.save()
			return HttpResponseRedirect('/')
	else:
		form=FormMultaEditar(instance=notificacion)
	return render_to_response('inspector/EditarNotoficacion.html',{'form':form},context_instance=RequestContext(request))
@login_required(login_url='/')
def EditReclamo(request, id):
	con=int(id)
	denucia=Comment.objects.get(id=int(id))
	print "Dennuncia",denucia
	if request.method=='POST':
		forms=EdirDenuncia(request.POST, instance=denucia)
		if forms.is_valid():
			forms.save()
			return HttpResponse('Se modifico el registro')
			#return HttpResponseRedirect('/exito/')
			#return HttpResponse(json.dumps({"result":True}),"application/json")
	else:
		forms=EdirDenuncia(instance=denucia)
	return render_to_response('inspector/EditReclamo.html',{'forms':forms,'con':con},context_instance=RequestContext(request))
@login_required(login_url='/')
def deleteReclamo(request, id):
	denuncia=Comment.objects.get(id=int(id))
	denuncia.delete()
	return HttpResponse("Se elimino el registro")



@login_required(login_url='/')
def EditNotificacion(request, id):
	con=int(id)
	denucia=multa.objects.get(id=int(id))
	print "Dennuncia",denucia
	if request.method=='POST':
		forms=FormMultaEditar(request.POST, instance=denucia)
		if forms.is_valid():
			forms.save()
			return HttpResponse('Se modifico el registro')
			#return HttpResponseRedirect('/exito/')
			#return HttpResponse(json.dumps({"result":True}),"application/json")
	else:
		forms=FormMultaEditar(instance=denucia)
	return render_to_response('inspector/EditarNotoficacion.html',{'forms':forms,'con':con},context_instance=RequestContext(request))
@login_required(login_url='/')
def DeleteNotificacion(request, id):
	denuncia=multa.objects.get(id=int(id))
	denuncia.delete()
	return HttpResponse("Se Elimino el registro")





@login_required(login_url='/')
def datosDenuncia(request,id):
	nego=Negocio.objects.get(id=int(id))
	datosN=multa.objects.filter(Codigo=int(id)).order_by('-id')[0:50]
	return render_to_response('inspector/datosDenuncia.html',{'datosN':datosN,'nego':nego},context_instance=RequestContext(request))
def datosDenunciaInspectorNot(request,id):
	nego=Negocio.objects.get(id=int(id))
	datosN=Comment.objects.filter(idNegocio=int(id)).order_by('-id')[0:50]
	return render_to_response('inspector/datosDenunciaNot.html',{'datosN':datosN,'nego':nego},context_instance=RequestContext(request))
@login_required(login_url='/')
def allNotDeUnNegocio(request,id):
	negocio=Negocio.objects.get(id=int(id))
	todasN=multa.objects.filter(Codigo=int(id)).order_by('-id')
	return render_to_response('inicio/allNotDeUnNegocio.html',{'todasN':todasN,'negocio':negocio},context_instance=RequestContext(request))
@login_required(login_url='/')
def detaDenuncias(request,id):
	denuncia=multa.objects.filter(id=int(id))
	nombre=Negocio.objects.all()
	return render_to_response('inspector/DenunciaNegocioDetalle.html',{'denuncia':denuncia,'nombre':nombre},context_instance=RequestContext(request))
@login_required(login_url='/')
def MisNotificaciones(request, id):
	user=int(id)
	notificaciones=multa.objects.filter(idUser=user).order_by("-id")
	cont=multa.objects.filter(idUser=user).count()
	return render_to_response('inspector/MisNotificacioness.html',{'cont':cont,'notificaciones':notificaciones},context_instance=RequestContext(request))
@login_required(login_url='/')
def inspeccionesDato(request ,id):
	ind=int(id)
	dato=Seguimiento.objects.filter(neg=ind)
	print "dato inspecicpn",dato
	cont=Seguimiento.objects.filter(neg=ind).count()
	return render_to_response('inspector/inpeciones.html',{'dato':dato,'cont':cont},context_instance=RequestContext(request))