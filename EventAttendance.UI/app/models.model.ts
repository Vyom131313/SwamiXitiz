﻿import { NgModule } from '@angular/core';

export class Event_VM {
    Id: number;
    Name: string;
    EventSchedules: Array<EventSchedule_VM>;
}

export class EventSchedule_VM {
    Id: number;
    EventId: number;
    EventDate: string;
    IsFreezed: boolean;
}


export class Attendee_VM {
    Id: number;
    FirstName: string;
    LastName: string;
    Address: string;
    ZoneName: boolean;
    ZoneId: number;
}