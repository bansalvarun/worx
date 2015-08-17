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
	extra = 0
	fk_name = 'dish'

class DishInline(NestedStackedInline):
	model = Dish
	exclude = ('userUpVotes','userDownVotes', )
	extra = 1
	fk_name = 'dish_type'
	inlines = [DishPriceInLine]

class DishTypePriceInLine(NestedTabularInline):
	model = Dish_type_pricee
	extra = 1
	fk_name = 'priceOf'


class DishTypeInline(NestedStackedInline):
	model = Dish_type
	extra = 1
	fk_name = 'restaurant'
	inlines = [DishTypePriceInLine, DishInline]

class RestaurantAdmin(NestedModelAdmin):
	model = Restaurant
	filter_horizontal = ('cuisines','establishment',)
	inlines = [DishTypeInline]
admin.site.register(Restaurant, RestaurantAdmin)