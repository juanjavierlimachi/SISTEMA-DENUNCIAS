from django.shortcuts import render,redirect
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic import TemplateView
from .forms import *
from .models import *
from django.contrib.auth.forms import User
from administracion.apps.negocio.models import Negocio
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse, HttpResponse
# Create your views here.
class denucias(TemplateView):
	template_name='cliente/denuncia.html'
	# def post(self, request, *args, **kwargs):
	# 	request.session['name'] = request.POST['name']
	# 	request.session['Codigo'] = request.POST['Codigo']
	# 	return redirect('/cliente/')

class clienteView(TemplateView):
	def get(self, request, *args, **kwargs):
		#idNe=request.GET.get('id')#puede ser una opcion para enviar el id del negocio
		#nego=Negocio.objects.get(id=idNe)
		#print "este es el negocio:",nego 
		consult=request.session['Codigo']
		consulta=Negocio.objects.get(id=consult)
		if request.session.get('name'):
			#comments=Comment.objects.all().order_by("-id")[0]
			#comments=Comment.objects.filter(idNegocio=idNe).order_by("-id")[0:1]
			#este es el formato de la url en el QR http://localhost:8000/denuncias/?id=23
			dic = {
				#'ne':request.GET.get('id'),#asi mento el num envio en id del negocio mediante
				'name': request.session['name'],
				'codd': consulta,
				'form': Commentform()
				#'comments':comments
				#'nego':nego,
				#'idNe':idNe
			}
			#una ves optenido el nombre enviamos al templete cliente.html
			return render(request, 'cliente/cliente.html', dic)
		else:
			return redirect('/cliente/')

	def post(self, request, *args, **kwargs):
		# Comment.objects.create(
		# 	user = request.POST['user'],
		# 	comment= request.POST['comment'],
		# 	idNegocio = request.POST['idNegocio'],
		# 	Tipo_de_peticion = request.POST['Tipo_de_peticion'],
		# 	archivo = request.FILES['archivo']
		# )
		return redirect('/cliente/')
@csrf_exempt
def create_comment(request):
	print "Estos son los datos?????";
	print request.POST
	Comment.objects.create(
		user = request.POST['user'],
		Tipo_de_peticion = request.POST['Tipo_de_peticion'],
		comment= request.POST['comment'],
		idNegocio = request.POST['idNegocio'],
		idUser = request.POST['idUser']
		)
	cont=Comment.objects.all().count()
	Negocio.objects.filter(id=request.POST['idNegocio']).update(estadoD=1)
	#up.save()
	response= JsonResponse({'cont':cont,
							'user': request.POST['user'],
							'Tipo_de_peticion':request.POST['Tipo_de_peticion'],
							'comment':request.POST['comment'],
							'idNegocio':request.POST['idNegocio'],
							'idUser':request.POST['idUser']})
	#esto informacion mandamos al server 
	return HttpResponse(response.content)

def VERdATOScliente(request, id):
	dato=User.objects.get(id=int(id))
	denuncias=Comment.objects.filter(id=int(id))
	print dato.id
	print dato.username
	return HttpResponse(dato)