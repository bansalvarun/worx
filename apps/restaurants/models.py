from django.db.models import *
import datetime
from django.db.models import * 
from django.utils import timezone
from django.contrib.auth.models import User
from django.contrib.auth.models import Group
from allauth.account.models import EmailAddress
from allauth.account.signals import user_signed_up
from django.dispatch import receiver
from django.template.defaultfilters import slugify
# Create your models here.


class Profile(Model):
	user = OneToOneField(User, related_name="profile")
	

	# def user_signed_up_(request, user, sociallogin=None, **kwargs):
	# 	if sociallogin:
	# 		# Extract first / last names from social nets and store on User record
	# 		if sociallogin.account.provider == 'twitter':
	# 			name = sociallogin.account.extra_data['name']
	# 			user.first_name = name.split()[0]
	# 			user.last_name = name.split()[1]
	# 		if sociallogin.account.provider == 'facebook':
	# 			user.first_name = sociallogin.account.extra_data['first_name']
	# 			user.last_name = sociallogin.account.extra_data['last_name']
	# 		if sociallogin.account.provider == 'google':
	# 			user.first_name = sociallogin.account.extra_data['given_name']
	# 			user.last_name = sociallogin.account.extra_data['family_name']
	# 		user.save()
	def __unicode__(self):
		return self.user.first_name
	def save(self, user):
		g = Group.objects.get(name=Public)
		user.groups.add(g)
		user.save()

def upload_file_name(instance, filename):
	return "uploads/%s_%s" % (str(time()).replace('.','_'), filename)
class Cuisine(Model):
	name = CharField(max_length=30)
	image = ImageField(upload_to="upload_file_name", blank=True, null="True")
	def __unicode__(self):
		return self.name
class Establishment(Model):
	name = CharField(max_length=30)
	def __unicode__(self):
		return self.name
class City(Model):
	name = CharField(max_length=30)
	def __unicode__(self):
		return self.name

class Locality(Model):
	city = ForeignKey(City, blank=True, null=True)
	part_of_city = CharField(max_length=50, default="East Delhi")
	area = CharField(max_length=30)
	def __unicode__(self):
		return self.area

class Restaurant(Model):
	enable = BooleanField(default=True)
	name = CharField(max_length=50, default="Restaurant name")
	about = CharField(max_length=500, blank=True)
	address = CharField(max_length=300, blank=True)
	city = ForeignKey(City, blank=True, null=True)
	locality = ForeignKey(Locality, blank=True)
	phone = CharField(max_length=13, blank=True)
	url = CharField(max_length=30, unique=True, default="restaurant_name_area_no_space", blank=True)
	image = ImageField(upload_to=upload_file_name, blank=True, null=True)
	cuisines = ManyToManyField(Cuisine, blank=True)
	establishment = ManyToManyField(Establishment, blank=True)
	service_charge = IntegerField(blank=True, null=True)
	service_tax = IntegerField(blank=True,null=True)
	service_tax_food = IntegerField(blank=True,null=True)
	service_tax_drinks = IntegerField(blank=True,null=True)
	vat = IntegerField(blank=True,null=True)
	any_other_tax = IntegerField(blank=True, null=True)
	discount = IntegerField(blank=True, null=True)
	def __unicode__(self):
		return self.name

class Dish_type(Model):
	restaurant = ForeignKey(Restaurant)
	name = CharField(max_length=30, default="dish type name")
	veg_nonveg = (('V', 'Veg'), ('N', "Non Veg"), ('B', "Both"),('D', 'Drinks'), ('H', "Hard Drinks"),)
	vegOrNot = CharField(max_length=1, choices=veg_nonveg, blank="True")
	commonPrice = BooleanField(default=False)
	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ('name',)

class Dish_type_pricee(Model):
	priceOf = ForeignKey(Dish_type, null=True, blank=True)
	name = CharField(max_length=50, blank=True, null=True)
	price = IntegerField(default=0, blank=True, null=True)
	veg_nonveg = (('V', 'Veg'), ('N', "Non Veg"), ('B', "Both"),('D', 'Drinks'), ('H', "Hard Drinks"),)
	vegOrNot = CharField(max_length=1, choices=veg_nonveg, blank="True")
	def __unicode__(self):
		return self.name

class Dish(Model):

	dish_type = ForeignKey(Dish_type)
	name = CharField(max_length=50, default="dish name", blank=True, null=True)
	about = CharField(max_length=100, blank=True)
	userUpVotes = ManyToManyField(Profile, blank=True, related_name='likes')
	userDownVotes = ManyToManyField(Profile, blank=True, related_name='dislike')
	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ('name',)


class Dish_price(Model):
	dish = ForeignKey(Dish, null=True, blank=True)
	qty = CharField(max_length=50, blank=True)
	price = IntegerField(default=0, blank=True)
	veg_nonveg = (('V', 'Veg'), ('N', "Non Veg"),('B', "Both Veg and Non Veg"),('D', "Drink"),)
	vegOrNot = CharField(max_length=1, choices=veg_nonveg, blank="True")
	def __unicode__(self):
		return self.qty

