from django.db import models
from datetime import datetime
import hashlib
from django.db.models.functions import ExtractMonth,ExtractWeek,ExtractDay
from django.db.models import Sum,Count
# Create your models here.

#staff model 
class Uprofile(models.Model):
    name = models.CharField(max_length=45)
    gender = models.IntegerField() #1:male 2 :female 
    age = models.IntegerField()
    status = models.IntegerField(default=1)    #status:1 staff /2 manager/3 useradmin/6 boss/8banned/ 9deleted 
    create_at = models.DateTimeField(default=datetime.now)    #createtime
    update_at = models.DateTimeField(default=datetime.now)    #changetime
    
    def setUprofile(self,name,gender,age,status):
        self.name=name
        self.gender=gender
        self.age=age
        self.status=status
        self.update_at =datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        self.save()

    class Meta:
        db_table ="uprofile"
class User(models.Model):
    username = models.CharField(max_length=50)    #account
    nickname = models.CharField(max_length=50)    #nickname
    password_hash = models.CharField(max_length=100)#password
    password_salt = models.CharField(max_length=50)    #passwordsalt
    status = models.IntegerField(default=1)    #status:1 staff /2 manager/3 useradmin/6 boss/8banned/ 9deleted
    create_at = models.DateTimeField(default=datetime.now)    #createtime
    update_at = models.DateTimeField(default=datetime.now)    #changetime

    def toDict(self):
       return {'id':self.id,'username':self.username,'nickname':self.nickname,'password_hash':self.password_hash,'password_salt':self.password_salt,'status':self.status,'create_at':self.create_at.strftime('%Y-%m-%d %H:%M:%S'),'update_at':self.update_at.strftime('%Y-%m-%d %H:%M:%S')}
    
    def setUser(self,username,nickname,password_hash,password_salt,status):
       self.username=username 
       self.nickname=nickname
       self.password_hash=password_hash
       self.password_salt=password_salt
       self.status=status
       self.update_at=datetime.now().strftime("%Y-%m-%d %H:%M:%S")
       self.save()
     
    def setUserStatus(self,status):
        self.status=status
        self.save()
        
    def validateLogin(self,username,password):
       result=0
       if self.username==username:
            md5 = hashlib.md5()
                    #password + salt 
            s = password+str(self.password_salt)
            md5.update(s.encode('utf-8'))# put the md5 inside
                        #make compare with the password_hash in database
            if self.password_hash == md5.hexdigest():
                result = 1

       return result 
    def ifadmin(self):
        if 1<self.status<8:
            return 1
        else:
            return 0
    def ifstaff(self):
        if 0<self.status<8:
            return 1
        else:
            return 0

    class Meta:
        db_table = "user"  # ????????????

 

class history(models.Model):
    account_id = models.IntegerField()
    login_time = models.DateTimeField(default=datetime.now)    #createtime
    logout_time = models.DateTimeField(default=datetime.now)    #changetime
    
    def toDict(self):
        return {'id':self.id,'account_id':self.account_id}

    class Meta:
        db_table = "history"

from django.db import models

#???????????????????????? dish category 
class Category(models.Model):
    name = models.CharField(max_length=50)#category name 
    status = models.IntegerField(default=1)        #status:1active /9delete 
    create_at = models.DateTimeField(default=datetime.now)    #create time 
    update_at = models.DateTimeField(default=datetime.now)    #edit time 
    
    def getcategory(self):
        return self.name
    
    def setcategory(self,name):
        self.name=name
        self.update_at=datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        self.save()

    class Meta:
        db_table = "category"  #


#product 
class Product(models.Model):
    category_id = models.IntegerField()    #id
    cover_pic = models.CharField(max_length=50)    #pic
    name = models.CharField(max_length=50)#name
    price = models.FloatField()    #price
    status = models.IntegerField(default=1)        #status:1 normal 2:no sale or no stock 9 delete 
    create_at = models.DateTimeField(default=datetime.now)   
    update_at = models.DateTimeField(default=datetime.now)    
    
    def getProduct(categoryid):
        plist=Product.objects.filter(category_id=categoryid)
        return plist 
    


    def toDict(self):
        return {'id':self.id,'category_id':self.category_id,'cover_pic':self.cover_pic,
        'name':self.name,'price':self.price,'status':self.status,
        'create_at':self.create_at.strftime('%Y-%m-%d %H:%M:%S'),'update_at':self.update_at.strftime('%Y-%m-%d %H:%M:%S')}

    class Meta:
        db_table = "product"  

class Customer(models.Model):
    email = models.CharField(max_length=50)    #??????
    creditCard = models.CharField(max_length=255)    #??????
    mobile = models.CharField(max_length=50)    #??????
    status = models.IntegerField(default=1)        #??????:1??????/2??????/9??????
    create_at = models.DateTimeField(default=datetime.now)    #????????????
    update_at = models.DateTimeField(default=datetime.now)    #????????????

    def toDict(self):
        return {'id':self.id,'nickname':self.email,'email':self.creditCard,'creditCard':self.mobile,'status':self.status,'create_at':self.create_at.strftime('%Y-%m-%d %H:%M:%S'),'update_at':self.update_at.strftime('%Y-%m-%d %H:%M:%S')}

    class Meta:
        db_table = "customer"  # ????????????

class Orders(models.Model):
    table=models.IntegerField() #table num
    cus_id = models.IntegerField() #??????id
    user_id = models.IntegerField()   #?????????id
    money = models.FloatField()     #??????
    mobile = models.CharField(max_length=50)
    status = models.IntegerField(default=1)   #????????????:1?????????/2??????/3?????????
    promoCode = models.CharField(max_length=45)
    payment_status = models.IntegerField(default=2)   #????????????:1?????????/2?????????/3?????????
    create_at = models.DateTimeField(default=datetime.now)  #????????????
    update_at = models.DateTimeField(default=datetime.now)  #????????????
    def getOrderid(self):
        return self.id 
    
    def getOrderDetail(self):
        Olist=OrderDetail.objects.filter(order_id=self.id)
        return Olist 


    def getDavgspend():
        data = Orders.objects.all()
        day_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)',
								'day': 'day(create_at)', }).values('year', 'month', 'day').annotate(count=Count('id'),total=Sum('money'))
  				 
    
        for day in day_count:
                avg=day['total']/day['count']
                # only 2 decimal use round(avg,2)
                day['avg']=round(avg,2)
        return day_count 
    def getWavgspend():
        data = Orders.objects.all()
        week_count = data.extra(select={'year': 'year(create_at)','month': 'month(create_at)',
								'week': 'week(create_at)'}).values('year', 'month', 'week').annotate(count=Count('id'),total=Sum('money'))
  				 
    
        for w in week_count:
            avg=w['total']/w['count']
        
            # only 2 decimal use round(avg,2)
            w['avg']=round(avg,2)
        return week_count 
    def getMavgspend():
         data = Orders.objects.all()
         month_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)'}).values('year', 'month').annotate(count=Count('id'),total=Sum('money'))
  				 
    
         for m in month_count:
                avg=m['total']/m['count']
            
                # only 2 decimal use round(avg,2)
                m['avg']=round(avg,2)
            
         return month_count 
    def getDfrequency():
         data = Orders.objects.all()
         day_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)',
								'day': 'day(create_at)', }).values('year', 'month', 'day').annotate(count=Count('id'),total=Sum('money'))
  				 
    
         for day in day_count:
                avg=day['total']/day['count']
                # only 2 decimal use round(avg,2)
                day['avg']=round(avg,2)
         return day_count 
    def getWfrequency():
        data = Orders.objects.all()
        week_count = data.extra(select={'year': 'year(create_at)','month': 'month(create_at)',
								'week': 'week(create_at)'}).values('year', 'month', 'week').annotate(count=Count('id'),total=Sum('money'))
  				 
    
        for w in week_count:
            avg=w['total']/w['count']
        
            # only 2 decimal use round(avg,2)
            w['avg']=round(avg,2)
        return week_count
    def getMfrequency():
        data = Orders.objects.all()
        month_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)'}).values('year', 'month').annotate(count=Count('id'),total=Sum('money'))
  				 
    
        for m in month_count:
            avg=m['total']/m['count']
        
            # only 2 decimal use round(avg,2)
            m['avg']=round(avg,2)
        return month_count
    class Meta:
        db_table = "orders"  # ????????????

#??????????????????
class OrderDetail(models.Model):
    order_id = models.IntegerField()  #??????id
    product_id = models.IntegerField()  #??????id
    product_name = models.CharField(max_length=50) #????????????
    price = models.FloatField()     #??????
    quantity = models.IntegerField()  #??????
    status = models.IntegerField(default=1) #??????:1??????/9??????
    create_at = models.DateTimeField(default=datetime.now)  #????????????
    
    def getDproduct():

        data = OrderDetail.objects.all()
        day_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)',
								'day': 'day(create_at)', }).values('year', 'month', 'day','product_name').annotate(total=Sum('quantity'))
        
        return day_count

    def getWproduct():
        data = OrderDetail.objects.all()
        week_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)',
								'week': 'week(create_at)', }).values('year', 'month', 'week','product_name').annotate(total=Sum('quantity'))

        return week_count

    def getMproduct():
        data = OrderDetail.objects.all()
        month_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)', }).values('year', 'month','product_name').annotate(total=Sum('quantity'))		 		 
        
        return month_count
    class Meta:
        db_table = "order_detail"  # ????????????

class promoCode(models.Model):
    code=models.CharField(max_length=45)
    discount=models.IntegerField()
    status = models.IntegerField(default=1) #status:1using now /9stoped used 
    create_at = models.DateTimeField(default=datetime.now)  #????????????
    change_at = models.DateTimeField(default=datetime.now)  #????????????
    class Meta:
        db_table = "promocode"  # ????????????

# ??????????????????
class Payment(models.Model):
    order_id = models.IntegerField()  #??????id???
    cus_id = models.IntegerField() #??????id
    money = models.FloatField()     #????????????
    type = models.IntegerField()      #???????????????1cash/2 creditcard
    status = models.IntegerField(default=1) #????????????:1?????????/2?????????/3?????????
    create_at = models.DateTimeField(default=datetime.now)  #????????????
    update_at = models.DateTimeField(default=datetime.now)  #????????????

    class Meta:
        db_table = "payment"  # ????????????

class Table(models.Model):
    table_id=models.IntegerField() #table num 
     
    def toDict(self):
            return {'id':self.id,'table_id':self.table_id}
    class Meta:
        db_table="table"
    