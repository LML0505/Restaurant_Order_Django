# myobject/mobile/views/index.py


from datetime import datetime
from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse
from myadmin.models import Product, Category,Orders,promoCode,OrderDetail,Customer,Table
from django.db.models import Q
from django.core.exceptions import ObjectDoesNotExist

# Create your views here.
def tableno(request):
    return render(request,"mobile/table.html")

def addtable(request):
    table_no=request.POST['table']
    request.session['table_no']=table_no
    
    return redirect(reverse('mobile_index'))

def index(request):
    '''home page'''
    table=Table()
    table.table_id=request.session['table_no']
    table.save()
    #del request.session['table_no']
    request.session['table']=table.toDict()
    clist = Category.objects.filter(status=1)
    productlist = dict()
    for vo in clist:
        plist = Product.objects.filter(category_id=vo.id,status=1)
        productlist[vo.id] = plist
    #request.session['table']={'tid':tid}
    context = {"categorylist":clist,"productlist":productlist.items(),"cid":clist[0],"table":table}
    return render(request,"mobile/index.html",context)



def addOrders(request):
    ''' prepare checkout  '''
    #尝试从session中获取名字为cartlist的购物车信息，若没有返回{}
    cartlist = request.session.get('cartlist',{})
    total_money = 0 #初始化一个总金额
    #遍历购物车中的菜品并累加总金额
    for vo in cartlist.values():
        total_money += vo['num']*vo['price']
    request.session['total_money'] = total_money #放进session
    return render(request,"mobile/addOrders.html")
#order global id   
oid=0
#customer global id 
cid=0
def doAddOrders(request):
    
    try:
        # find promocode
        discount = 0  
        info=''
        pcode=request.POST.get('promoCode','')         
        if pcode != '':
            pc=promoCode.objects.get(Q(code=request.POST['promoCode']),Q(status=1))
            discount=pc.discount
            info='promocode valid'
        else :
            info='no promocode used'
        #add cust
        custlist=Customer.objects.all()
        result =1;
        cus=Customer()
        for cust in custlist:
            if cust.mobile != request.POST['mobile'] :
                #means is new customer 
                result=0
            else :
                result =1
        if result == 0:

           cus=Customer()
           cus.email = request.POST['email']
           #cus.creditCard = request.POST['creditCard']
           cus.mobile = request.POST['mobile']
           cus.status=1;
           cus.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
           cus.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
           cus.save()
        if result == 1 :
            cus = Customer.objects.get(mobile=request.POST['mobile'])
            cus.email = request.POST['email']
            #cus.creditCard = request.POST['creditCard']
            #cus.mobile = request.POST['mobile']
            cus.status=1;
            cus.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            cus.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            cus.save()
        global cid
        cid=cus.id
            

        #cus=Customer.objects.filter(mobile=request.POST['mobile'])
        #add order 
        od = Orders()
        total =request.session['total_money']
        total = total-discount
        od.table=request.session['table']['table_id']
        od.cus_id = cus.id
        od.user_id = 0
        od.money = total
        od.status = 1 #订单状态:1过行中/2无效/3已完成
        od.promoCode=request.POST['promoCode']
        od.payment_status = 1 #支付状态:1未支付/2已支付/3已退款
        od.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        od.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        od.save()

       

        #add order detail
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

        # 清空session购物车信息
        request.session["cartlist"]
        del request.session['total_money']
       
        global oid 
        oid=od.id
        print(oid)
        context={"order":od,"info":info,"discount":discount}
    except Exception as err :
        context={"order":od,"info":"promocode not used","discount":discount}
    return render(request,"mobile/orderinfo.html",context)

    
def viewOrder(request):
        global oid
        global cid
        print(oid)
        odetail=OrderDetail.objects.filter(order_id=oid)
        print(odetail)
        order=Orders.objects.get(id=oid)
        cus=Customer.objects.get(id=cid)
        print(order)
        context= {"odlist":odetail,"order":order,"cus":cus}
        return render(request,"mobile/myorder.html",context)

def payment(request,oid=0):
    order=Orders.objects.get(id=oid)
    order.payment_status=2
    order.save()
    global cid 
    cus=Customer.objects.get(id=cid)
    cus.creditCard = request.POST['creditCard']
    cus.save()
    del request.session["cartlist"]
    context={"order":order,"cus":cus}
    return render(request,"mobile/paymentinfo.html",context)