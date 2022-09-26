from django.db import models

class MedicineTypeChoices(models.TextChoices):
        PILLS = 'Pills','Pills'
        SYRUP = 'Syrup','Syrup'
        SYRINGE = 'Syring','Syring'
        CREAM = 'Cream','Cream'
# Create your models here.
class Medicine(models.Model):
    
    title = models.CharField(max_length=256,unique=True)
    description = models.TextField(blank=True, null=True)
    medicinetype = models.CharField(max_length=10,choices=MedicineTypeChoices.choices,blank=True, null=True)
    
    def __str__(self):
        return self.title