from django.contrib import admin
from .models import *
from import_export.admin import ImportExportModelAdmin

# Register your models here.
#admin.site.register(Negocio)
admin.site.register(multa)
admin.site.register(Categoria)
admin.site.register(Cobro)





from administracion.apps.negocio.resources import NegocioResource
 
 
class NegocioAdmin(ImportExportModelAdmin):
    resource_class = NegocioResource
    pass
 
 
admin.site.register(Negocio,NegocioAdmin)


