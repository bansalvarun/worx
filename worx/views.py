from django.shortcuts import get_object_or_404, render
from apps.restaurants.models import *

def home(request):
	args = {}
	restaurants = Restaurant.objects.all()[:5]
	cusines = Cusine.objects.all()[:5]
	establishments = Establishment.objects.all()[:5]
	localities = Locality.objects.all()[:5]
	args['restaurants'] = restaurants
	args['cusines'] = cusines	
	args['establishments'] = establishments
	args['localities'] =localities;

	return render(request, 'index.html', args)	


