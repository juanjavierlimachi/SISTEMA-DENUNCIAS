from django.conf.urls import patterns, include, url
from .views import *#aki ay estoy importando todas las mis vistas

urlpatterns = patterns('',
	url(r'^AvisosDenuncias/$',AvisosDenuncias.as_view(),name='AvisosDenuncias'),
	url(r'^AvisosNotificaciones/$',AvisosNotificaciones.as_view(),name='AvisosNotificaciones'),
	url(r'^EnviarNotificacion/$',EnviarNotificacion, name='EnviarNotificacion'),
	url(r'^Notiicaciones/(?P<id>\d+)/$',Notiicaciones, name='Notiicaciones'),
	url(r'^Cronograma/$',RegistroCronograma, name='RegistroCronograma'),

	url(r'^datosDenuncia/(?P<id>\d+)/$',datosDenuncia),
	url(r'^allNotDeUnNegocio/(?P<id>\d+)/$',allNotDeUnNegocio, name='allNotDeUnNegocio'),
	url(r'^detDenuncias/(?P<id>\d+)/$',detDenuncias, name='detDenuncias'),#DenunciaNegocio.html
	url(r'^DetalleDenuncias/(?P<id>\d+)/$',DetalleDenuncias, name='DetalleDenuncias'),
	url(r'^VerNotificacionesInspector/(?P<id>\d+)/$',VerNotificacionesInspector, name='VerNotificacionesInspector'),
	url(r'^TodaslasNotificaciones/$',TodaslasNotificaciones, name='TodaslasNotificaciones'),
	url(r'^ImprimirNotificacion/(?P<id>\d+)/$',ImprimirNotificacion, name='ImprimirNotificacion'),

	url(r'^imprimirNegociosPorId/(?P<id>\d+)/$',imprimirNegociosPorId),
	url(r'^InprecionReclamo/(?P<id>\d+)/$',InprecionReclamo, name='InprecionReclamo'),
	url(r'^TodaslasDenuncias/$',TodaslasDenuncias, name='TodaslasDenuncias'),
	#url(r'^vermas/$',vermas, name='vermas'),
	url(r'^imprimirUser/$',imprimirUser, name='imprimirUser'),
	url(r'^ConsultarDenunciaFecha/$',ConsultarDenunciaFecha.as_view(), name='ConsultarDenunciaFecha'),
	url(r'^ConsultarDenunciaClienteFecha/$',ConsultarDenunciaClienteFecha.as_view(), name='ConsultarDenunciaClienteFecha'),
	url(r'^Registertype/$',Registertype, name='Registertype'),
	url(r'^MisdatosAdmin/$',MisdatosAdmin, name='MisdatosAdmin'),
	#datos Admin MisNotificacionesAdmin
	url(r'^MisDenunciasAdmin/(?P<id>\d+)/$',MisDenunciasAdmin, name='MisDenunciasAdmin'),
	url(r'^MisNotificacionesAdmin/(?P<id>\d+)/$',MisNotificacionesAdmin),

	#url(r'^ImprecionDenuncia/(?P<inicio>\d+)/(?P<fin>\d+)$',ImprecionDenuncia),
	url(r'^ImprecionDenuncia/(?P<id>[^/]+)/(?P<fin>[^/]+)$',ImprecionDenuncia),
	url(r'^ImprecionDenunciaClientes/(?P<id>[^/]+)/(?P<fin>[^/]+)$',ImprecionDenunciaClientes),

)