from ninja import ModelSchema,Schema
from .models import Medicine
class MedicineSchema(ModelSchema):
    class Config:
        model = Medicine
        model_fields = ['id',"title","description",'medicinetype']
        

class AllMedicinesSchema(Schema):
    num_pages:int
    medicines:list[MedicineSchema]
    

class MedicineErr(Schema):
    details:str