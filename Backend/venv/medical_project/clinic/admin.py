from django.contrib import admin
from .models import Clinic
# Register your models here.

class ClinicAdmin(admin.ModelAdmin):
    list_display = ['title']
    class Meta:
        model = Clinic

admin.site.register(Clinic, ClinicAdmin)
