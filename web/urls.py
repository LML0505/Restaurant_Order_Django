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
from web.views import index
from web.views import cart,orders 

urlpatterns = [
    path('', index.index, name="myweb_index"),

  # login out url
    path('login', index.login, name="myweb_login"),
    path('dologin', index.dologin, name="myweb_dologin"),
    path('logout', index.logout, name="myweb_logout"),
    path('verify', index.verify, name="myweb_verify"), #验证码 


        #为url路由添加请求前缀web/,凡是带此前缀的url地址必须登录后才可访问
        path('web/',include([
            path('', index.webIndex, name="web_index"), #前台大堂点餐首页
            # 购物车信息管理路由配置
            path('cart/add/<str:pid>', cart.add, name="myweb_cart_add"), #购物车添加
            path('cart/del/<str:pid>', cart.delete, name="myweb_cart_del"),#购物车删除
            path('cart/clear', cart.clear, name="myweb_cart_clear"), #购物车清空
            path('cart/change', cart.change, name="myweb_cart_change"),#购物车更改

            # 订单处理
            path('orders/<int:pIndex>', orders.index, name="web_orders_index"), #浏览订单
            path('ordershis/<int:pIndex>', orders.index_history, name="web_orders_index1"),
            path('orders/insert', orders.insert,name='web_orders_insert'), #执行订单添加操作
            path('orders/detail', orders.detail,name='web_orders_detail'), #订单的详情信息
            path('orders/status', orders.status,name='web_orders_status'), #修改订单状态
            path('orders/update<int:oid>',orders.paymentstatus,name="web_orders_payment"),# payment status 

        ]))



]
