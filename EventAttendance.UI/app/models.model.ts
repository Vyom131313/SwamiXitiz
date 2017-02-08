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
    LastName: string;
    Address: string;
    ZoneName: boolean;
    ZoneId: number;
    IsKaryakar: boolean;
}

export class Attendance_VM {
    Id: number;
    EventScheduleId: number;
    AttendeeId: number;
    IsAttended: boolean;
    AttendanceTime: string;

    AttendeeFullName: string;
    ZoneName: string;
    Address: string;
    IsKaryakar: boolean;
    EventShortDate: string;
}

export class Zone_VM {
    Id: number;
    Name: string;
}