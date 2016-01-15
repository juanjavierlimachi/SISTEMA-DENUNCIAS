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
	url(r'^saveFiles/$', saveFiles),

	url(r'^seguimientosDenuncia/$', seguimientosDenuncia),
	url(r'^seguimientosNotificacion/$', seguimientosNotificacion),
	url(r'^seguimiento/$', seguimiento),
	url(r'^sanciones/(?P<id>\d+)/$',sanciones),
	url(r'^EditarMulta/(?P<id>\d+)/$',EditarMulta),
	url(r'^EliminarMulta/(?P<id>\d+)/$',EliminarMulta),
	url(r'^EditarNegocio/(?P<id>\d+)/$',EditarNegocio),
	url(r'^DeleteNegocio/(?P<id>\d+)/$',DeleteNegocio),
	url(r'^ActivaNegocio/(?P<id>\d+)/$',ActivaNegocio),
	url(r'^mostrarMulta/(?P<id>\d+)/$',mostrarMulta),
	url(r'^importarExcel/$', importarExcel),

	url(r'^dataInport/$', dataInport),
	url(r'^ReporteExcel/(?P<id>[^/]+)/(?P<fin>[^/]+)$',ReporteExcel),
	url(r'^ReporteExcelDenuncias/(?P<id>[^/]+)/(?P<fin>[^/]+)$',ReporteExcelDenuncias),

	url(r'^ReporteExcelInforme/(?P<id>[^/]+)/(?P<fin>[^/]+)$',ReporteExcelInforme),
	url(r'^VerCodigoQR/(?P<id>\d+)/$',VerCodigoQR),
	url(r'^Generar/(?P<id>\d+)/$',Generar),
	url(r'^generarQR/$',generarQR),
	url(r'^resultadosN/(?P<id>\d+)/$',resultadosN),

	url(r'^Aclusurar/(?P<id>\d+)/$',Aclusurar),
	url(r'^deliteNew/(?P<id>\d+)/$',deliteNew),
	
	url(r'^InactivarNew/(?P<id>\d+)/$',InactivarNew),
	
	url(r'^DeshavilitarNot/(?P<id>\d+)/$',DeshavilitarNot),
)