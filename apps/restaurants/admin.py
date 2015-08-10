from django.contrib import admin
from nested_inline.admin import NestedStackedInline, NestedModelAdmin, NestedTabularInline
from .models import *

# Register your models here.

admin.site.register(Cusine)
admin.site.register(Establishment)
admin.site.register(Locality)


class DishPriceTypeInLine(NestedTabularInline):
	model = Dish_price_type
	extra = 0
	fk_name = 'dish'

class DishInline(NestedStackedInline):
	model = Dish
	exclude = ('userUpVotes','userDownVotes', )
	extra = 1
	fk_name = 'dish_type'
	inlines = [DishPriceTypeInLine]

class DishTypeInline(NestedStackedInline):
	model = Dish_type
	extra = 1
	fk_name = 'restaurant'
	inlines = [DishInline]

class RestaurantAdmin(NestedModelAdmin):
	model = Restaurant
	filter_horizontal = ('cusines','establishment',)
	inlines = [DishTypeInline]
admin.site.register(Restaurant, RestaurantAdmin)