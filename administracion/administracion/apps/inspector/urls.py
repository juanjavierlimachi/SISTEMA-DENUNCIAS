from django.conf.urls import patterns, include, url
from .views import *
#from .views import denucias#aki ay estoy importando todas las mis vistas //

urlpatterns = patterns('',
	#url(r'^denuncias/$', denucias.as_view()), denuncias
	url(r'^buscarNegocio/$', buscarNegocio, name='buscarNegocio'),
	url(r'^emitirInfraccion/$', emitirInfraccion.as_view()),
	#url(r'^denuncias/$',denuncias.as_view(),name='denuncias'), AvisosDenunciasCliente
	url(r'^crear-notificacion$',crear_notificacion, name='crear_notificacion'),

	url(r'^Denuncias-cliente/$', AvisosDenunciasCliente.as_view()),
	url(r'^perfil/(?P<id>\d+)/$',perfilinspector),
	url(r'^DetalleNegocio/(?P<id>\d+)/$',DetalleNegocio),
	url(r'^VerDenunciasInspector/(?P<id>\d+)/$',VerDenunciasInspector),#MisNotificaciones.html
	url(r'^EditarNotificacion/(?P<id>\d+)/$',EditarNotificacion),
	url(r'^datosDenunciaInspector/(?P<id>\d+)/$',datosDenuncia),
	url(r'^datosDenunciaInspectorNot/(?P<id>\d+)/$',datosDenunciaInspectorNot),
	url(r'^allNotDeUnNegocio/(?P<id>\d+)/$',allNotDeUnNegocio, name='allNotDeUnNegocio'),
	url(r'^detaDenuncias/(?P<id>\d+)/$',detaDenuncias),
	
	url(r'^MisNotificaciones/(?P<id>\d+)/$',MisNotificaciones),
	url(r'^EditReclamo/(?P<id>\d+)/$',EditReclamo),
	url(r'^deleteReclamo/(?P<id>\d+)/$',deleteReclamo),
	
	url(r'^EditNotificacion/(?P<id>\d+)/$',EditNotificacion),
	url(r'^DeleteNotificacion/(?P<id>\d+)/$',DeleteNotificacion),
)