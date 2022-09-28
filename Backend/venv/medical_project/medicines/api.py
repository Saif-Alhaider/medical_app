from turtle import title
from ninja import Router
from .models import Medicine
from .schema import AllMedicinesSchema,MedicineErr,MedicineSchema
from pharmacies.models import Pharmacy
from django.core.paginator import Paginator,EmptyPage
router = Router(tags=['Medicines'])


@router.get("/",)
def medicines(request,page_num:int):
    medicines = Medicine.objects.all()
    
    data = []
    for medicine in medicines:
        pharmacies = Medicine.objects.get(title=medicine.title).pharmacy_medicine.all(
        ).values('name', 'latitude', 'longitude')
        data.append({
            "id":medicine.id,
            "title":medicine.title,
            "description":medicine.description,
            "medicinetype":medicine.medicinetype,
            "pharmacies":list(pharmacies)
        })
    return data
    # try:
    #     p = Paginator(medicines,6)
    #     page = p.page(page_num)
    #     return {
    #         "num_pages":p.num_pages,
    #         "medicines":page.object_list
    #     }
    # except EmptyPage:
    #     return {"details":"there are no more doctors"}


@router.post("add", response={201: MedicineSchema})
def add_medicine(request, medicine: MedicineSchema):
    medicine = Medicine.objects.create(**medicine.dict())
    return 201, medicine.__dict__


@router.get("medicine_pharmacies")
def medicine_pharmacies(request, medicine_name: str):
    try:
        pharmacies = Medicine.objects.get(title=medicine_name).pharmacy_medicine.all(
        ).values('name', 'latitude', 'longitude')
    except Medicine.DoesNotExist:
        return {"details":"medicine not found"}

    return str(list(pharmacies))

@router.get("medicine_info")
def get_medicine_info(request,medicine_id:int):
    medicine = Medicine.objects.get(id=medicine_id)
    pharmacies = list(medicine.pharmacy_medicine.all(
        ).values('name', 'latitude', 'longitude'))
    return {
        "title":medicine.title,
        "description":medicine.description,
        "medicinetype":medicine.medicinetype,
        "pharmacies availabel":pharmacies,
    }