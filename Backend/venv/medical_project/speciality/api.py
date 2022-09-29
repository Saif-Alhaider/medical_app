from turtle import title
from ninja import Router
from doctor.models import DoctorProfile
from django.core.paginator import Paginator,EmptyPage
router = Router(tags=['specialtiy'])

@router.get('/{specialtiyTitle}')
def get_specialtiy_doctors(request,specialtiyTitle,page_num:int):
    doctors = DoctorProfile.objects.filter(speciality__title=specialtiyTitle)
    data = []
    for doctor in doctors:
        data.append({
                "full name":doctor.user.fullName,
                "specialtiy":doctor.speciality.title,
                "country":doctor.country.name
            })
    try:
        p = Paginator(data,6)
        page = p.page(page_num)
        return {
            "num_pages":p.num_pages,
            "doctors":page.object_list
        }
    except EmptyPage:
        return {"doctors":data}
    
    
    
# doctors = DoctorProfile.objects.all()
#     data = []
#     for doctor in doctors:
#         data.append({
#             "full_name": str(doctor.user.fullName),
#             "speciality": str(doctor.speciality.title),
#             "image": "images/"+str(doctor.image),
#             "id":doctor.doctor_id,
#             "clinic":None if doctor.work_at is None else doctor.work_at.name,
#         })
#     try:
#         p = Paginator(data,6)
#         page = p.page(page_num)
#         return 200,{
#             "num_pages":p.num_pages,
#             "doctors":page.object_list
#         }
#     except EmptyPage:
#         return 404,{"details":"there are no more doctors"}