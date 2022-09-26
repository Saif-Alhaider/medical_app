"""medical_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from accounts.api import router
from doctor.api import router as doctor_router
from speciality.api import router as speciality_router
from active_dates.api import router as active_dates_router
from appointments.api import router as appointment_router
from pharmacies.api import router as pharmaciesRouter
from medicines.api import router as medicinesRouter
from user_health_info.api import router as healthInfoRouter

from ninja import NinjaAPI
from django.conf.urls.static import static
from django.conf import settings
api = NinjaAPI()
api.add_router('user',router)
api.add_router('doctor',doctor_router)
api.add_router('speciality',speciality_router)
api.add_router('active_dates',active_dates_router)
api.add_router('appointment',appointment_router)
api.add_router('pharmacies',pharmaciesRouter)
api.add_router('medicines',medicinesRouter)
api.add_router('user_health_info',healthInfoRouter)
urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', api.urls),
]

urlpatterns += static(settings.MEDIA_URL,document_root = settings.MEDIA_ROOT)