from .models import DoctorProfile
from speciality.models import Specialitiy
from ninja import Schema,ModelSchema
        
class DoctorInfoSchema(Schema):
    speciality:str
    country:str
    description:str
    # class Config:
    #     model = DoctorProfile
    #     model_fields = ['speciality','country','description']
    
        

class DoctorInfoErr(Schema):
    details:str

