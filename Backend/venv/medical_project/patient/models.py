from django.db import models
from accounts.models import Patient,CustomUser
from django.db.models.signals import post_save
from django.dispatch import receiver
# Create your models here.


@receiver(post_save,sender=Patient)
def create_user_profile(sender,instance,created,*args, **kwargs):
    if created and instance.role == "PA":
        PatientProfile.objects.create(user=instance,patient_id=instance.id)


class PatientProfile(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    patient_id = models.IntegerField(blank=True, null=True)
