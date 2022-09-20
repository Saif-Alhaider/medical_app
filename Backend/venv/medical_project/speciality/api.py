from turtle import title
from ninja import Router
from doctor.models import DoctorProfile
router = Router(tags=['specialtiy'])

@router.get('/{specialtiyTitle}')
def get_specialtiy_doctors(request,specialtiyTitle):
    doctors = DoctorProfile.objects.filter(speciality__title=specialtiyTitle)
    data = []
    for doctor in doctors:
        data.append({
                "full name":doctor.user.fullName,
                "specialtiy":doctor.speciality.title,
                "country":doctor.country.name
            })
    return {"result":data}
    