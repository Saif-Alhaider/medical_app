from django.db import models
from accounts.models import CustomUser
# Create your models here.
class Clinic(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.DO_NOTHING)
    title  = models.CharField(max_length=90,)