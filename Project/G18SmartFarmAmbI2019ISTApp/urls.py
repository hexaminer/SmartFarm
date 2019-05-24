from django.conf.urls import url, include
from django.contrib.gis import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),

]