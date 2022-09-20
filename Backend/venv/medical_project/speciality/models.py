from django.db import models

# Create your models here.

class Specialitiy(models.Model):
    class Meta:
        verbose_name = "Speciality"
        verbose_name_plural = "Specialities"
    title = models.CharField(max_length=80,unique=True)
    
    def __str__(self):
        return self.title