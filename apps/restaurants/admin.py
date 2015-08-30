from django.contrib import admin
from nested_inline.admin import NestedStackedInline, NestedModelAdmin, NestedTabularInline
from .models import *

# Register your models here.

admin.site.register(Cuisine)
admin.site.register(Establishment)
admin.site.register(Locality)
admin.site.register(City)


class DishPriceInLine(NestedTabularInline):
	model = Dish_price
	extra = 3
	fk_name = 'dish'

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
	inlines = [DishTypeInline]
	list_display = ('name', 'locality','phone', 'get_establishments')
	list_filter = ['cuisines', 'locality', 'establishment',]
	search_fields = ['name', 'cuisines', 'locality', 'establishment',]


admin.site.register(Restaurant, RestaurantAdmin)