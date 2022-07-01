from tkinter import Y
from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse
from django.core.paginator import Paginator
from datetime import datetime

from myadmin.models import User,Category,Product,Orders,OrderDetail,Payment

def index(request,pIndex=1):
    '''浏览订单信息'''
    
    omod = Orders.objects
   
    mywhere=[]
    list = omod.filter(status=1)

    # 获取、判断并封装状态status搜索条件
    kw = request.GET.get('keyword','')
    if kw != '':
        list = list.filter(table=kw)
        mywhere.append("keyword="+kw)

    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(list,10) #以10条每页创建分页对象
    maxpages = page.num_pages #最大页数
    #判断页数是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) #当前页数据
    plist = page.page_range   #页码数列表
    
    for vo in list2:
        if vo.user_id != 0:
           
      
            user = User.objects.only('nickname').get(id=vo.user_id)
            vo.user_id=user.nickname
            
    #封装信息加载模板输出
    context = {"orderslist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere,'url':request.build_absolute_uri()}
    return render(request,"myweb/list.html",context)

def index_history(request,pIndex=1):
    '''浏览订单信息'''
    
    omod = Orders.objects
   
    mywhere=[]
    list = omod.filter(status=3)

    # 获取、判断并封装状态status搜索条件
    kw = request.GET.get('keyword','')
    if kw != '':
        list = list.filter(table=kw)
        mywhere.append("keyword="+kw)

    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(list,10) #以10条每页创建分页对象
    maxpages = page.num_pages #最大页数
    #判断页数是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) #当前页数据
    plist = page.page_range   #页码数列表
    
    for vo in list2:
        if vo.user_id != 0:
           
      
            user = User.objects.only('nickname').get(id=vo.user_id)
            vo.user_id=user.nickname
            
    #封装信息加载模板输出
    context = {"orderslist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere,'url':request.build_absolute_uri()}
    return render(request,"myweb/list1.html",context)


def insert(request):
    '''大堂执行订单添加操作'''
    try:
        
        # 执行订单信息添加操作
        
        od = Orders()
        od.table=request.GET.get("table")
        print(request.GET.get("table"))
        od.cus_id = 0 #会员id
        od.user_id = request.session['webuser']['id'] #操作员id
        
        od.money = request.session['total_money']
        od.status = 1 #订单状态:1过行中/2无效/3已完成
        od.payment_status = 2 #支付状态:1未支付/2已支付/3已退款
        od.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        od.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        od.save()

        # 执行支付信息添加
        op = Payment()
        op.order_id = od.id #订单id号
        op.cus_id = 0 #会员id号
        op.money = request.session['total_money'] #支付款
        op.type = 1 #付款方式：1 cash/2收银收款
        op.status = 2 #支付状态:1未支付/2已支付/3已退款
        op.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        op.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        op.save()

        cartlist = request.session.get("cartlist",{}) #获取购物车中的菜品信息

        #go through cartlist to add order deatil
        for item in cartlist.values():
            #print(item['id'])
            odetail = OrderDetail()
            odetail.order_id = od.id  #订单id
            odetail.product_id = item['id']  #菜品id
            odetail.product_name = item['name'] #菜品名称
            odetail.price = item['price']     #单价
            odetail.quantity = item['num']  #数量
            odetail.status = 1 #状态:1正常/9删除
            odetail.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            odetail.save()


        del request.session['cartlist']  
        del request.session['total_money']
        return HttpResponse("Y")
    except Exception as err:
        print(err)
        context = {"info":"add fail try later ！"}
        return HttpResponse("N")

def detail(request):
    '''加载订单信息'''
    
       
    oid = request.GET.get("oid",1)

    # 加载订单详情
    dlist = OrderDetail.objects.filter(order_id=oid)
    # 遍历每个商品详情，从Goods中获取对应的图片
    #for og in dlist:
    #    og.picname = Goods.objects.only('picname').get(id=og.goodsid).picname
    print(dlist)
    # 放置模板变量，加载模板并输出
    context = {"detaillist":dlist}
    return render(request,"myweb/detail.html",context)

def status(request):
    ''' 修改订单状态 '''
       
    try:
        oid = request.GET.get("oid",'0')
        ob = Orders.objects.get(id=oid)
        ob.status = request.GET['status']
        ob.save()
        return HttpResponse("Y")
    except Exception as err:
        print(err)
        return HttpResponse("N")



def paymentstatus(request,oid=0):
    try:
        od=Orders.objects.get(id=oid)
        if od.payment_status==1 :

            od.payment_status=2
            od.save()
        elif od.payment_status==2 :
            od.payment_status=3
            od.save()
        

        return redirect('/myweb/web/orders/1')

    except Exception as err: 

        return redirect('/myweb/web/orders/1')
  
