from django.db import models
from accounts.models import Patient,Doctor
# Create your models here.
# -- coding: UTF-8 -- 
class Appointments(models.Model):
    date = models.DateTimeField()
    patient = models.ForeignKey(Patient, related_name='patient_appointments', on_delete=models.CASCADE,blank=True, null=True)
    doctor = models.ForeignKey(Doctor,related_name="doctor_assigned" ,on_delete=models.CASCADE,blank=True, null=True)
    
    