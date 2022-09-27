from datetime import date
from turtle import title
from unicodedata import name
from ninja import Router
from accounts.authSchema import AccountSchema, AuthOut, AccountError
from accounts.models import CustomUser, Doctor, Patient
from accounts.authorization import create_jwt_token, AuthBearer
from .doctorSchema import *
from .models import DoctorProfile
from speciality.models import Specialitiy
from django_countries.fields import Country
from appointments.models import Appointments


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
            "speciality": str(doctor.speciality.title),
            "image": "images/"+str(doctor.image),
            "id":doctor.doctor_id
        })
    return data


@router.get('/doctorAppointments', auth=AuthBearer())
def doctor_appointments(request):
    requested_user_email = request.auth["EMAIL"]
    try:
        doctor = DoctorProfile.objects.get(user__email=requested_user_email)
        doctorAppointments = list(doctor.doctor_assigned.all())
        data = []
        for appointment in doctorAppointments:
            data.append({
                'patient': appointment.user.fullName, 'date': appointment.date})
        return {"doctor": str(doctor.user.fullName), "appointments": data}
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
            "accountOut": newUser,
            "base_role": "DO"
        }
    return 401, {"details": "already an account"}


# doctor token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFTUFJTCI6Im1vaGFtbWFkQWxpQGdtYWlsLmNvbSJ9.6HZyA7a6AQHkUK7zKS79Xk9QNACS2Zifz9FMKxs1KEY

@router.get('create_specialities')
def create_specialities(request):
    spes = ['General', ' Allergist', 'Anesthesiologist', 'Cardiologist', 'Dermatologist', 'Endocrinologist', 'Gastroenterologist', 'Hematologist', 'Infectious Disease Specialist', 'Nephrologist', 'Neurologist',
            'Oncologist', 'Ophthalmologist', 'Orthopedic Surgeon', 'Otolaryngologist', 'Pathologist', 'Pediatrician', 'Psychiatrist', 'Pulmonologist', 'Radiologist', 'Rheumatologist', 'Urologist', 'Vascular Surgeon', 'Other']
    for spe in spes:
        newspe = Specialitiy.objects.create(title=spe)
        newspe.save()
    return str(Specialitiy.objects.all())


@router.get('/doctor_info', response={
    200: GetDoctorInfoSchema,
    404: DoctorInfoErr
})
def doctor_info(request, doctor_id: int):
    try:
        doctor = DoctorProfile.objects.get(doctor_id=doctor_id)
        active_dates = list(
        doctor.active_date.all().values_list('datetime', flat=True))
        return 200, {
            "fullName": doctor.user.fullName,
            "description": doctor.description,
            "email": doctor.user.email,
            "country": doctor.country.name,
            "image": str(doctor.image),
            "active_dates":active_dates
        }
    except DoctorProfile.DoesNotExist:
        return 404, {"details": "doctor not found"}


@router.get('doctor_patients_appointments', auth=AuthBearer())
def doctor_patients_appointments(request):
    requested_user_email = request.auth["EMAIL"]
    try:
        doctor = DoctorProfile.objects.get(user__email=requested_user_email)
        data = []
        for appointment in Appointments.objects.filter(doctor=doctor):
            data.append({
                "id": appointment.user.id,
                "patient name": appointment.user.fullName,
                "date": appointment.date,
            })
        return data
    except DoctorProfile.DoesNotExist:
        return {"details": "doctor not found"}


@router.get("doctor_patient_info", auth=AuthBearer(), response={
    200: DoctorPatientInfo,
    404: DoctorInfoErr
})
def doctor_patient_info(request, user_id: int):
    requested_user_email = request.auth["EMAIL"]
    try:
        doctor = DoctorProfile.objects.get(user__email=requested_user_email)
        patient = Appointments.objects.get(
            doctor=doctor, user__id=user_id).user
        return 200, {"fullName": patient.fullName, "email": patient.email, "health_info": patient.health_info.__dict__}
    except DoctorProfile.DoesNotExist:
        return 404,{"details": "doctor not found", }
