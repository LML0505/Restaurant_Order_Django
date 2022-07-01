from unicodedata import category
from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
from django.core.paginator import Paginator
from datetime import datetime
import time,os


from myadmin.models import Product,Category

def index(request,pIndex=1):
    '''浏览信息'''
    smod = Product.objects
    mywhere=[]
    list = smod.filter(status__lt=9)
    
    # 获取、判断并封装关keyword键搜索
    kw = request.GET.get("keyword",None)
    if kw:
        # 查询店铺名称中只要含有关键字就可以
        list = list.filter(name__contains=kw)
        mywhere.append("keyword="+kw)

    # 获取、判断并封装菜品类别category_id搜索条件
    cid = request.GET.get('category_id','')
    if cid != '':
        list = list.filter(category_id=cid)
        mywhere.append("category_id="+cid)

    # 获取、判断并封装状态status搜索条件
    status = request.GET.get('status','')
    if status != '':
        list = list.filter(status=status)
        mywhere.append("status="+status)

    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(list,8) #以8条每页创建分页对象
    maxpages = page.num_pages #最大页数
    #判断页数是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) #当前页数据
    plist = page.page_range   #页码数列表

    #遍历信息，并获取对应的商铺名称，以shopname名封装
    for vo in list2:
        cob = Category.objects.get(id=vo.category_id)
        vo.categoryname = cob.name

    #封装信息加载模板输出
    context = {"productlist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere}
    return render(request,"myadmin/product/index.html",context)

def add(request):

      oc=Category.objects
      clist = oc.filter(status__lt=9)
      context={"category":clist}

      return render(request,"myadmin/product/add.html",context)

      
    




def insert(request):
    '''执行添加'''
    try:
        #图片的上传处理
        myfile = request.FILES.get("cover_pic",None)
        if not myfile:
            return HttpResponse("没有封面上传文件信息")
        cover_pic = str(time.time())+"."+myfile.name.split('.').pop()
        destination = open("./static/uploads/product/"+cover_pic,"wb+")
        for chunk in myfile.chunks():      # 分块写入文件  
            destination.write(chunk)  
        destination.close()

        #实例化model，封装信息，并执行添加
        ob = Product()
       
        ob.category_id = request.POST['category_id']
        ob.name = request.POST['name']
        ob.price = request.POST['price']
        ob.cover_pic = cover_pic
        ob.status = 1
        ob.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        context={"info":"add success！"}
        
    except Exception as err:
        print(err)
        context={"info":"add fail!"}
    return render(request,"myadmin/info.html",context)

def delete(request,pid):
    '''删除信息'''
    try:
        ob = Product.objects.get(id=pid)
        ob.status = 9
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        context={"info":"delete success ！"}
    except Exception as err:
        print(err)
        context={"info":"delete fail !"}

    return JsonResponse(context)
    #return render(request,"myadmin/info.html",context)


def edit(request,pid):
    '''加载编辑信息页面'''
    try:
        ob = Product.objects.get(id=pid)
        oc=Category.objects
        clist = oc.filter(status__lt=9)
        
        
        context={"product":ob,"category":clist}
        return render(request,"myadmin/product/edit.html",context)
    except Exception as err:
        context={"info":"cannot the product ！"}
        return render(request,"myadmin/info.html",context)

def update(request,pid):
    '''执行编辑信息'''
    try:
        #获取原图片名
        oldpicname = request.POST['oldpicname']
        #判断是否有文件上传
        myfile = request.FILES.get("cover_pic",None)
        if not myfile:
            cover_pic = oldpicname
        else:
          #图片的上传处理
          cover_pic = str(time.time())+"."+myfile.name.split('.').pop()
          destination = open("./static/uploads/product/"+cover_pic,"wb+")
          for chunk in myfile.chunks():      # 分块写入文件  
              destination.write(chunk)  
          destination.close()

        ob = Product.objects.get(id=pid)
        ob.category_id = request.POST['category_id']
        ob.name = request.POST['name']
        ob.price = request.POST['price']
        ob.cover_pic = cover_pic
        ob.status = request.POST['status']
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        context={"info":"edit success！"}
        # 判断删除老图片
        if myfile:
            os.remove("./static/uploads/product/"+oldpicname)
    except Exception as err:
        print(err)
        context={"info":"edit fail"}
        #判断删除刚刚上传的图片
        if myfile:
            os.remove("./static/uploads/product/"+cover_pic)

    return render(request,"myadmin/info.html",context)