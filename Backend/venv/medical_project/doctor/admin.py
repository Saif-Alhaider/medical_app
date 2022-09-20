from django.contrib import admin
from .models import DoctorProfile
# Register your models here.

class DoctorProfileAdmin(admin.ModelAdmin):
    list_display = ['user']
    readonly_fields = ['doctor_id','user']

admin.site.register(DoctorProfile, DoctorProfileAdmin)
