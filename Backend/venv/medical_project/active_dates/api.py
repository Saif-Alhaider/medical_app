from calendar import WEDNESDAY
from ninja import Router
from doctor.models import DoctorProfile
from active_dates.models import ActiveDates
from .weekDaysSchema import WeekDays
from .create_doctor_schedual_date_and_time import create_doctor_schedual_date_and_time
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


@router.post("create_doctor_schedual")
def create_doctor_schedual(request, res: WeekDays):
    # active_date = ActiveDates
    schedual = create_doctor_schedual_date_and_time(sunday=res.sunday,monday=res.modnay,tuesday=res.tuesday,wednesday=res.wensday,thursday=res.thursday,friday=res.friday,saturday=res.saturday,howManyDays=30)
    # print(schedual)
    return  schedual


# sunday=res.sunday,monday=res.modnay,tuesday=res.tuesday,wednesday=res.wensday,thursday=res.thursday,friday=res.friday,saturday=res.saturday
# , response={200: WeekDays}