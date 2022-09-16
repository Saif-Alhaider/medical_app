from distutils.text_file import TextFile
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
# Create your models here.


class UserHealthInfo(models.Model):
    class GenderChoices(models.TextChoices):
        MALE = "M", "Male"
        FEMALE = "F", "Female"

    class BloodTypeChoices(models.TextChoices):
        AP = "A+", "A+"
        BP = "B+", "B+"
        ABP = "AB+", "AB+"
        AM = "A-", "A-"
        BM = "B-", "B-"
        ABM = "AB-", "AB-"
        OP = "O+", "O+"
        OM = "O-", "O-"

    gender = models.CharField(max_length=1, blank=True,
                              null=True, choices=GenderChoices.choices)
    height = models.PositiveIntegerField(blank=True, null=True, validators=[
        MinValueValidator(63), MaxValueValidator(220)])  # heghit in cm
    weight = models.PositiveIntegerField(blank=True, null=True, validators=[
        MinValueValidator(50), MaxValueValidator(220)])  # weight in kg
    age = models.PositiveIntegerField(blank=True, null=True, validators=[
        MinValueValidator(18), MaxValueValidator(110)])
    blood_type = models.CharField(
        max_length=3, choices=BloodTypeChoices.choices)
    description = models.TextField(max_length=200,blank=True, null=True)

    def __str__(self):
        return f"{self.gender}-{self.age}yrs"


# CustomUser.objects.get(id=2).health_info  