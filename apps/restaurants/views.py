from django.shortcuts import get_object_or_404, render
from apps.restaurants.models import *
from django.http import HttpResponse
# Create your views here.


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
	restaurants = Restaurant.objects.all()
	args['restaurants'] = restaurants
	return render(request, 'restaurants/all.html', args)

def menu(request, url):
	restaurant = get_object_or_404(Restaurant, pk=url)
	dish_type_ob = Dish_type.objects.filter(restaurant = restaurant)
	args = {}
	args['restaurant'] = restaurant
	args['dish_type_ob'] = dish_type_ob
	args['dishes'] = Dish.objects.all()
	args['dish_price_type_ob'] = Dish_price.objects.all()
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

def vote(request):
   dish_id = int(request.POST.get('id'))
   vote_type = request.POST.get('type')
   vote_action = request.POST.get('action')
   dish = get_object_or_404(Dish, pk=dish_id)
   thisUserUpVote = Dish.liked_by.filter(id = request.Profile.user.id).count()
   thisUserDownVote = Dish.disliked_by.filter(id = request.Profile.user.id).count()

   if (vote_action == 'vote'):
      if (thisUserUpVote == 0) and (thisUserDownVote == 0):
         if (vote_type == 'up'):
            Dish.userUpVotes.add(request.user)
         elif (vote_type == 'down'):
            Dish.userDownVotes.add(request.user)
         else:
            return HttpResponse('error-unknown vote type')
      else:
         return HttpResponse('error - already voted', thisUserUpVote, thisUserDownVote)
   elif (vote_action == 'recall-vote'):
      if (vote_type == 'up') and (thisUserUpVote == 1):
         Dish.userUpVotes.remove(request.user)
      elif (vote_type == 'down') and (thisUserDownVote ==1):
         Dish.userDownVotes.remove(request.user)
      else:
         return HttpResponse('error - unknown vote type or no vote to recall')
   else:
      return HttpResponse('error - bad action')


   num_votes = Dish.userUpVotes.count() - Dish.userDownVotes.count()

   return HttpResponse(num_votes)

