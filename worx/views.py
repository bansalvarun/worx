from django.shortcuts import get_object_or_404, render
from apps.restaurants.models import *
from django.http import HttpResponse
from django.template import RequestContext
from django.http import HttpResponseRedirect
from django.core.context_processors import csrf
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt   
from allauth.socialaccount import providers
from allauth.socialaccount.models import SocialLogin, SocialToken, SocialApp
from allauth.socialaccount.providers.facebook.views import fb_complete_login
from allauth.socialaccount.helpers import complete_social_login

import datetime

def error404(request):
  return render(request, '404.html')
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

# Log in from Facebook
@csrf_exempt
def mobile_facebook_login(request):
	response = HttpResponse() ## Create an HTTP Response Object
	if request.method == "POST": # The method better be a POST
		access_token = request.POST.get('access_token') # Get token
		email = request.POST.get('email') # Get email
		try:
			app = SocialApp.objects.get(provider="facebook")
			token = SocialToken(app=app, token=access_token)
			# Check token against facebook                  
			login = fb_complete_login(request, app, token)
			login.token = token
			login.state = SocialLogin.state_from_request(request)
			# Add or update the user into users table
			ret = complete_social_login(request, login)
			# Try to get username from email
			try:
				user = User.objects.get(email=email) # Get User
				# Login the user from Django's perspective
				user.backend = 'django_tours.auth_backend.PasswordlessAuthBackend'
				user = authenticate(email=user.email)
				auth_login(request,user)
                #request.session.cycle_key()
				# If we get here we've failed
			except:
				response['Auth-Response'] = 'failure: %s'%(e)
				response.status_code = 401 # Set status
				return response
			# If we get here we've succeeded
			response['Auth-Response'] = 'success'
			response['User-Is-Authenticated'] = '%s'%(request.user.is_authenticated())
			response.status_code = 200 # Set status  
			return response   
		except Exception,e:
			# If we get here we've failed
			response['Auth-Response'] = 'failure: %s'%(e)
			response.status_code = 401 # Set status
			return response
	else:
		# If we get here we've failed
		response['Auth-Response'] = 'failure'
		response.status_code = 401 # Set status
		return response