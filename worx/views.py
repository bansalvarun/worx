from django.shortcuts import get_object_or_404, render
from apps.restaurants.models import *
from django.http import HttpResponse

def home(request):
	args = {}
	restaurants = Restaurant.objects.all()[:5]
	cuisines = Cuisine.objects.all()[:5]
	establishments = Establishment.objects.all()[:5]
	localities = Locality.objects.all()[:5]
	args['restaurants'] = restaurants
	args['cuisines'] = cuisines	
	args['establishments'] = establishments
	args['localities'] =localities;

	return render(request, 'index.html', args)	

def loaderVerify(request):
	content = "loaderio-478d2141c8b3b653e6190dcff0b4518c"
	return HttpResponse(content, content_type='text/plain')
