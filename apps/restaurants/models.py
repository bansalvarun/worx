from django.db.models import *
import datetime
from django.utils import timezone
from django.contrib.auth.models import User
from django.contrib.auth.models import Group
from allauth.account.models import EmailAddress
from allauth.account.signals import user_signed_up
from django.dispatch import receiver
from django.template.defaultfilters import slugify


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
	enable = BooleanField(default=False)
	name = CharField(max_length=50, default="Restaurant name")
	about = CharField(max_length=500, blank=True)
	facebook = CharField(max_length=100, blank=True)
	address = CharField(max_length=300, blank=True)
	locality = ForeignKey(Locality, blank=True)
	phone = CharField(max_length=13, blank=True)
	coverpic = CharField(max_length=100, blank=True, help_text="Please give me the 'Direct Link (email & IM)' from imgur image resolution 1600X900")
	thumbnail = CharField(max_length=100, blank=True, help_text="Please give me the 'Direct Link (email & IM)' from imgur image resolution 25x25")
	album = CharField(max_length=300, blank=True, help_text="upload album to imgur.com -> from album url,say 'http://imgur.com/a/mJ4Jf#0' -> get 'a/mJ4Jf' ")
	cuisines = ManyToManyField(Cuisine, blank=True)
	establishment = ManyToManyField(Establishment, blank=True)
	url = CharField(unique=True, max_length=50)
	service_charge = FloatField(blank=True, null=True)
	service_tax_food = FloatField(blank=True,null=True)
	service_tax_drinks = FloatField(blank=True,null=True)
	service_tax_hardDrinks = FloatField(blank=True,null=True)
	vat = FloatField(blank=True,null=True)
	def __unicode__(self):
		return self.name
	def get_establishments(self):
		return ", ".join([e.name for e in self.establishment.all()])

class Dish_type(Model):
	restaurant = ForeignKey(Restaurant)
	name = CharField(max_length=30, default="dish type name")
	about = CharField(max_length=100, blank=True, null=True)
	veg_nonveg = (('V', 'Veg'), ('N', "Non Veg"), ('B', "Both"),('D', 'Drinks'), ('H', "Hard Drinks"),)
	vegOrNot = CharField(max_length=1, choices=veg_nonveg, blank="True")
	def __unicode__(self):
		return self.name
	def get_about(self):
		return self.about.split(',')


class Dish(Model):
	dish_type = ForeignKey(Dish_type)
	name = CharField(max_length=50, default="dish name", blank=True, null=True)
	about = CharField(max_length=100, blank=True)
	userUpVotes = ManyToManyField(User, blank=True, related_name='likes')
	userDownVotes = ManyToManyField(User, blank=True, related_name='dislike')
	def __unicode__(self):
		return self.name
	def get_about(self):
		return self.about.split()

class Dish_price(Model):
	dish = ForeignKey(Dish, null=True, blank=True)
	qty_or_name = CharField(max_length=50, blank=True)
	price = FloatField(default=0, blank=True)
	veg_nonveg = (('V', 'Veg'), ('N', "Non Veg"),('B', "Both Veg and Non Veg"),('D', "Drink"),)
	vegOrNot = CharField(max_length=1, choices=veg_nonveg, blank="True")
	def __unicode__(self):
		return self.qty_or_name

class Notifications(Model):
	restaurant = ForeignKey(Restaurant)
	title = CharField(max_length=100)
	about = TextField()
	def __unicode__(self):
		return self.title

class Item(Model):
	name = CharField(max_length="100")
	qtyName = CharField(max_length="100", blank=True, null=True)
	qty = IntegerField()
	price = FloatField()
	def __unicode__(self):
		return self.name + " "+self.qtyName
	def __init__(self,a,b,c):
		self.name = a
		self.qty = b
		self.price = c
		