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
from django.urls import path

from myadmin.views import index
from myadmin.views import user
from myadmin.views import category
from myadmin.views import product
from myadmin.views import customer,promocode,Uprofile,sales



urlpatterns = [
    # back admin page 
    path('', index.index, name="myadmin_index"),
    

    #user_account info 
    path('user/<int:pIndex>', user.index, name="myadmin_user_index"),#view
    path('user/add',user.add,name="myadmin_user_add"), #to add
    path('user/insert',user.insert,name="myadmin_user_insert"), #do add
    path('user/del/<int:uid>',user.delete,name="myadmin_user_del"), #delete
    path('user/edit/<int:uid>',user.edit,name="myadmin_user_edit"), #to edit
    path('user/update<int:uid>',user.update,name="myadmin_user_update"), #do edit
    path('user/history<int:uid>',user.historyrecord,name="myadmin_user_history"),
    #path('user/inserttest',user.addtest,name="myadmin_usertest_add"), #do add testing data
    
     #user_profile info 
    path('profile/<int:pIndex>', Uprofile.index, name="myadmin_profile_index"),#view
    path('profile/add',Uprofile.add,name="myadmin_profile_add"), #to add
    path('profile/insert',Uprofile.insert,name="myadmin_profile_insert"), #do add
    path('profile/del/<int:uid>',Uprofile.delete,name="myadmin_profile_del"), #delete
    path('profile/edit/<int:uid>',Uprofile.edit,name="myadmin_profile_edit"), #to edit
    path('profile/update<int:uid>',Uprofile.update,name="myadmin_profile_update"), #do edit
   #path('profile/inserttest',Uprofile.addtest,name="myadmin_profiletest_add"), do add testing data


     # 后台管理员路由
    path('login', index.login, name="myadmin_login"),
    path('dologin', index.dologin, name="myadmin_dologin"),
    path('logout', index.logout, name="myadmin_logout"),
    path('verify', index.verify, name="myadmin_verify"), #验证码 


     #菜品分类信息管理
    path('category/<int:pIndex>', category.index, name="myadmin_category_index"),
    path('category/load/<int:sid>', category.loadCategory, name="myadmin_category_load"),
    path('category/add', category.add, name="myadmin_category_add"),
    path('category/insert', category.insert, name="myadmin_category_insert"),
    path('category/del/<int:cid>', category.delete, name="myadmin_category_del"),
    path('category/edit/<int:cid>', category.edit, name="myadmin_category_edit"),
    path('category/update/<int:cid>', category.update, name="myadmin_category_update"),

    # 菜品信息管理
    path('product/<int:pIndex>', product.index, name="myadmin_product_index"),
    path('product/add', product.add, name="myadmin_product_add"),
    path('product/insert', product.insert, name="myadmin_product_insert"),
    path('product/del/<int:pid>', product.delete, name="myadmin_product_del"),
    path('product/edit/<int:pid>', product.edit, name="myadmin_product_edit"),
    path('product/update/<int:pid>', product.update, name="myadmin_product_update"),
    
    #Customer 
    path('customer/<int:pIndex>', customer.index, name="myadmin_customer_index"), #浏览会员

    #promocode
    path('pcode/<int:pIndex>', promocode.index, name="myadmin_pcode_index"),
    path('pcode/add', promocode.add, name="myadmin_pcode_add"),
    path('pcode/insert', promocode.insert, name="myadmin_pcode_insert"),
    path('pcode/del/<int:pid>', promocode.delete, name="myadmin_pcode_del"),
    path('pcode/edit/<int:pid>', promocode.edit, name="myadmin_pcode_edit"),
    path('pcode/update/<int:pid>', promocode.update, name="myadmin_pcode_update"),
    
    #sales management 
    path('sales/index', sales.index, name="myadmin_sale_index"),
    path('sales/Dspend', sales.Davgspend, name="myadmin_spend_day"),
    path('sales/Wspend', sales.Wavgspend, name="myadmin_spend_week"),
    path('sales/Mspend', sales.Mavgspend, name="myadmin_spend_month"),

    path('sales/Dfrequency', sales.Dfrequency, name="myadmin_frequency_day"),
    path('sales/Wfrequency', sales.Wfrequency, name="myadmin_frequency_week"),
    path('sales/Mfrequency', sales.Mfrequency, name="myadmin_frequency_month"),

    path('sales/product', sales.Dproductsale, name="myadmin_product_day"),
    path('sales/Wproduct', sales.Wproductsale, name="myadmin_product_week"),
    path('sales/Mproduct', sales.Mproductsale, name="myadmin_product_month"),

]
