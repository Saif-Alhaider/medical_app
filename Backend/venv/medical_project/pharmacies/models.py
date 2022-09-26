from unicodedata import name
from django.db import models
from medicines.models import Medicine
# Create your models here.
class Pharmacy(models.Model):
    name = models.CharField(max_length=256,)
    latitude = models.DecimalField(max_digits=12, decimal_places=9)
    longitude = models.DecimalField(max_digits=12, decimal_places=9)
    medicines = models.ManyToManyField(Medicine, related_name="pharmacy_medicine")