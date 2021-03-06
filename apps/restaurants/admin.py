from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from nested_inline.admin import NestedStackedInline, NestedModelAdmin, NestedTabularInline
from .models import *

admin.site.unregister(User)
class CustomUserAdmin(UserAdmin):
	list_display = ('username', 'email', 'first_name', 'last_name', 'is_staff','date_joined', 'last_login')
admin.site.register(User, CustomUserAdmin) 
# Register your models here.

admin.site.register(Cuisine)
admin.site.register(Establishment)
admin.site.register(Locality)
admin.site.register(City)
admin.site.register(Notifications)
class DishPriceInLine(NestedTabularInline):
	model = Dish_price
	extra = 3
	fk_name = 'dish'

class NotificationsInLine(NestedStackedInline):
	model = Notifications
	extra = 0
	fk_name = 'restaurant'

class DishInline(NestedStackedInline):
	model = Dish
	extra = 3
	exclude = ('userUpVotes','userDownVotes', )
	filter_horizontal = ('userUpVotes','userDownVotes', )
	fk_name = 'dish_type'
	inlines = [DishPriceInLine]



class DishTypeInline(NestedStackedInline):
	model = Dish_type
	extra = 1
	fk_name = 'restaurant'
	inlines = [DishInline]

class RestaurantAdmin(NestedModelAdmin):
	model = Restaurant
	filter_horizontal = ('cuisines','establishment',)
	list_display = ('name', 'locality','phone', 'get_establishments')
	list_filter = ['cuisines', 'locality', 'establishment',]
	search_fields = ['name', 'cuisines', 'locality', 'establishment',]
	inlines = [NotificationsInLine, DishTypeInline]


admin.site.register(Restaurant, RestaurantAdmin)
