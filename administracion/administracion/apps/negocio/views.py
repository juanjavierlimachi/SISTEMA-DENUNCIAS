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
from pyqrcode import QRCode
import sys
#import xlwt
# Create your views here.
#d= Seguimientos.objects.count()
@login_required(login_url='/')
def RegistroNegocio(request):
    if request.method == 'POST':
        estado=False
        user=Negocio(user=request.user)
        formulario=formNegocio(request.POST, instance=user)
        if formulario.is_valid():
            formulario.save()
            estado=True
            if estado==True:
                dato=Negocio.objects.all().order_by('-id')[0:1]
                for i in dato:
                    url = QRCode('http://192.168.1.15:9595/privado/'+str(i.id)+'/')
                    url.svg(sys.stdout, scale=15)
                    url.svg('QR_'+str(i.propietario)+'_Cod_'+str(i.id)+'.svg',scale=6)
                    number=QRCode('http://192.168.1.15:9595/privado/'+str(i.id)+'/')
                    number.png('QR_'+str(i.propietario)+'_Cod_'+str(i.id)+'.png')
                    Negocio.objects.filter(id=i.id).update(qr=number.png('QR_'+str(i.propietario)+'_Cod_'+str(i.id)+'.png'))
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
    Comment.objects.filter(id=int(id)).update(estado=1)
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
    #t_no=Negocio.objects.filter(estadoD=0).count()
    tt=Negocio.objects.count()
    return render_to_response('negocio/seguimientosNotificacion.html',{'tt':tt,'lista':lista,'total_Not':total_Not},context_instance=RequestContext(request))
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
    Por_dia=Seguimiento.objects.filter(fecha__gte = hoy).order_by('-id')
    print Por_dia
    datos=Seguimiento.objects.filter(fecha__lte=hoy)
    return render_to_response('negocio/seguimiento.html',{'datos':datos,'Por_dia':Por_dia},context_instance=RequestContext(request))

def sanciones(request, id):
    idn=id
    if request.user.is_superuser and request.user.is_staff:
        if request.method=='POST':
            try:
                yatiene=Cobro.objects.get(idNotificacion_id=idn)
                if yatiene:
                    return HttpResponse("Ya asigno la multa a esta Notificacion. ")
            except Cobro.DoesNotExist:
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
    else:
        return HttpResponse("Ud consulte con el administrador")
    return render_to_response('negocio/RegistroCobro.html',{'forms':forms,'idn':idn},context_instance=RequestContext(request))

def EditarMulta(request, id):
    idn=id
    d=Cobro.objects.get(id=idn)
    if request.method=='POST':
        #dato=Cobro(idNotificacion_id=idn)
        forms=FormCobro(request.POST, instance=d)
        if forms.is_valid():
            forms.save()
            return HttpResponse("Se Modifico el monto Correctamente.")
        else:
            return HttpResponse("Error en los datos Verifique por favor.")
    else:
        forms=FormCobro(instance=d)
    return render_to_response('negocio/UpdateCobro.html',{'forms':forms,'idn':idn},context_instance=RequestContext(request))
def EliminarMulta(request, id):
    if request.user.is_superuser and request.user.is_staff and request.user.is_active:
        dato=Cobro.objects.get(id=int(id))
        dato.delete()
        return HttpResponse("Se Elimino el registro.")
    else:
        HttpResponse("Ud no tiene permiso para eliminar el registro.")

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
@login_required(login_url='/')
def ActivaNegocio(request, id):
    if request.user.is_superuser and request.user.is_staff and request.user.is_active:
        datos=multa.objects.get(id=id)
        Negocio.objects.filter(id=datos.Codigo).update(estadoN=0)
        return HttpResponse("El Negocio se encuentra nuevamente activo.")
    else:
        return HttpResponse("Ud no puede realizar esta accion consulte con el administrador.")
@login_required(login_url='/')
def mostrarMulta(request, id):
    if request.user.is_superuser and request.user.is_staff and request.user.is_active:
        dato=Cobro.objects.get(idNotificacion_id=int(id))
        return render_to_response("negocio/mostrarMulta.html",{'dato':dato},context_instance=RequestContext(request))
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
                
    return HttpResponse(first_book.save('C:/Users/PAVILION/Downloads/Denuncias.xls'),'application/ms-excel')
@login_required(login_url='/')
def ReporteExcelInforme(request, id, fin):
    lista=[]
    first_book = Workbook()
    ws1 = first_book.add_sheet('first_sheet')
    ws1.write(0,0,'Nombre Negocio')
    ws1.write(0,1,'Multa')
    ws1.write(0,2,'Usuario')
    ws1.write(0,3,'Fecha')
    ind=0
    datos=Cobro.objects.filter(fecha__range=(id,fin))
    cont=Cobro.objects.filter(fecha__range=(id,fin)).count()
    suma=0
    multas=multa.objects.all()
    nego=Negocio.objects.all()
    for i in datos:
        for k in nego:
            for j in multas:
                if j.Codigo == k.id and  j.id == i.idNotificacion_id:
                    ind+=1
                    ws1.write(ind,0,k.propietario)
                    ws1.write(ind,1,i.monto)
                    ws1.write(ind,2,k.user_id)
                    ws1.write(ind,3,datetime.strftime(i.fecha,'%Y-%m-%d %H:%M:%S'))
    return HttpResponse(first_book.save('C:/Users/PAVILION/Downloads/Informes.xls'),'application/ms-excel')
@login_required(login_url='/')
def Generar(request,id):
    dato=Negocio.objects.get(id=id)
    nombe=str(dato.id)
    propietario=str(dato.propietario)
    url = QRCode('http://192.168.1.15:9595/privado/'+str(id)+'/')
    url.svg(sys.stdout, scale=15)
    url.svg('QR_'+propietario+'_Cod_'+nombe+'.svg',scale=6)
    number=QRCode('http://192.168.1.15:9595/privado/'+str(id)+'/')
    number.png('QR_'+propietario+'_Cod_'+nombe+'.png')
    Negocio.objects.filter(id=id).update(qr=number.png('QR_'+propietario+'_Cod_'+nombe+'.png'))
    return HttpResponse("Se creo el codigo QR Correctamente")
@login_required(login_url='/')
def generarQR(request):
    datos=Negocio.objects.all()
    for i in datos:
        url = QRCode('http://192.168.1.15:9595/privado/'+str(i.id)+'/')
        url.svg(sys.stdout, scale=15)
        url.svg('QR_'+str(i.propietario)+'_Cod_'+str(i.id)+'.svg',scale=6)
        number=QRCode('http://192.168.1.15:9595/privado/'+str(i.id)+'/')
        number.png('QR_'+str(i.propietario)+'_Cod_'+str(i.id)+'.png')

    return HttpResponse("Se Genero Los codigos QR |<a href='G:sistemasDenuncias/administracion/'>Ver</a>")

def resultadosN(request, id):
    total_Denuncias=Comment.objects.filter(idNegocio=int(id)).count()
    total_Notificaciones=multa.objects.filter(Codigo=int(id)).count()
    total_inspecciones=Seguimiento.objects.filter(neg_id=int(id)).count()
    #nego=Negocio.objects.all()
    noti=multa.objects.filter(Codigo=int(id))
    cobros=Cobro.objects.all()
    contador=0
    recaudado=0
    for i in noti:
        for j in cobros:
            #for k in cobros:
            if i.id==j.idNotificacion_id:
                contador+=1
                recaudado=recaudado+j.monto
    dic={
        'total_Denuncias':total_Denuncias,
        'total_Notificaciones':total_Notificaciones,
        'total_inspecciones':total_inspecciones,
        'contador':contador,
        'recaudado':recaudado
    }
    return render(request, 'negocio/resultados.html', dic)

def Aclusurar(request, id):
    negocios=Negocio.objects.filter(categoria_id=int(id), estadoN=1).distinct()
    noti=multa.objects.all()
    con=0
    aux=0
    acu=0
    lista=[]
    for i in negocios:
        for j in noti:
            if i.id == j.Codigo:
                acu+=1
                aux+=1
            if acu>=3:
                lista.append(dict([(i.propietario,acu)]))
                acu=0
    return render_to_response('negocio/Aclausuarar.html',{'lista':lista,'negocios':negocios, 'noti':noti,'aux':aux},context_instance=RequestContext(request))




