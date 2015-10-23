from django.conf.urls import patterns, include, url

from .views import *#aki ay estoy importando todas las mis vistas // RegistroNegocio

urlpatterns = patterns('',
	#url(r'^denuncias/$', denucias.as_view()),
	#url(r'^RegistroNegocio/$', RegistroNegocio.as_view(), name='RegistroNegocio'),
	url(r'^ListaNegocio/$', ListaNegocio, name='ListaNegocio'),
	url(r'^busqueda_ajax/(?P<id>\d+)/$',Filtro),
	#url(r'^busqueda/$', buscar), 
	url(r'^RegistroNegocio/$', RegistroNegocio),
	url(r'^buscar/$', buscar),
	url(r'^registros/(?P<id>\d+)/$',registros),
	url(r'^detalleNegocio/(?P<id>\d+)/$',DetallesNegocioBus),
	url(r'^denunciasAdmin/(?P<id>\d+)/$',denunciasAdmin),
	url(r'^detDenunciasReclamos/(?P<id>\d+)/$',detDenunciasReclamos),
)