"""Orderweb URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include 
from mobile.views import qrcode 

urlpatterns = [
   # path('admin/', admin.site.urls),
   #path('',qrcode.index,name="qr_index"),
   path('myweb/', include("web.urls")),                # order system from customer 
   path('myadmin/', include("myadmin.urls")),     # back management side 
   path('mobile/',include("mobile.urls")),
]
