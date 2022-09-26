from ninja import ModelSchema
from .models import Medicine
class MedicineSchema(ModelSchema):
    class Config:
        model = Medicine
        model_fields = ['id',"title","description",'medicinetype']