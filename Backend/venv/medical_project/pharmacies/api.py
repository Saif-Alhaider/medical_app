from ninja import Router
from .models import Medicine,Pharmacy
router = Router(tags=['Pharmacy'])

@router.get("medicines")
def pharmacy_medicines(request,pharmacy_name:str):
    medicines = list(Pharmacy.objects.get(name=pharmacy_name).medicines.all().values())
    
    return medicines
