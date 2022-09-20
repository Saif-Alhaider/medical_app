from django.contrib import admin
from .models import Specialitiy
# Register your models here.

class SpecialitiyAdmin(admin.ModelAdmin):
    list_display = ['title']
    class Meta:
        model = Specialitiy

admin.site.register(Specialitiy, SpecialitiyAdmin)
