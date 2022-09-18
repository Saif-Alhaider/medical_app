from ninja import Schema, ModelSchema
from .models import CustomUser
from user_health_info.models import UserHealthInfo


class AccountSchema(ModelSchema):
    class Config:
        model = CustomUser
        model_fields = ['email', 'first_name', 'last_name', 'password']


class TokenOut(Schema):
    access: str


class AccountOut(Schema):
    first_name: str
    last_name: str
    email: str


class AuthOut(Schema):
    token: TokenOut
    accountOut: AccountOut


class AccountError(Schema):
    details: str


class UserHealthInfoSchema(ModelSchema):
    class Config:
        model = UserHealthInfo
        model_fields = ['gender', 'height', 'weight',
                        'age', 'blood_type', 'description']



