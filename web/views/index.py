# myobject/web/views/index.py
from tkinter.tix import TList
from django.shortcuts import render,redirect
from django.http import HttpResponse
from myadmin.models import User 
from django.urls import reverse 
from myadmin.models import Category
from myadmin.models import Product,Table 

#order homepage
def index(request):
    clist = Category.objects.filter(status=1)
    plist =Product.objects.filter(status__lt=9)
    tlist=Table.objects.all()
    context={"clist":clist,"plist":plist,"tlist":tlist}
    return render(request,'myweb/index.html',context)

def webIndex(request):
    '''点餐前台首页'''
    #获取购物车中菜品信息
    clist = Category.objects.filter(status=1)
    plist =Product.objects.filter(status__lt=9)
    tlist=Table.objects.all()
    #context={"clist":clist,"plist":plist}
    cartlist = request.session.get("cartlist",{})
    total_money = 0 #初始化一个总金额变量
    #遍历购物车中菜品，并累计统计总金额
    for vo in cartlist.values():
        total_money = total_money + vo['num'] * vo['price']
        print(vo['price'])
    request.session["total_money"] = total_money #将总金额存放到session中
    #tablenumber = request.POST['tablenumber']
    #request.session["table"]=tablenumber 
    context = {"categorylist":request.session.get('categorylist',{}).items()
    ,"totalmoney":total_money,"clist":clist,"plist":plist,"tlist":tlist}
    return render(request,"myweb/index.html",context)



#login 
def login(request):
    return render(request,'myweb/login.html')

# 会员执行登录
def dologin(request):
    #验证判断
   # verifycode = request.session['verifycode']
   # code = request.POST['code']
   
    #   context = {'info':'verificode wrong！'}
    #    return render(request,"myweb/login.html",context)
    try:
        user=User.objects.get(username=request.POST['username'])
        #see if is admin
        if user.ifstaff()==1:
                if user.validateLogin(request.POST['username'],request.POST['pass']) == 1:
                #login in success 
                    print ('login success')
                    # write into session 
                    request.session['webuser']=user.toDict()
                    #redirect to admin mgt page 
                    #make categorylist and productlist in session 
                    # so shopingcart can use the session data 
                    clist = Category.objects.filter(status=1)
                    categorylist = dict()
                    productlist = dict()
                    for vo in clist:
                        c = {'id':vo.id,'name':vo.name,'pids':[]}
                        plist = Product.objects.filter(category_id=vo.id,status=1)
                        for p in plist:
                            c['pids'].append(p.toDict())
                            productlist[p.id] = p.toDict()
                        categorylist[vo.id] = c
                    request.session['categorylist'] = categorylist  #菜品类别列表
                    request.session['productlist'] = productlist    #菜品列表
                    print(categorylist,productlist)
                    return redirect(reverse("myweb_index"))
                    
                else :
                    context= {"info":"password is wrong "} 




        else:
           context= {"info":"account is not valid "} 

    except Exception as err:
        print(err)
        context= {"info":"account is not exist "}
    
    return render(request,"myweb/login.html",context)

# 会员退出
def logout(request):
    del request.session['webuser']
    return redirect(reverse("myweb_login"))

def verify(request):
    #引入随机函数模块
    import random
    from PIL import Image, ImageDraw, ImageFont
    #定义变量，用于画面的背景色、宽、高
    #bgcolor = (random.randrange(20, 100), random.randrange(
    #    20, 100),100)
    bgcolor = (242,164,247)
    width = 100
    height = 25
    #创建画面对象
    im = Image.new('RGB', (width, height), bgcolor)
    #创建画笔对象
    draw = ImageDraw.Draw(im)
    #调用画笔的point()函数绘制噪点
    for i in range(0, 100):
        xy = (random.randrange(0, width), random.randrange(0, height))
        fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
        draw.point(xy, fill=fill)
    #定义验证码的备选值
    #str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0'
    str1 = '0123456789'
    #随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]
    #构造字体对象，ubuntu的字体路径为“/usr/share/fonts/truetype/freefont”
    font = ImageFont.truetype('static/arial.ttf', 21)
    #font = ImageFont.load_default().font
    #构造字体颜色
    fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))
    #绘制4个字
    draw.text((5, -3), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, -3), rand_str[1], font=font, fill=fontcolor)
    draw.text((50, -3), rand_str[2], font=font, fill=fontcolor)
    draw.text((75, -3), rand_str[3], font=font, fill=fontcolor)
    #释放画笔
    del draw
    #存入session，用于做进一步验证
    request.session['verifycode'] = rand_str
    """
    python2的为
    # 内存文件操作
    import cStringIO
    buf = cStringIO.StringIO()
    """
    # 内存文件操作-->此方法为python3的
    import io
    buf = io.BytesIO()
    #将图片保存在内存中，文件类型为png
    im.save(buf, 'png')
    #将内存中的图片数据返回给客户端，MIME类型为图片png
    return HttpResponse(buf.getvalue(), 'image/png')
