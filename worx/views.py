from django.shortcuts import get_object_or_404, render
from apps.restaurants.models import *
from django.http import HttpResponse
from django.template import RequestContext
from django.http import HttpResponseRedirect
from django.core.context_processors import csrf
from django.contrib.auth.decorators import login_required
import datetime

@login_required(login_url='/accounts/login/')
def profile(request):
  # userp = get_object_or_404(Profile, pk=url)
  args ={}
  # args['user'] = user;
  return render(request, 'profile.html', args) 




def error404(request):
    return render(request,'404.html', status=404)



def handler404(request):
    response = render_to_response('404.html', {},
                                  context_instance=RequestContext(request))
    response.status_code = 404
    return response

def home(request):
	args = {}
	# restaurants = Restaurant.objects.all()[:5]
	# cuisines = Cuisine.objects.all()[:5]
	# establishments = Establishment.objects.all()[:5]
	# localities = Locality.objects.all()[:5]
	# args['restaurants'] = restaurants
	# args['cuisines'] = cuisines	
	# args['establishments'] = establishments
	# args['localities'] =localities;
	return render(request, 'index.html', args)	

def loaderVerify(request):
	content = "loaderio-478d2141c8b3b653e6190dcff0b4518c"
	return HttpResponse(content, content_type='text/plain')
