from ninja import Schema,ModelSchema 
from .models import Appointments


class appointmentSchema(ModelSchema):
    class Config:
        model = Appointments
        model_fields = ['date','doctor']
