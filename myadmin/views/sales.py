# view for boss salse mgt 

from xml.etree.ElementTree import PI
from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
from django.db.models import Q
from django.core.paginator import Paginator
from datetime import datetime
import random
from django.db.models.functions import ExtractMonth,ExtractWeek,ExtractDay
from django.db.models import Sum,Count
from sympy import O

from myadmin.models import Orders,OrderDetail

def index(request):
    return render(request,"myadmin/sale/index.html")

def Davgspend(request):
    #data = Orders.objects.all()
    '''
    day_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)',
								'day': 'day(create_at)', }).values('year', 'month', 'day').annotate(count=Count('id'),total=Sum('money'))
  				 
    
    for day in day_count:
        avg=day['total']/day['count']
         # only 2 decimal use round(avg,2)
        day['avg']=round(avg,2)
    #print(day_count)
    '''
    day_count=Orders.getDavgspend()
    context={"day":day_count}
    #print(day_count['count'])
    #print(day_count.values)
    return render(request,"myadmin/sale/Davgspend.html",context)

def Wavgspend(request):
    #data = Orders.objects.all()
    '''
    week_count = data.extra(select={'year': 'year(create_at)','month': 'month(create_at)',
								'week': 'week(create_at)'}).values('year', 'month', 'week').annotate(count=Count('id'),total=Sum('money'))
  				 
    
    for w in week_count:
        avg=w['total']/w['count']
       
         # only 2 decimal use round(avg,2)
        w['avg']=round(avg,2)
    #print(week_count)
    '''
    week_count=Orders.getWavgspend()
    context={"week":week_count}
    #print(day_count['count'])
    
    return render(request,"myadmin/sale/Wavgspend.html",context)

def Mavgspend(request):
    #data = Orders.objects.all()
    '''
    month_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)'}).values('year', 'month').annotate(count=Count('id'),total=Sum('money'))
  				 
    
    for m in month_count:
        avg=m['total']/m['count']
       
         # only 2 decimal use round(avg,2)
        m['avg']=round(avg,2)
    #print(month_count)
    '''
    month_count=Orders.getMavgspend()
    context={"month":month_count}
    #print(day_count['count'])
    
    return render(request,"myadmin/sale/Mavgspend.html",context)


def Dfrequency(request):
    '''
    data = Orders.objects.all()
    day_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)',
								'day': 'day(create_at)', }).values('year', 'month', 'day').annotate(count=Count('id'),total=Sum('money'))
  				 
    
    for day in day_count:
        avg=day['total']/day['count']
         # only 2 decimal use round(avg,2)
        day['avg']=round(avg,2)
    #print(day_count)
    '''
    day_count=Orders.getDfrequency()
    context={"day":day_count}
    #print(day_count['count'])
    print(day_count.values)
    return render(request,"myadmin/sale/Dfrequency.html",context)

def Wfrequency(request):
    '''
    data = Orders.objects.all()
    week_count = data.extra(select={'year': 'year(create_at)','month': 'month(create_at)',
								'week': 'week(create_at)'}).values('year', 'month', 'week').annotate(count=Count('id'),total=Sum('money'))
  				 
    
    for w in week_count:
        avg=w['total']/w['count']
       
         # only 2 decimal use round(avg,2)
        w['avg']=round(avg,2)
    #print(week_count)
    '''
    week_count=Orders.getWfrequency()
    context={"week":week_count}
    #print(day_count['count'])
    
    return render(request,"myadmin/sale/Wfrequency.html",context)

def Mfrequency(request):
    '''
    data = Orders.objects.all()
    month_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)'}).values('year', 'month').annotate(count=Count('id'),total=Sum('money'))
  				 
    
    for m in month_count:
        avg=m['total']/m['count']
       
         # only 2 decimal use round(avg,2)
        m['avg']=round(avg,2)
    #print(month_count)
    '''
    month_count=Orders.getMfrequency()
    context={"month":month_count}
    #print(day_count['count'])
    
    return render(request,"myadmin/sale/Mfrequency.html",context)

def Dproductsale(request):
    '''
    data = OrderDetail.objects.all()
    day_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)',
								'day': 'day(create_at)', }).values('year', 'month', 'day','product_name').annotate(total=Sum('quantity'))
  	'''			 
    '''
    for day in day_count:
        avg=day['total']/day['count']
         # only 2 decimal use round(avg,2)
        day['avg']=round(avg,2)
    '''
    day_count=OrderDetail.getDproduct()
    #print(day_count)
    context={"day":day_count}
    #print(day_count['count'])
    #print(day_count.values)
    return render(request,"myadmin/sale/Dproduct.html",context)

def Wproductsale(request):
    '''
    data = OrderDetail.objects.all()
    week_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)',
								'week': 'week(create_at)', }).values('year', 'month', 'week','product_name').annotate(total=Sum('quantity'))
  	'''			 
    '''
    for day in day_count:
        avg=day['total']/day['count']
         # only 2 decimal use round(avg,2)
        day['avg']=round(avg,2)
    '''
   # print(day_count)
    week_count=OrderDetail.getWproduct()
    context={"week":week_count}
    #print(day_count['count'])
    #print(day_count.values)
    return render(request,"myadmin/sale/Wproduct.html",context)

def Mproductsale(request):
    '''
    data = OrderDetail.objects.all()
    month_count = data.extra(select={'year': 'year(create_at)',
								'month': 'month(create_at)', }).values('year', 'month','product_name').annotate(total=Sum('quantity'))
  	'''
    '''
    for day in day_count:
        avg=day['total']/day['count']
         # only 2 decimal use round(avg,2)
        day['avg']=round(avg,2)
    '''
    month_count=OrderDetail.getMproduct()
   # print(day_count)
    context={"month":month_count}
    #print(day_count['count'])
    #print(day_count.values)
    return render(request,"myadmin/sale/Mproduct.html",context)