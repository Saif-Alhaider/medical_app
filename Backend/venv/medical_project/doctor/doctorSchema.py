from datetime import datetime
import email
from msilib import schema
from .models import DoctorProfile
from speciality.models import Specialitiy
from ninja import Schema,ModelSchema
from user_health_info.models import UserHealthInfo
class DoctorInfoSchema(ModelSchema):
    speciality:str
    country:str
    description:str
    class Config:
        model = DoctorProfile
        model_fields = ['image']
    
        

class DoctorInfoErr(Schema):
    details:str

class GetDoctorInfoSchema(Schema):
    fullName:str
    description:str
    email:str
    country:str
    image:str
    speciality:str
    active_dates:list[datetime]
    
    
class HealthInfoSchema(ModelSchema):
    class Config:
        model = UserHealthInfo
        model_fields = "__all__"
        
class DoctorPatientInfo(Schema):
    fullName:str
    email:str
    health_info:HealthInfoSchema
    
    

class Doctor(Schema):
    id:int
    full_name:str
    speciality:str
    image:str
    clinic:str | None


class PaginationDoctors(Schema):
    num_pages:int
    doctors:list[Doctor]
    
