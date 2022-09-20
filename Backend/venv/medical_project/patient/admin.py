from django.contrib import admin
from .models import PatientProfile
# Register your models here.

class PatientProfileAdmin(admin.ModelAdmin):
    list_display = ['user']
    readonly_fields = ['patient_id','user']

admin.site.register(PatientProfile, PatientProfileAdmin)
