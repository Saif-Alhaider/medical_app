from ast import Str
from ninja.security import HttpBearer
from jose import jwt,JWTError
from medical_project import settings
class AuthBearer(HttpBearer):
    def authenticate(self, request, token):
        try:
            user_email = jwt.decode(token=token,key=settings.SECRET_KEY,algorithms="HS256")
        except JWTError:
            return {"token":"unauthorized"}
        
        if user_email:
            return user_email


def create_jwt_token(user):
    token = jwt.encode({"EMAIL":str(user.email)},key=settings.SECRET_KEY,algorithm="HS256")
    return {
        "access":token
    }



