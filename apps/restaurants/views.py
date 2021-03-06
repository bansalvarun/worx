from django.shortcuts import get_object_or_404, render
from apps.restaurants.models import *
from django.http import HttpResponseRedirect,HttpResponse
from django.core.urlresolvers import reverse
try:
    from django.utils import simplejson as json
except ImportError:
    import json
from django.views.decorators.http import require_POST
from django.contrib.auth.decorators import login_required


# Create your views here.
import unicodedata
def splitBill(request):
  if 'q' in request.GET and request.GET['q']:
    q = request.GET['q']
    args = {}
    items = q
    items = unicodedata.normalize('NFKD', q).encode('ascii','ignore')
    items = items.split(";")
    items = items[1:-1]
    # items = list(items.decode("utf-8"))
    for i in range(len(items)):
      items[i] = items[i].split()
      item = items[i]
      item[-2] = int(item[-2])
      items[i] = item
    itemsList =[]
    for i in range(len(items)):
      it = items[i]
      item = Item(it[-3] , int(it[-2]) , float(it[-1]))
      if(len(it)>3):
        item.qtyName = it[0]  
      else:
        item.qtyName = ""
      itemsList.append(item)
    args['bill'] = itemsList

    return render(request, 'restaurants/splitBill.html', args)
  else:
    return render(request, 'restaurants/splitBill.html')

def search(request):
    if 'q' in request.GET and request.GET['q']:
        args = {}
        q = request.GET['q']
        args['q'] = q
        restaurants = Restaurant.objects.filter(name__icontains=q)
        args['restaurants'] = restaurants 
        localities = Locality.objects.filter(city__icontains = q)
        if(localities):
        	args['localities'] = localities
        	mylist = []
        	for locality in localities:
        		mylist.append(Restaurant.objects.filter(locality = locality))
    		args['restaurants_by_locality'] = mylist
        return render(request, 'restaurants/search.html',args)
    else:
        return render(request, 'restaurants/search.html')

def restaurants(request):
	args = {}
	restaurants = Restaurant.objects.filter(enable = True)
	args['restaurants'] = restaurants
	args['localities'] = Locality.objects.all()
	args['establishments'] = Establishment.objects.all()
	args['cities'] = City.objects.all()
	return render(request, 'restaurants/all.html', args)

def restaurantsDisable(request):
  args = {}
  restaurants = Restaurant.objects.filter(enable = False)
  args['restaurants'] = restaurants
  return render(request, 'restaurants/all.html', args)



def menu(request, url):
	restaurant = get_object_or_404(Restaurant, pk=url)
	# dish_type_ob = Dish_type.objects.filter(restaurant = restaurant)
	args = {}
	args['restaurant'] = restaurant
	return render(request, 'restaurants/menu.html', args)
def menu2(request, url):
	restaurant = get_object_or_404(Restaurant, url=url)
	# dish_type_ob = Dish_type.objects.filter(restaurant = restaurant)
	args = {}
	args['restaurant'] = restaurant
	return render(request, 'restaurants/menu.html', args)
def cuisines(request):
	cuisines = Cuisine.objects.all()
	args = {}
	args['cuisines'] = cuisines
	return render(request, 'restaurants/cuisines.html', args)

def localities(request):
	localities = Locality.objects.all()
	args = {}
	args['localities'] = localities
	return render(request, 'restaurants/localities.html', args)

def establishments(request):
	args = {}
	establishments = Establishment.objects.all()
	args['establishments'] = establishments
	return render(request, 'restaurants/establishments.html', args)

def likeDish(request):
  dishid = request.POST.get('dishid')
  dish = get_object_or_404(Dish, pk=dishid)
  myid = request.POST.get('userid')
  flag = "grey"
  myuser = get_object_or_404(User, pk=myid)
  if((request.POST['choice'] == 'like')):
    # print dish.userDownVotes.all()
    if(myuser not in dish.userUpVotes.all()):
      dish.userUpVotes.add(myuser)
      dish.save()
      dish.userDownVotes.remove(myuser)
      dish.save()
      flag = "blue"
    elif(myuser in dish.userUpVotes.all()):
      dish.userUpVotes.remove(myuser)
      dish.save()
      dish.userDownVotes.remove(myuser)
      dish.save()
      flag = "grey"
  elif((request.POST['choice'] == 'dislike')):
    # print dish.userDownVotes.all()
    if(myuser not in dish.userDownVotes.all()):
      dish.userDownVotes.add(myuser)
      dish.save()
      dish.userUpVotes.remove(myuser)
      dish.save()
      flag = "black"
    elif(myuser in dish.userDownVotes.all()):
      dish.userDownVotes.remove(myuser)
      dish.save()
      dish.userUpVotes.remove(myuser)
      dish.save()
      flag = "grey"

  response_data = {}
  response_data['like'] = dish.userUpVotes.count()
  response_data['dislike'] = dish.userDownVotes.count()
  response_data['flag'] = flag
  return HttpResponse(json.dumps(response_data),content_type="application/json")