from django.contrib import admin
from .models import Medicine
# Register your models here.

class MedicinesAdmin(admin.ModelAdmin):
    list_display = ['title']

admin.site.register(Medicine, MedicinesAdmin)
