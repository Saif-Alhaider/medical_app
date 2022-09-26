from django.contrib import admin
from .models import Pharmacy
# Register your models here.

class PharmacyAdmin(admin.ModelAdmin):
    list_display = ['name']

admin.site.register(Pharmacy, PharmacyAdmin)
