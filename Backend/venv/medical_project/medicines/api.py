from turtle import title
from ninja import Router
from .models import Medicine
from .schema import MedicineSchema
from pharmacies.models import Pharmacy
router = Router(tags=['Medicines'])


@router.get("/", response={
    200: list[MedicineSchema]
})
def medicines(request):
    medicines = Medicine.objects.all().values()
    return list(medicines)


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