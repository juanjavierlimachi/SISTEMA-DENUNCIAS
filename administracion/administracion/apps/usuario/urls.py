from django.conf.urls import patterns, include, url

from .views import *#aki ay estoy importando todas las mis vistas //

urlpatterns = patterns('',
	url(r'^$', Usuario),
	url(r'^privado/$', ingreso),
	url(r'^cerrar/$', serrar),
	url(r'^datos/(?P<id>\d+)/$',Datos),
	url(r'^editarperfil/$',editar_perfil),
	url(r'^nuevo/$',nuevoUser.as_view(), name='nuevoUser'),
	url(r'^verificacion/$',verificacion, name='verificacion'),
	url(r'^buscarUsuario/$', buscarUsuario, name='buscarUsuario'),
	url(r'^datosUsuario/(?P<id>\d+)/$', datosUsuario, name='datosUsuario'),
	url(r'^editarcontracenia/(?P<id>\d+)/$', editarcontracenia, name='editarcontracenia'),

	url(r'^editarperfilInspector/$',editar_perfil_Inspector),
	url(r'^editarcontraceniaInspector/(?P<id>\d+)/$', EditarcontraceniaInspector, name='editarcontraceniaInspector'),
	url(r'^ActivarCuenta/$',ActivarCuenta),
	url(r'^DasactivarUser/$',DasactivarUser),
	url(r'^VolverHavilitar/$',VolverHavilitar),
)