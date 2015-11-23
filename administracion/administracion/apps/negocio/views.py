#encoding:utf-8
from django.shortcuts import render, render_to_response
from django.views.generic import CreateView,TemplateView,ListView, View
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
import datetime
from datetime import date
#import xlwt
# Create your views here.
#d= Seguimientos.objects.count()
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
    negosios = Negocio.objects.filter(categoria=int(id)).order_by('propietario')
    return render_to_response('negocio/ListaNegociosPORcategoria.html',{'negosios':negosios,'aux':aux,'c':c},context_instance=RequestContext(request))
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
    return render_to_response('negocio/reclamosAdmin.html',{'reclamos':reclamos,'negocio':negocio,'dni':dni},context_instance=RequestContext(request))

from administracion.apps.negocio.resources import NegocioResource
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
    formu=NegocioResource()
    return render_to_response('negocio/subir.html',{'formulario':formulario,'formu':formu},context_instance=RequestContext(request))

@login_required(login_url='/')
def seguimientosNotificacion(request):
    lista=[]
    for aux in multa.objects.raw('SELECT nm.id, count(Codigo) as total, Codigo, propietario  FROM negocio_multa nm, negocio_negocio nn WHERE nm.Codigo=nn.id GROUP BY Codigo'):
        #print (aux.Codigo, aux.propietario)
        lista.append(dict([(aux.total, aux.propietario)]))
    total_Not=Negocio.objects.filter(estadoN=1).count()
    t_no=Negocio.objects.filter(estadoD=0).count()
    tt=Negocio.objects.count()
    return render_to_response('negocio/seguimientosNotificacion.html',{'t_no':t_no,'tt':tt,'lista':lista,'total_Not':total_Not},context_instance=RequestContext(request))
@login_required(login_url='/')
def seguimientosDenuncia(request):
    lista=[]
    for aux in Comment.objects.raw('SELECT cm.id, count(idNegocio) as total, idNegocio, propietario  FROM cliente_comment cm, negocio_negocio nn WHERE cm.idNegocio=nn.id GROUP BY cm.idNegocio'):
        lista.append(dict([(aux.total, aux.propietario)]))
    total_denunciados=Negocio.objects.filter(estadoD=1).count()
    t_no=Negocio.objects.filter(estadoD=0).count()
    tt=Negocio.objects.count()
    return render_to_response('negocio/seguimientosDenuncia.html',{'t_no':t_no,'tt':tt,'lista':lista,'total_denunciados':total_denunciados},context_instance=RequestContext(request))
@login_required(login_url='/')
def seguimiento(request):
    hoy=datetime.now()
    hoy=hoy.strftime('%Y-%m-%d')
    #d=d.day
    #print "este es e dia: ",int(d)  __gte
    Por_dia=Seguimiento.objects.filter(fecha__gte = hoy)
    print Por_dia
    datos=Seguimiento.objects.all().order_by('id')
    return render_to_response('negocio/seguimiento.html',{'datos':datos,'Por_dia':Por_dia},context_instance=RequestContext(request))

def sanciones(request, id):
    idn=id
    if request.method=='POST':
        dato=Cobro(idNotificacion_id=idn)
        forms=FormCobro(request.POST, instance=dato)
        if forms.is_valid():
            forms.save()
            datos=multa.objects.get(id=id)
            print "estes el id ontenido",datos.Codigo
            Negocio.objects.filter(id=datos.Codigo).update(estadoN=0)
            return HttpResponse("Datos Guardados Correctamente")
        else:
            HttpResponse("Se produjo un error Verifique los datos Nuevamente.")
    else:
        forms=FormCobro()
    return render_to_response('negocio/RegistroCobro.html',{'forms':forms,'idn':idn},context_instance=RequestContext(request))
from datetime import datetime
@login_required(login_url='/')
def EditarNegocio(request, id):
    con=int(id)
    neg=Negocio.objects.get(id=int(id))
    if request.method=='POST':
        forms=formNegocio(request.POST, instance=neg)
        if forms.is_valid():
            forms.save()
            return HttpResponse('Se modifico el registro Correctamente')
            #return HttpResponseRedirect('/exito/')
            #return HttpResponse(json.dumps({"result":True}),"application/json")
    else:
        forms=formNegocio(instance=neg)
    return render_to_response('negocio/EditarNegocio.html',{'forms':forms,'con':con},context_instance=RequestContext(request))

@login_required(login_url='/')
def DeleteNegocio(request, id):
    denuncia=Negocio.objects.get(id=int(id))
    denuncia.delete()
    return HttpResponse("Se Elimino el registro")

def ActivaNegocio(request, id):
    if request.user.is_superuser and request.user.is_staff and request.user.is_active:
        datos=multa.objects.get(id=id)
        Negocio.objects.filter(id=datos.Codigo).update(estadoN=0)
        return HttpResponse("El Negocio se encuentra nuevamente activo.")
    else:
        return HttpResponse("Ud no puede realizar esta accion consulte con el administrador.")

import xlwt
from xlwt import *

def importarExcel(request):
    style0 = xlwt.easyxf('font: name Times New Roman, colour blue, bold on')
    style1 = xlwt.easyxf('',num_format_str='DD-MMM-YY')
    wb = xlwt.Workbook()#creamos el fichero excel
    ws = wb.add_sheet('A Test Sheet',cell_overwrite_ok=True)
    #ws=write(1,0,datetime.now())
    filas=0
    neg=Negocio.objects.all()
    cont=int(len(neg))
    for i in neg:
        for filas in range(0,cont):
            for coll in range(0,cont):
                ws.write(filas,coll,(i.propietario,i.direccion))
        #ws.write(fil,0,i.memorial_apertura)
    wb.save('negocios.xls')
    #filename=wb.save()G:\sistemasDenuncias\administracion
    return HttpResponse(open(os.path.join(RUTA_PROYECTO,'/sistemasDenuncias/administracion/negocios.xls'),'r').read(),content_type='application/ms-excel')




import xlsxwriter
from xlsxwriter.utility import xl_range_abs
def dataInport(request):
    data=NegocioResource().export()
    data=data.xls
    print data
    return HttpResponse(open('data','r').read(),content_type='application/ms-excel')
@login_required(login_url='/')
def ReporteExcel(request,id,fin):
    i=datetime.strptime(id,'%Y-%m-%d').date()
    #f1=f1.strftime('%Y-%m-%d')
    n=datetime.strptime(fin,'%Y-%m-%d').date()
    lista=[]
    first_book = Workbook()
    ws1 = first_book.add_sheet('first_sheet')
    ws1.write(0,0,'IDNegocio')
    ws1.write(0,1,'Propietario')
    ws1.write(0,2,'Direccion')
    ws1.write(0,3,'Fecha notificacion')
    ws1.write(0,4,'Descripcion')
    ws1.write(0,5,'Fecha presentacion')
    ws1.write(0,6,'Hora ')
    ws1.write(0,7,'Inspector')
    ws1.write(0,8,'ID User')
    ind=0
    denuncia = multa.objects.filter(fecha_notificacion__range=(id,fin))
    nombre=Negocio.objects.all()
    for d in denuncia:
        for n in nombre:
            if d.Codigo==n.id:
                ind+=1
                ws1.write(ind,0,n.id)
                ws1.write(ind,1,n.propietario)
                ws1.write(ind,2,n.direccion)
                ws1.write(ind,3,datetime.strftime(d.fecha_notificacion,'%Y-%m-%d %H:%M:%S'))
                ws1.write(ind,4,d.descripcion)
                ws1.write(ind,5,datetime.strftime(d.fecha_presentacion,"%Y-%m-%d"))
                ws1.write(ind,6,d.hora)
                ws1.write(ind,7,d.Usuario)
                ws1.write(ind,8,d.idUser)

    return HttpResponse(first_book.save('C:/Users/PAVILION/Downloads/Notificaciones.xls'),'application/ms-excel')
@login_required(login_url='/')
def ReporteExcelDenuncias(request,id,fin):
    i=datetime.strptime(id,'%Y-%m-%d').date()
    #f1=f1.strftime('%Y-%m-%d')
    n=datetime.strptime(fin,'%Y-%m-%d').date()
    lista=[]
    first_book = Workbook()
    ws1 = first_book.add_sheet('first_sheet')
    ws1.write(0,0,'IDNegocio')
    ws1.write(0,1,'Propietario')
    ws1.write(0,2,'Direccion')
    ws1.write(0,3,'Fecha Denuncia')
    ws1.write(0,4,'Descripcion')
    ws1.write(0,5,'Cliente')
    ws1.write(0,6,'ID User')
    ind=0
    denuncia = Comment.objects.filter(fecha_denuncia__range=(id,fin))
    nombre=Negocio.objects.all()
    for d in denuncia:
        for n in nombre:
            if d.idNegocio==n.id:
                ind+=1
                ws1.write(ind,0,n.id)
                ws1.write(ind,1,n.propietario)
                ws1.write(ind,2,n.direccion)
                ws1.write(ind,3,datetime.strftime(d.fecha_denuncia,'%Y-%m-%d %H:%M:%S'))
                ws1.write(ind,4,d.comment)
                ws1.write(ind,5,d.user)
                ws1.write(ind,6,d.idUser)

    first_book.save('Denuncias.xls')
    return HttpResponse("bien Denuncias")