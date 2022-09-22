from django.contrib import admin
from .models import Appointments
# Register your models here.
class AppointmentsAdmin(admin.ModelAdmin):
    list_display=['user','doctor']
    class Meta:
        model = Appointments

admin.site.register(Appointments, AppointmentsAdmin)
