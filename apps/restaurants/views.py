from django.shortcuts import get_object_or_404, render
from apps.restaurants.models import *
from django.http import HttpResponseRedirect,HttpResponse
from django.core.urlresolvers import reverse
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
	args['localities'] = Locality.objects.all()
	args['establishments'] = Establishment.objects.all()
	args['cities'] = City.objects.all()
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

# def vote(request, question_id):
#     p = get_object_or_404(Question, pk=question_id)
#     try:
#         selected_choice = p.choice_set.get(pk=request.POST['choice'])
#     except (KeyError, Choice.DoesNotExist):
#         # Redisplay the question voting form.
#         return render(request, 'polls/detail.html', {
#             'question': p,
#             'error_message': "You didn't select a choice.",
#         })
#     else:
#         selected_choice.votes += 1
#         selected_choice.save()
#         # Always return an HttpResponseRedirect after successfully dealing
#         # with POST data. This prevents data from being posted twice if a
#         # user hits the Back button.
#         return HttpResponseRedirect(reverse('polls:results', args=(p.id,)))

def likeDish(request, dishid):
  # print "blah blah"
  dish = get_object_or_404(Dish, pk=dishid)
  # myuser = get_object_or_404(User, pk=int(request.POST['userid']))
  # form = MyForm(request.POST)
  # print form
  print request.POST.get('choice')
  myid = request.POST.get('userid')
  print myid
  myuser = get_object_or_404(User, pk=myid)
  if(request.POST['choice'] == 'like'):
    dish.userUpVotes.add(myuser)
    dish.userDownVotes.remove(myuser)
    dish.save()
  elif(request.POST['choice'] == 'unlike'):
    dish.userUpVotes.remove(myuser)
    dish.userDownVotes.remove(myuser)
    dish.save()
  elif(request.POST['choice'] == 'undislike'):
    dish.userUpVotes.remove(myuser)
    dish.userDownVotes.remove(myuser)
    dish.save()

  elif(request.POST['choice'] == 'dislike'):
    dish.userUpVotes.remove(myuser)
    dish.userDownVotes.add(myuser)
    dish.save()
  # args = {}
  restoid = request.POST['restoid']
  restaurant = get_object_or_404(Restaurant, pk=restoid)
  # args['restaurant'] = restaurant
  return HttpResponseRedirect(reverse('menu', args=(restoid)))
