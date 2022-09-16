from django.contrib import admin
from .models import UserHealthInfo
# Register your models here.
class UserHealthInfoAdmin(admin.ModelAdmin):
    class Meta:
        model = UserHealthInfo

admin.site.register(UserHealthInfo, UserHealthInfoAdmin)
