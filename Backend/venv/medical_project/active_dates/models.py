from datetime import datetime
from django.db import models
from doctor.models import DoctorProfile
# Create your models here.
class ActiveDates(models.Model):
    doctor = models.ForeignKey(DoctorProfile,on_delete=models.DO_NOTHING,related_name="active_date")
    datetime = models.DateTimeField(unique=True)
    
    def __str__(self):
        return f"{self.doctor.user.fullName} {self.datetime}"