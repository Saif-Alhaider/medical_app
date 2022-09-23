from datetime import datetime
from ninja import Router
from doctor.models import DoctorProfile
from active_dates.models import ActiveDates
from .weekDaysSchema import WeekDays
from .create_doctor_schedual_date_and_time import create_doctor_schedual_date_and_time
from accounts.authorization import AuthBearer
from accounts.authSchema import AccountError
from .weekDaysSchema import SchedualSchema
from genson import SchemaBuilder
from datetime import time
from appointments.models import Appointments
# User = get_user_model()
router = Router(tags=['active_dates'])


@router.get('doctor_active_dates')
def doctor_active_dates(request):
    doctors = DoctorProfile.objects.all()
    data = []
    for doctor in doctors:
        data.append({
            "doctor name": doctor.user.fullName,
            "active dates": list(doctor.active_date.all().values_list('datetime', flat=True))
        })
    return data


@router.post("create_doctor_schedual", auth=AuthBearer(),)
def create_doctor_schedual(request, res: WeekDays):
    requested_user_email = request.auth["EMAIL"]
    try:
        doc = DoctorProfile.objects.get(
            user__email=requested_user_email
        )
        schedual = create_doctor_schedual_date_and_time(sunday=res.sunday, monday=res.modnay, tuesday=res.tuesday,
                                                        wednesday=res.wensday, thursday=res.thursday, friday=res.friday, saturday=res.saturday, howManyDays=30)

        for appit in schedual:
            for day in list(appit.values())[0]:
                date = list(day.keys())[0]
                for onetime in list(day.values())[0]:

                    requestedDate = f"{date}, {onetime}"
                    # print()
                    assignedDate = datetime.strptime(
                        requestedDate, '%Y-%m-%d, %H:%M:%S')

                    try:
                        docdate = ActiveDates.objects.create(
                        datetime=assignedDate, doctor=doc)
                    except:
                        pass
        # print(schedual)
        return {"final": schedual}
    except DoctorProfile.DoesNotExist:
        return {"details": "only doctors are allowed to change their schedual"}


# sunday=res.sunday,monday=res.modnay,tuesday=res.tuesday,wednesday=res.wensday,thursday=res.thursday,friday=res.friday,saturday=res.saturday
# , response={200: WeekDays}

# {
#   "sunday": [
#     "10:30"
#   ],
#   "modnay": [
#     "9:30"
#   ],
#   "tuesday": [
#     "11:45"
#   ],
#   "wensday": [
#     "23:20"
#   ],
#   "thursday": [
#     "4:30"
#   ],
#   "friday": [
#     "7:15"
#   ],
#   "saturday": [
#     "3:12"
#   ]
# }


# response={
#     201:SchedualSchema,
#     404:AccountError,
# }
