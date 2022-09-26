import email
from ninja import Router
from .authSchema import AccountSchema, AuthOut, AccountError, UserHealthInfoSchema,LoginSchema
from .models import CustomUser, Doctor, Patient
from patient.models import PatientProfile
from doctor.models import DoctorProfile
from django.contrib.auth import get_user_model
from .authorization import create_jwt_token, AuthBearer
from user_health_info.models import UserHealthInfo
from appointments.models import Appointments
from django.contrib.auth.hashers import check_password

# User = get_user_model()
router = Router(tags=['account'])


@router.post("/create_health_info", auth=AuthBearer())
def user_health_info(request, user_health_info: UserHealthInfoSchema):
    requested_user_email = request.auth["EMAIL"]
    user = CustomUser.objects.get(
        email=requested_user_email)
    
    if user.health_info == None:
        print(user.health_info)
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
        "gender": user.health_info.gender,
        "height": user.health_info.height,
        "weight": user.health_info.weight,
        "age": user.health_info.age,
        "blood_type": user.health_info.blood_type,
        "description": user.health_info.description,

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
            "accountOut": newUser,
            "base_role":"PA"
        }
    return 401, {"details": "already an account"}



@router.post('/login',response={
    404:AccountError,
    200:AuthOut
}) 
def login(request,user:LoginSchema):
    try:
        queryUser = PatientProfile.objects.get(user__email=user.email)
        querypassword = check_password(user.password,queryUser.user.password)
        
        if not querypassword:
            raise ValueError("the password is incorrect")
        
        token = create_jwt_token(queryUser.user)
        
        return 200,{"token":token,'accountOut':queryUser.user,'base_role':"PA"}
            
    except PatientProfile.DoesNotExist:
        try:
            queryUser = DoctorProfile.objects.get(user__email=user.email)
            querypassword = check_password(user.password,queryUser.user.password)
            
            if not querypassword:
                raise ValueError("the password is incorrect")
            
            token = create_jwt_token(queryUser.user)
            
            return 200,{"token":token,'accountOut':queryUser.user,'base_role':"DO"}
        except DoctorProfile.DoesNotExist:
            return 404,{"details":"user was not found !"}
    
















# doctor token
# eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFTUFJTCI6Im1vaGFtbWFkQWJkdWxsYWhAZ21haWwuY29tIn0.T6-slOu-euCkvBsOLn5S8-l6183KVhZ3hmyEgn5di60

# user token
# eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFTUFJTCI6InNhaWZhbGhhaWRlckBnbWFpbC5jb20ifQ.D-JRVJKI8XOT8TFMdSAwcajxJEyK8rMAJLXGqa56mnw
