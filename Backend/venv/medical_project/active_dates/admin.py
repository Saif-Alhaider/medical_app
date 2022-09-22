from django.contrib import admin
from .models import ActiveDates
# Register your models here.
class ActiveDatesAdmin(admin.ModelAdmin):
    pass

admin.site.register(ActiveDates, ActiveDatesAdmin)
