from django.db import models
from accounts.models import Patient,Doctor,CustomUser
from doctor.models import DoctorProfile
# Create your models here.
# -- coding: UTF-8 -- 
class Appointments(models.Model):
    date = models.DateTimeField()
    user = models.ForeignKey(CustomUser, related_name='patient_appointments', on_delete=models.CASCADE,blank=True, null=True)
    doctor = models.ForeignKey(DoctorProfile,related_name="doctor_assigned" ,on_delete=models.CASCADE,blank=True, null=True)
    
    