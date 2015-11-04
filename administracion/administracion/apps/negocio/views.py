from django.shortcuts import render, render_to_response
from django.views.generic import CreateView,TemplateView,ListView
from django.contrib.auth.decorators import login_required
from .models import *
from administracion.apps.cliente.models import Comment
from administracion.apps.usuario.models import *
from django.core.urlresolvers import reverse_lazy
from .forms import *
from django.db.models import Q
from django.template import RequestContext
from django.http import  HttpResponseRedirect, HttpResponse
from administracion.settings import RUTA_PROYECTO
import os
import csv

# Create your views here.
@login_required(login_url='/')
def RegistroNegocio(request):
    if request.method == 'POST':
        user=Negocio(user=request.user)
        formulario=formNegocio(request.POST, instance=user)
        if formulario.is_valid():
            formulario.save()
            return HttpResponseRedirect('/RegistroNegocio/')
    else:
        formulario=formNegocio()
    return render_to_response('negocio/registroNegocio.html',{'formulario':formulario},context_instance=RequestContext(request))


@login_required(login_url='/')
def ListaNegocio(request):
    categorias=Categoria.objects.all().order_by('categoria')
    negosios=Negocio.objects.all().order_by('propietario')
    return render_to_response('negocio/ListaNegocio.html',{'categorias':categorias,'negosios':negosios},context_instance=RequestContext(request))

from django.core import serializers
class busquedaAjaxView(TemplateView):#no esta en ejecucion
    def get(self, request, *args, **kwargs):
        id_categoria = request.GET['id']
        elecion = Negocio.objects.filter(categoria=id_categoria).order_by('propietario')
        print elecion
        data = serializers.serialize('json', elecion,fields=('id','propietario','memorial_apertura'))
        return HttpResponse(data, 'application/json')
@login_required(login_url='/')
def Filtro(request,id):
    aux=Negocio.objects.filter(categoria=int(id)).count()
    c=int(id)
    elecion = Negocio.objects.filter(categoria=int(id)).order_by('propietario')
    return render_to_response('negocio/ListaNegociosPORcategoria.html',{'elecion':elecion,'aux':aux,'c':c},context_instance=RequestContext(request))
"""def buscar(request):
	if request.method=='POST':
		formulario=buscarForm(request.POST)
		if (formulario.is_valid()):
			criterio=request.POST["buscar"]
			if criterio!="":
				listas=Negocio.objects.filter(Q(propietario__contains=criterio) or Q(memorial_apertura__contains=criterio))
				return render_to_response('negocio/resultadoBus.html',{'listas':listas},RequestContext(request))
			else:
				HttpResponse("error")
	formulario=buscarForm()
	return render_to_response('negocio/formBusqueda.html',{'formulario':formulario},RequestContext(request))
""" 
@login_required(login_url='/')
def buscar(request):
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
        		return render_to_response('negocio/resultadoBus.html',{'negocio':negocio},context_instance=RequestContext(request))
        		break
        if cont==0:
        	return HttpResponse('No existe')
    else:
        texto=request.GET["texto"]
        busqueda=(
            Q(propietario__icontains=texto) |
            Q(propietario__icontains=texto) |
            Q(propietario__icontains=texto)
        )
        resultados=Negocio.objects.filter(busqueda).distinct()
        html="<ul class='ul_lista'>"
        for i in resultados:
            html=html+"<li><a href='/detalleNegocio/"+str(i.id)+"/'>"+i.propietario+"</a></li>"
        html=html+"<ul>"
        return HttpResponse(html)
@login_required(login_url='/')
def DetallesNegocioBus(request,id):
    negocio=Negocio.objects.get(id=id)
    print negocio
    return render_to_response('negocio/resultadoBus.html',{'negocio':negocio},context_instance=RequestContext(request))

@login_required(login_url='/')
def registros(request,id):
	quejas=Comment.objects.filter(idNegocio=int(id)).order_by("-id")[0:30]
	return render_to_response('negocio/quejas.html',{'quejas':quejas},context_instance=RequestContext(request))

@login_required(login_url='/')
def denunciasAdmin(request, id):
    negocio=Negocio.objects.get(id=int(id))
    todasN=Comment.objects.filter(idNegocio=int(id)).order_by('-id')
    print todasN
    return render_to_response('negocio/denunciasAdmin.html',{'todasN':todasN,'negocio':negocio},context_instance=RequestContext(request))
@login_required(login_url='/')
def detDenunciasReclamos(request, id):
    dni=int(id)
    reclamos=Comment.objects.filter(id=int(id))
    negocio=Negocio.objects.all()
    return render_to_response('negocio/reclamosAdmin.html',{'reclamos':reclamos,'negocio':negocio},context_instance=RequestContext(request))
@login_required(login_url='/')
def saveFiles(request):
    #uuu=request.user.id
    if request.method=='POST':
        #user=Negocio(user=request.user)
        formulario=regisArchivoForm(request.POST,request.FILES)
        if formulario.is_valid():
            resultado=True
            destino=open(os.path.join(RUTA_PROYECTO,"archivos/datos.csv"),"wb+")
            archi=request.FILES["csv"]
            for info in archi.chunks():
                destino.write(info)
            destino.close()
            leerarchi=csv.reader(open(os.path.join(RUTA_PROYECTO,"archivos/datos.csv"),"rb"))
            for index,row in enumerate(leerarchi):
                es=Negocio()
                es.user_id=int(row[0])
                es.propietario=row[1]
                es.memorial_apertura=row[2]
                #es.resolucion_municipal=datetime.datetime.strptime(row[3],"%Y-%m-%d").date()
                es.resolucion_municipal=row[3]
                es.direccion=row[4]
                es.categoria_id=int(row[5])
                es.save()
            request.session["success"]=True
            if resultado == True:
                return render_to_response('negocio/subir.html',{'formulario':formulario,'resultado':True},context_instance=RequestContext(request))

            #return HttpResponseRedirect("/registrado/")
    else:
        formulario=regisArchivoForm()
    return render_to_response('negocio/subir.html',{'formulario':formulario},context_instance=RequestContext(request))

@login_required(login_url='/')
def seguimientosNotificacion(request):
    lista=[]
    for aux in multa.objects.raw('SELECT nm.id, count(Codigo) as total, Codigo, propietario  FROM negocio_multa nm, negocio_negocio nn WHERE nm.Codigo=nn.id GROUP BY Codigo'):
        #print (aux.Codigo, aux.propietario)
        lista.append(dict([(aux.total, aux.propietario)]))
    #print ">>>>>>>>",aux.Codigo
    return render_to_response('negocio/seguimientosNotificacion.html',{'lista':lista},context_instance=RequestContext(request))
@login_required(login_url='/')
def seguimientosDenuncia(request):
    lista=[]
    for aux in Comment.objects.raw('SELECT cm.id, count(idNegocio) as total, idNegocio, propietario  FROM cliente_comment cm, negocio_negocio nn WHERE cm.idNegocio=nn.id GROUP BY cm.idNegocio'):
        #print (aux.idNegocio, aux.propietario)
        lista.append(dict([(aux.total, aux.propietario)]))
    return render_to_response('negocio/seguimientosDenuncia.html',{'lista':lista},context_instance=RequestContext(request))
@login_required(login_url='/')
def seguimiento(request):
    datos=Seguimiento.objects.all().order_by('-id')
    return render_to_response('negocio/seguimiento.html',{'datos':datos},context_instance=RequestContext(request))
