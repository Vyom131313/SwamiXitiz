import { NgModule } from '@angular/core';

export class Event_VM {
    Id: number;
    Name: string;
}

export class EventSchedule_VM {
    Id: number;
    EventId: number;
    EventDate: string;
    IsFreezed: boolean;
}