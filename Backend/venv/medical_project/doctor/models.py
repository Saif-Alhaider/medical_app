from django.db import models
from accounts.models import Doctor, CustomUser
from speciality.models import Specialitiy
from django.db.models.signals import post_save
from django.dispatch import receiver
from django_countries.fields import CountryField
from clinic.models import Clinic
# Create your models here.


@receiver(post_save, sender=Doctor)
def create_user_profile(sender, instance, created, *args, **kwargs):
    if created and instance.role == "DO":
        newDoc = DoctorProfile.objects.create(
            user=instance, doctor_id=instance.id)
        newDoc.save()


class DoctorProfile(models.Model):
    user = models.OneToOneField(
        CustomUser, on_delete=models.CASCADE, related_name="doctor_account", db_constraint=False)
    image = models.ImageField(blank=True, null=True,
                              upload_to='doctor_profile_pic')
    doctor_id = models.IntegerField(blank=True, null=True)
    speciality = models.ForeignKey(
        Specialitiy, related_name='doc_special', on_delete=models.DO_NOTHING, blank=True, null=True)
    country = CountryField(blank=True, null=True)
    description = models.TextField(max_length=220, blank=True, null=True)
    work_at = models.ForeignKey(
        Clinic,related_name='clinic_doctors', on_delete=models.DO_NOTHING, blank=True, null=True)

    def __str__(self):
        return self.user.fullName
