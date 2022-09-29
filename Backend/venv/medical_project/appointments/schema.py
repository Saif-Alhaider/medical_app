from datetime import datetime
from ninja import Schema,ModelSchema 
from .models import Appointments


class appointmentSchema(Schema):
    date:datetime
    doctor_id:int


class appointmentFourOFour(Schema):
    details:str
    
class ResponseAppointment(Schema):
    date:str
    doctor:str
    user:str