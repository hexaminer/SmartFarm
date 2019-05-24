# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.

# https://docs.djangoproject.com/en/1.11/ref/contrib/gis/tutorial/
from django.contrib.gis import admin
from .models import WorldBorder

admin.site.register(WorldBorder, admin.GeoModelAdmin) # For OSM
# admin.site.register(WorldBorder, admin.OSMGeoAdmin) # For  Vector Map Level 0 WMS