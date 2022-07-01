from xml.etree.ElementTree import PI
from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
from django.db.models import Q
from django.core.paginator import Paginator
from datetime import datetime
import random

from myadmin.models import Uprofile

def index(request,pIndex=1):
    '''浏览信息'''
    umod = Uprofile.objects.all()
    ulist= umod.filter(status__lt = 9) # 9 means delete so dun show 
    mywhere=[]
    #get search and find 
    kw=request.GET.get("keyword",None)
    if kw:
        ulist =ulist.filter(Q(name__contains=kw)|Q(name__contains=kw))
        mywhere.append('keyword='+kw)
    # 分页 seperate page
    pIndex=int(pIndex)
    page=Paginator(ulist,10) #5data for one year 
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
    context = {"userlist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere}
    return render(request,"myadmin/profile/index.html",context)

def add(request):
    ''' to add info'''
    return render (request,"myadmin/profile/add.html")
''' for add testing data
def addtest(request):
    try:
        for i in range(1,101):
            ob = Uprofile()
            ob.name = 'test'+str(i)
            ob.gender = random.randint(1,2)
            ob.age = random.randint(18,60)
            ob.status = random.randint(1,3)
            ob.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            ob.save()
        context={'info':"add success!"}
    except Exception as err:
        context ={'info': "add fail! "}
    return render(request,"myadmin/info.html",context)
'''


def insert(request):
    ''' do add action  '''
    try:
        ob = Uprofile()
        ob.name = request.POST['name']
        ob.gender = request.POST['gender']
        ob.age = request.POST['age']
        ob.status = request.POST['status']
        ob.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        context={'info':"add success!"}
    except Exception as err:
        context ={'info': "add fail! "}
    return render(request,"myadmin/info.html",context)
    
def delete(request,uid=0):
    try:
        ob = Uprofile.objects.get(id=uid)
        ob.status = 9
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        ob.save()
        
        context={'info':"delete success!"}
    except Exception as err:
        context ={'info': "delete fail! "}
    return JsonResponse(context)

def edit(request,uid=0):
    ''' go edit infomation '''
    try:
        ob = Uprofile.objects.get(id=uid)
        context={'user':ob}
        return render(request,"myadmin/profile/edit.html",context)
    except Exception as err:
        context ={'info': "fail to find the info need to edit "}
        return render(request,"myadmin/info.html",context)
def update(request,uid=0):
    ''' do edit infomation '''
    try:
       
        ob = Uprofile.objects.get(id=uid)
        ob.name = request.POST['name']
        ob.gender = request.POST['gender']
        ob.age=request.POST['age']
        ob.status = request.POST['status']
       
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
       
        ob.save()
        
        context={'info':"edit success!"}
    except Exception as err:
        context ={'info': "edit fail! "}
    
    return render(request,"myadmin/info.html",context)
