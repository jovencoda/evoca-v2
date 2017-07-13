# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.gis.db import models

class WorldBorder(models.Model):
    # Regular Django fields corresponding to the attributes in the
    # world borders shapefile.
    # https://docs.djangoproject.com/en/dev/ref/contrib/gis/tutorial/#putting-your-data-on-the-map
    name = models.CharField(max_length=50)
    area = models.IntegerField()
    pop2005 = models.IntegerField('Population 2005')
    fips = models.CharField('FIPS Code', max_length=2)
    iso2 = models.CharField('2 Digit ISO', max_length=2)
    iso3 = models.CharField('3 Digit ISO', max_length=3)
    un = models.IntegerField('United Nations Code')
    region = models.IntegerField('Region Code')
    subregion = models.IntegerField('Sub-Region Code')
    lon = models.FloatField()
    lat = models.FloatField()

    # GeoDjango-specific: a geometry field (MultiPolygonField)
    mpoly = models.MultiPolygonField()

    # Returns the string representation of the model.
    def __str__(self):
        return self.name

class veredasCOL(models.Model):
    # Download GIS Data source http://rni.unidadvictimas.gov.co/node/521
    # extract & copy to wold/data folder
    # python manage.py shell
    # from world import load_veredascol
    # load_veredascol.run()
    dptompio = models.CharField(max_length=5)
    codigo_ver = models.CharField(max_length=11)
    nom_dep = models.CharField(max_length=50)
    nomb_mpio = models.CharField(max_length=50)
    nombre_ver = models.CharField(max_length=50)
    vigencia = models.CharField(max_length=4)
    fuente = models.CharField(max_length=50)
    descripcio = models.CharField(max_length=50)
    seudonimos = models.CharField(max_length=250)
    area_ha = models.FloatField()
    cod_dpto = models.CharField(max_length=2)
    shape_area = models.FloatField()
    shape_len = models.FloatField()
    geom = models.MultiPolygonField(srid=4326)

    # Returns the string representation of the model.
    def __str__(self):
        return self.nombre_ver
