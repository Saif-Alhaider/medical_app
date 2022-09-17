from enum import unique
from weakref import proxy
from django.db import models
from django.contrib.auth.models import AbstractUser, UserManager
from user_health_info.models import UserHealthInfo
# Create your models here.


class CustomUserManager(UserManager):
    def create_user(self, email, first_name: str, last_name: str, password=None, health_info=None):
        if not email:
            raise ValueError('user must have an email to register')

        user = self.model(
            email=self.normalize_email(email),
            first_name=first_name,
            last_name=last_name,
            health_info=health_info
        )
        user.set_password(password)
        user.save(using=self._db)
        return user
        # user = CustomUser(email=CustomUser.objects.normalize_email(email))

    def create_superuser(self,  email, first_name: str, last_name: str, password):
        user = self.model(
            email=self.normalize_email(email),
            first_name=first_name,
            last_name=last_name,

        )
        user.set_password(password)
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


class CustomUser(AbstractUser):
    class Role(models.TextChoices):
        ADMIN = "AD", "Admin"
        PATIENT = "PA", "Patient"
        DOCTOR = "DO", "Doctor"

    role = models.CharField(max_length=2, choices=Role.choices)
    base_role = Role.ADMIN
    first_name = models.CharField(max_length=30, blank=False, null=False)
    last_name = models.CharField(max_length=150, blank=False, null=False)
    username = None
    email = models.EmailField(max_length=254, unique=True)

    health_info = models.OneToOneField(
        UserHealthInfo, related_name='healtInfo', on_delete=models.SET_NULL, blank=True, null=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []
    objects = CustomUserManager()
    def save(self, *args, **kwargs):
        if not self.pk:
            self.role = self.base_role

            # Call the real save() method
            return super(CustomUser, self).save(*args, **kwargs)

    @property
    def fullName(self):
        return f"{self.first_name} {self.last_name}"
    def __str__(self):
        return self.email


class PatientManager(UserManager):
    def create_user(self, email, first_name: str, last_name: str, password=None, health_info=None):
        if not email:
            raise ValueError('user must have an email to register')

        user = self.model(
            email=self.normalize_email(email),
            first_name=first_name,
            last_name=last_name,
            health_info=health_info
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def get_queryset(self):
        return super().get_queryset().filter(role=CustomUser.Role.PATIENT)


class Patient(CustomUser):
    base_role = CustomUser.Role.PATIENT
    objects = PatientManager()

    class Meta:
        proxy = True


class DoctorManager(UserManager):
    def get_queryset(self):
        return super().get_queryset().filter(role=CustomUser.Role.DOCTOR)


class Doctor(CustomUser):
    base_role = CustomUser.Role.DOCTOR
    objects = DoctorManager()

    class Meta:
        proxy = True
# CustomUser.objects.create_user(email="saifalhaider@gmail.com",first_name="saif",last_name="alhaider",password="123",health_info=UserHealthInfo(

# ))
