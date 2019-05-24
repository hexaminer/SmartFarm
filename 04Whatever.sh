ls#! /bin/bash

###################################################################################################
# Install opencv https://docs.opencv.org/4.1.0/d2/de6/tutorial_py_setup_in_ubuntu.html
# https://github.com/milq/milq/blob/master/scripts/bash/install-opencv.sh
# https://www.pyimagesearch.com/2018/09/26/install-opencv-4-on-your-raspberry-pi/
###################################################################################################

# sudo apt-get install python-opencv

###################################################################################################
# Install django
###################################################################################################
# This is a multi-line comment in batch... it starts with ": '" and ends with "'"
# sudo pip install django
# sudo pip install psycopg2

# https://tecadmin.net/install-django-on-debian-9-stretch/
# mkdir ~/git/Smartfarm/Project
# cd ~/git/Smartfarm/Project
# django-admin startproject G18SmartFarmApp
# cd ~/git/Smartfarm/Project/G18SmartFarmApp
# nesta altura configura-se o ficheiro Project/G18SmartFarmApp/G18SmartFarmApp/setting.py (principalmente a ligação ao Postgresql)
# python manage.py createsuperuser --username admin --email aluno@ist87847.33mail.com

# User on database:
#"SELECT id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined
#	FROM public.auth_user;"

# Quando pergunta pela password colocamos "raspberry"

pip list --outdated

sudo apt-get install gdal-bin -y
#python manage.py runserver 0.0.0.0:8000


# ---- Apos criação do projecto django, pelo turorial do geodjango https://docs.djangoproject.com/en/1.11/ref/contrib/gis/tutorial/

python manage.py makemigrations
python manage.py sqlmigrate G18SmartFarmAmbI2019ISTApp 0001
python manage.py migrate

# ogr2ogr: A command-line utility included with GDAL that can import many vector data formats into PostGIS, MySQL, and Oracle databases.
# shp2pgsql: This utility included with PostGIS imports ESRI shapefiles into PostGIS.

python manage.py shell
	import os
	import G18SmartFarmAmbI2019ISTApp
	world_shp = os.path.abspath(os.path.join(os.path.dirname(G18SmartFarmAmbI2019ISTApp.__file__),'data', 'TM_WORLD_BORDERS-0.3.shp'))
	from django.contrib.gis.gdal import DataSource
	ds = DataSource(world_shp)
	print(ds)
	
	# ata source objects can have different layers of geospatial features; however, shapefiles are only allowed to have one layer:
	print(len(ds))
	lyr = ds[0]
	print(lyr)
	print(lyr.geom_type)
	print(len(lyr))
	
	srs = lyr.srs
	print(srs)
	
	srs.proj4  # PROJ.4 representation
	
	print(lyr.fields) #Field names
	[fld.__name__ for fld in lyr.field_types] #Field types
	
	for feat in lyr:
		print(feat.get('NAME'), feat.geom.num_points)
	
	# To import the data, use a LayerMapping in a Python script. Create a file called load.py inside the application
	#Após criar o load.py
	
	from G18SmartFarmAmbI2019ISTApp import load
	load.run()

	# After import, The next command produces the following output, which may be copied directly into the models.py of a GeoDjango application:
	# This is an auto-generated Django model module created by ogrinspect.
	python manage.py ogrinspect G18SmartFarmAmbI2019ISTApp/data/TM_WORLD_BORDERS-0.3.shp WorldBorder --srid=4326 --mapping --multi

	python manage.py shell
	pnt_wkt = 'POINT(-95.3385 29.7245)'
	from G18SmartFarmAmbI2019ISTApp.models import WorldBorder # ERROR https://github.com/catmaid/CATMAID/issues/1250
    WorldBorder.objects.filter(mpoly__contains=pnt_wkt)
	
	from django.contrib.gis.geos import Point, GEOSGeometry
	pnt = Point(954158.1, 4215137.1, srid=32140)
	pnt = GEOSGeometry('SRID=32140;POINT(954158.1 4215137.1)')
	qs = WorldBorder.objects.filter(mpoly__intersects=pnt)
	print(qs.query) # Generating the SQL
	qs # printing evaluates the queryset # ERROR https://github.com/catmaid/CATMAID/issues/1250
	
	