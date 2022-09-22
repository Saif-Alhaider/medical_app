from turtle import title
from unicodedata import name
from ninja import Router
from accounts.authSchema import AccountSchema, AuthOut, AccountError
from accounts.models import CustomUser, Doctor, Patient
from accounts.authorization import create_jwt_token, AuthBearer
from .doctorSchema import DoctorInfoSchema, DoctorInfoErr
from .models import DoctorProfile
from speciality.models import Specialitiy
from django_countries.fields import Country

router = Router(tags=['doctor'])


@router.post("/create_doctor_info", auth=AuthBearer(), response={
    201: DoctorInfoSchema,
    404: DoctorInfoErr
})
def doctor_info(request, doctor_profile_details: DoctorInfoSchema):
    requested_user_email = request.auth["EMAIL"]
    try:
        doctor = DoctorProfile.objects.get(user__email=requested_user_email)
        # print(doctor_profile_details.speciality)
        doctor.speciality = Specialitiy.objects.get(
            title=doctor_profile_details.speciality)
        doctor.country = Country(code=doctor_profile_details.country)
        doctor.description = doctor_profile_details.description
        doctor.save()
        return 201, {"speciality": doctor.speciality.title, 'country': doctor.country.name, 'description': doctor.description}
    except DoctorProfile.DoesNotExist:
        return 404, {'DoctorInfoErr': "doctor was not found"}


@router.get("/doctors")
def get_doctors(request):
    doctors = DoctorProfile.objects.all()
    data = []
    for doctor in doctors:
        data.append({
            "full name": str(doctor.user.fullName),
            "speciality": str(doctor.speciality.title)
        })
    # listOfDoctors = [doctor.fullName for doctor in Doctor.objects.all()]
    return data


@router.get('/doctorAppointments', auth=AuthBearer())
def doctor_appointments(request):
    requested_user_email = request.auth["EMAIL"]
    try:
        doctor = Doctor.objects.get(email=requested_user_email)
        doctorAppointments = list(doctor.doctor_assigned.all())
        data = []
        for appointment in doctorAppointments:
            data.append({
                'doctor': appointment.patient.fullName, 'date': appointment.date})
        return {"doctor": str(doctor.fullName), "data": data}
    except Doctor.DoesNotExist:
        return {"details": "only docotors are authorized"}


@router.post("/create_user_doctor", response={
    201: AuthOut,
    401: AccountError
})
def create_user_doctor(request, user: AccountSchema):
    try:

        Doctor.objects.get(
            email=user.email
        )
    except Doctor.DoesNotExist:
        newUser = Doctor.objects.create_user(
            email=user.email, first_name=user.first_name, last_name=user.last_name, password=user.password)

        newUser.set_password(newUser.password)

        token = create_jwt_token(newUser)
        return 201, {
            "token": token,
            "accountOut": newUser
        }
    return 401, {"details": "already an account"}


# doctor token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFTUFJTCI6InNhaWZhbGhhaWRlckBnbWFpbC5jb20ifQ.D-JRVJKI8XOT8TFMdSAwcajxJEyK8rMAJLXGqa56mnw

@router.get('create_specialities')
def create_specialities(request):
    spes = ['General',' Allergist','Anesthesiologist','Cardiologist','Dermatologist','Endocrinologist','Gastroenterologist','Hematologist','Infectious Disease Specialist','Nephrologist','Neurologist','Oncologist','Ophthalmologist','Orthopedic Surgeon','Otolaryngologist','Pathologist','Pediatrician','Psychiatrist','Pulmonologist','Radiologist','Rheumatologist','Urologist','Vascular Surgeon','Other']
    for spe in spes:
        newspe = Specialitiy.objects.create(title=spe)
        newspe.save()
    return str(Specialitiy.objects.all())