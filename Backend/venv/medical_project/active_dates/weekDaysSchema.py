from calendar import weekday
from textwrap import indent
from ninja import Schema
from datetime import datetime, time
from pydantic import FutureDate
    

class WeekDays(Schema):
    sunday:list[time]
    modnay:list[time]
    tuesday:list[time]
    wensday:list[time]
    thursday:list[time]
    friday:list[time]
    saturday:list[time]
    
# time => 0:57:33 hh:mm:ss
class DatesTime(Schema):
    datesTime:str
class Dates(Schema):
    dates:list[DatesTime]
    
    
class responseWeekDays(Schema):
    sunday:list[str]
    modnay:list[str]
    tuesday:list[str]
    wensday:list[str]
    thursday:list[str]
    friday:list[str]
    saturday:list[str]
    
class SchedualSchema(Schema):
    fianl:list[responseWeekDays]