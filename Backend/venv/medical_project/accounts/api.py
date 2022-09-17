import email
from ninja import Router
from .authSchema import AccountSchema, AuthOut, AccountError, UserHealthInfoSchema
from .models import CustomUser,Doctor,Patient
from django.contrib.auth import get_user_model
from .authorization import create_jwt_token, AuthBearer
from user_health_info.models import UserHealthInfo

# User = get_user_model()
router = Router()


@router.post("/create_health_info", auth=AuthBearer())
def getUser(request, user_health_info: UserHealthInfoSchema):
    requested_user_email = request.auth["EMAIL"]

    user = CustomUser.objects.get(
        email=requested_user_email)
    if user.health_info == None:
        user.health_info = UserHealthInfo.objects.create(
            **user_health_info.dict())
        user.save()
    else:
        user.health_info.height = user_health_info.height
        user.health_info.weight = user_health_info.weight
        user.health_info.blood_type = user_health_info.blood_type
        user.health_info.age = user_health_info.age
        user.health_info.description = user_health_info.description
        user.health_info.save()

    return {"email": requested_user_email, "health info": {
        "gender":user.health_info.gender,
        "height":user.health_info.height,
        "weight":user.health_info.weight,
        "age":user.health_info.age,
        "blood_type":user.health_info.blood_type,
        "description":user.health_info.description,
        
    }}


@router.post("/create_user", response={
    201: AuthOut,
    401: AccountError
})
def create_user(request, user: AccountSchema):
    try:

        Patient.objects.get(
            email=user.email
        )
    except Patient.DoesNotExist:
        newUser = Patient.objects.create_user(
            email=user.email, first_name=user.first_name, last_name=user.last_name, password=user.password)


        newUser.set_password(newUser.password)

        token = create_jwt_token(newUser)
        return 201, {
            "token": token,
            "accountOut": newUser
        }
    return 401, {"details": "already an account"}


@router.get("/doctors")
def get_doctors(request):
    doctors = Doctor.objects.all()
    listOfDoctors = [doctor.fullName for doctor in Doctor.objects.all()]
    return listOfDoctors