from unicodedata import name
from django.db import models
from accounts.models import CustomUser
# from doctor.models import DoctorProfile
# Create your models here.
class Clinic(models.Model):
    name = models.CharField(max_length=256)
    latitude = models.DecimalField(max_digits=12, decimal_places=9,blank=True, null=True)
    longitude = models.DecimalField(max_digits=12, decimal_places=9,blank=True, null=True)