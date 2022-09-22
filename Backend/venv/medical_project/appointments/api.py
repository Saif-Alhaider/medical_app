from datetime import datetime
import email
from accounts.models import CustomUser
from doctor.models import DoctorProfile
from ninja import Router
from accounts.authorization import AuthBearer
from .schema import appointmentSchema
from active_dates.models import ActiveDates
from appointments.models import Appointments
import datetime
router = Router(tags=['appointment'])


@router.get('/appointments', auth=AuthBearer())
def get_appointments(request):
    requested_user_email = request.auth["EMAIL"]
    user = CustomUser.objects.get(email=requested_user_email)
    data = []
    userAppointments = list(user.patient_appointments.all())
    for appointment in userAppointments:
        print(appointment)
        data.append({
            'doctor': str(appointment.doctor.user.fullName), 'date': appointment.date, "doctor image": "https://api.lorem.space/image/face?w=150&h=150"})

    return {
        'user': user.fullName,
        "appointments": data
    }


@router.post('/create_appointment', auth=AuthBearer(),)
def create_appointment(request, appointment: appointmentSchema):
    requested_user_email = request.auth['EMAIL']

    user = CustomUser.objects.get(email=requested_user_email)
    try:
        doctor = DoctorProfile.objects.get(doctor_id=appointment.doctor)
        if user.email == doctor.user.email:
            return {"details": "you can't assign an appointment to yourself"}
        doctor_active_times = list(
            doctor.active_date.values_list('datetime', flat=True))
        for time in doctor_active_times:

            stringifiedTime = time.strftime("%Y-%m-%d, %H:%M")
            givenDate = appointment.date.strftime("%Y-%m-%d, %H:%M")
            if stringifiedTime == givenDate:
                newAppointment = Appointments.objects.create(
                    date=time, user=user, doctor=doctor)
                newAppointment.save()
                return {"date": stringifiedTime, "user": user.fullName, "doctor": doctor.user.fullName}

        return {"details": "doctor is not active at this time"}
    except DoctorProfile.DoesNotExist:
        return {"details": "doctor was not found"}


# doctor token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFTUFJTCI6InNhaWZoYXJpdGhAZ21haWwuY29tIn0.woh4yiDYk_-sL5Aq2bPQOr91BK_5GadQOGfTdBiETBw

# user token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFTUFJTCI6InNhaWZhbGhhaWRlckBnbWFpbC5jb20ifQ.D-JRVJKI8XOT8TFMdSAwcajxJEyK8rMAJLXGqa56mnw
