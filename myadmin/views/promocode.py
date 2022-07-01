from xml.etree.ElementTree import PI
from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
from django.db.models import Q
from django.core.paginator import Paginator
from datetime import datetime
import time,os
import random

from myadmin.models import User,promoCode
# create your views here 

def index(request,pIndex=1):
    '''浏览信息'''
    pcode = promoCode.objects
    pclist= pcode.all()
    mywhere=[]
    #get search and find 
    kw=request.GET.get("keyword",None)
    if kw:
        pclist =pclist.filter(code__contains=kw)
        mywhere.append('keyword='+kw)
    # 分页 seperate page
    pIndex=int(pIndex)
    page=Paginator(pclist,5) #5data for one year 
    maxpages=page.num_pages #max pages 
    #判断越界 pIdenx cannot be <1 or more than maxpages 
    if pIndex > maxpages:
        pIndex=maxpages
    if pIndex<1:
        pIndex=1
    list2 = page.page(pIndex)#get the page data
    plist = page.page_range# get page number
     

    #ulist = User.objects.all() #获取所有信息
    #封装信息加载模板输出
    context = {"codelist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere}
    return render(request,"myadmin/promoCode/index.html",context)

def add(request):
    
    return render(request,"myadmin/promoCode/add.html")


def insert(request):
    try:
        op = promoCode()
        op.code = request.POST['code']
        op.discount = request.POST['discount']
        op.status = 1
        op.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        op.change_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        op.save()
        context={"info":"add success！"}
    except Exception as err:
        print(err)
        context={"info":"add fail!"}
    return render(request,"myadmin/info.html",context)


        


def delete(request,pid):
    '''删除信息'''
    try:
        op = promoCode.objects.get(id=pid)
        op.status = 9
        op.change = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        op.save()
        context={"info":"delete success ！"}
    except Exception as err:
        print(err)
        context={"info":"delete fail !"}

    return JsonResponse(context)
    #return render(request,"myadmin/info.html",context)


def edit(request,pid=0):
    ''' go edit infomation '''
    try:
        op = promoCode.objects.get(id=pid)
        context={'code':op}
        return render(request,"myadmin/promoCode/edit.html",context)
    except Exception as err:
        context ={'info': "fail to find the info need to edit "}
        return render(request,"myadmin/info.html",context)

def update(request,pid=0):
    ''' do edit infomation '''
    try:  
        op = promoCode.objects.get(id=pid)
        op.code = request.POST['code']
        op.discount = request.POST['discount']
        op.change_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        op.save()
        
        context={'info':"edit success!"}
    except Exception as err:
        context ={'info': "edit fail! "}
    
    return render(request,"myadmin/info.html",context)