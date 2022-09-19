from django.contrib import admin
from .models import Patient, CustomUser, Doctor


# class PatientAdmin(admin.ModelAdmin):
#     class Meta:
#         model = Patient


# class DoctorAdmin(admin.ModelAdmin):

#     class Meta:
#         model = Doctor


class CustomUserAdmin(admin.ModelAdmin):
    list_display = ["email", "fullName"]

    class Meta:
        model = CustomUser


# admin.site.register(Patient, PatientAdmin)
# admin.site.register(Doctor, DoctorAdmin)

admin.site.register(CustomUser, CustomUserAdmin)
