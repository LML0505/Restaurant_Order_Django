from urllib import response
from django.test import SimpleTestCase, TestCase, Client 
from django.urls import reverse, resolve 
from web.views import index,cart,orders
from myadmin.models import User,Category,Product,Orders,OrderDetail,Payment
from django.core.paginator import Paginator
from datetime import datetime
import random
import hashlib
# Create your tests here.
'''
class TestEntity_Order(TestCase):
   def setUp(self):
       self.order1=Orders.objects.create(
            table=2,
            cus_id= 1,
            user_id= 1,  
            money=200,   
            mobile=500,
            status=1,  
            promoCode='',
            payment_status= 2,
            create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            )
   def test_order_is_create(self):
       self.assertEqual(self.order1.table,2)
   
   def test_order_is_change_status(self):
        self.order1.status=2
        self.assertEqual(self.order1.status,2)

   def test_order_is_delete(self):
        self.order1.status=3
        self.assertEqual(self.order1.status,3)

class TestEntity_OrderDetail(TestCase):
        def setUp(self):
            self.orderDetail1=OrderDetail.objects.create(
                    order_id=2,
                    product_id= 1,  
                    product_name='butter corn',   
                    price=4,
                    quantity=3,  
                    status=1,
                    create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                )
        def test_orderDetial_is_create(self):
            self.assertEqual(self.orderDetail1.price,4)
'''
class TestEntity_login(TestCase):
        def setUp(self): 
            md5 = hashlib.md5()
            n = random.randint(100000, 999999)
            s = '123456'+str(n) 
            md5.update(s.encode('utf-8'))
            self.account1=User.objects.create(
                    username='test1',
                    nickname='test1',  
                    password_hash = md5.hexdigest(),
                    password_salt = n, 
                    status=1,
                    create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                )
        def test_orderDetial_is_correct_account(self):
            self.assertEqual(self.account1.username,'test1')
        def test_orderDetial_is_correct_password(self):    
            self.assertEqual(self.account1.validateLogin('123456'),1)
'''  
class TestControl(TestCase):
    def test_orderpage_withnotlogin_go_back_tologinpage(self):
        client=Client()
        response = client.get(reverse('myweb_index'))
        print(response['location'])
        #self.assertEquals(response.status_code,200)
        self.assertRedirects(response,reverse('myweb_login'))
        # it return that goes to login page which is correct 
    def test_orderpage_login(self):
        client=Client()
        response = client.get(reverse('myweb_login'))
        self.assertEquals(response.status_code,200)
        self.assertTemplateUsed(response,'myweb/login.html')
    
    def test_orderpage_logout(self):
        client=Client()
        response = client.get(reverse('myweb_logout')) 
        #self.assertEquals(response.status_code,200)
        self.assertRedirects(response,reverse('myweb_login'))
     


# create Test for all Urls 
class TestControler(SimpleTestCase):

    def test_index_url_is_resolved(self):
        url=reverse('myweb_index')
        print(resolve(url))
        self.assertEquals(resolve(url).func,index.index)
    
    def test_login_url_is_resolved(self):
        url=reverse('myweb_login')
        print(resolve(url))
        self.assertEquals(resolve(url).func,index.login)
    
    def test_dologin_url_is_resolved(self):
        url=reverse('myweb_dologin')
        print(resolve(url))
        self.assertEquals(resolve(url).func,index.dologin)
    
    def test_logout_url_is_resolved(self):
        url=reverse('myweb_logout')
        print(resolve(url))
        self.assertEquals(resolve(url).func,index.logout)
    
    def test_verify_url_is_resolved(self):
        url=reverse('myweb_verify')
        print(resolve(url))
        self.assertEquals(resolve(url).func,index.verify)
   

    def test_webindex_url_is_resolved(self):
        url=reverse('web_index')
        print(resolve(url))
        self.assertEquals(resolve(url).func,index.webIndex)
    
    def test_webcartadd_url_is_resolved(self):
        url=reverse('myweb_cart_add',kwargs={'pid':"1"})
        print(resolve(url))
        self.assertEquals(resolve(url).func,cart.add)
    
    def test_webcartdel_url_is_resolved(self):
        url=reverse('myweb_cart_del',kwargs={'pid':"1"})
        print(resolve(url))
        self.assertEquals(resolve(url).func,cart.delete)
    
    def test_webcartclear_url_is_resolved(self):
        url=reverse('myweb_cart_clear')
        print(resolve(url))
        self.assertEquals(resolve(url).func,cart.clear)
    
    def test_webcartchange_url_is_resolved(self):
        url=reverse('myweb_cart_change')
        print(resolve(url))
        self.assertEquals(resolve(url).func,cart.change)
    
    def test_orderindex_url_is_resolved(self):
        url=reverse('web_orders_index',kwargs={'pIndex':"1"})
        print(resolve(url))
        self.assertEquals(resolve(url).func,orders.index)

    def test_orderinsert_url_is_resolved(self):
        url=reverse('web_orders_insert')
        print(resolve(url))
        self.assertEquals(resolve(url).func,orders.insert)
    
    def test_orderdetail_url_is_resolved(self):
        url=reverse('web_orders_detail')
        print(resolve(url))
        self.assertEquals(resolve(url).func,orders.detail)
    
    def test_orderstatus_url_is_resolved(self):
        url=reverse('web_orders_status')
        print(resolve(url))
        self.assertEquals(resolve(url).func,orders.status)
'''
'''
class Test_Product(TestCase):
   def setUp(self):
       self.product1=Product.objects.create(
            category_id=4,
            cover_pic= '1651049133.png',
            name='cola',  
            price=3,   
            status=1,  
        
            create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            )
       self.category1=Category.objects.create(
            name='drink',
            status=1,
            create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        )
   def test_product_is_create(self):
       self.assertEqual(self.product1.name,"cola")
       self.assertEqual(self.category1.name,"drink")
   
   def test_product_edit(self):
        self.product1.price=5
        self.assertEqual(self.product1.price,5)
        self.category1.name='Dessert'
        self.assertEqual(self.category1.name,'Dessert')

   def test_product_is_delete(self):
        self.product1.status=9
        self.assertEqual(self.product1.status,9)
        self.category1.status=9
        self.assertEqual(self.category1.status,9)
'''