
from import_export import resources
from administracion.apps.negocio.models import *


class NegocioResource(resources.ModelResource):

    class Meta:
        model = Negocio
