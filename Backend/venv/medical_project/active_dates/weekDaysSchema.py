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