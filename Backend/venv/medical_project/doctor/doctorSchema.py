from .models import DoctorProfile
from speciality.models import Specialitiy
from ninja import Schema,ModelSchema
        
class DoctorInfoSchema(ModelSchema):
    speciality:str
    country:str
    description:str
    class Config:
        model = DoctorProfile
        model_fields = ['image']
    
        

class DoctorInfoErr(Schema):
    details:str

