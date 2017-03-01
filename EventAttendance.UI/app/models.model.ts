import { NgModule } from '@angular/core';

export class Event_VM {
    Id: number;
    Name: string;
    EventSchedules: Array<EventSchedule_VM>;
}

export class EventSchedule_VM {
    Id: number;
    EventId: number;
    EventName: string;
    EventDate: string;
    EventShortDate: string;
    IsFreezed: boolean;
}

export class Attendee_VM {
    Id: number;
    FirstName: string;
    MiddleName: string;
    LastName: string;
    Address: string;
    Gender: string;
    CityName: string;
    CityId: number;
    ZoneName: string;
    ZoneId: number;
    IsKaryakar: boolean;
    IsDeleted: boolean;
}

export class Attendance_VM {
    Id: number;
    EventScheduleId: number;
    AttendeeId: number;
    IsAttended: boolean;
    AttendanceTime: Date;
    Slot: string;

    FirstName: string;
    MiddleName: string;
    LastName: string;
    AttendeeFullName: string;
    ZoneName: string;
    CityName: string;
    Address: string;
    Gender: string;
    IsKaryakar: boolean;
    EventShortDate: string;
    AttendanceTimeOnly: string;
}

export class Zone_VM {
    Id: number;
    Name: string;
}

export class City_VM {
    Id: number;
    Name: string;
}