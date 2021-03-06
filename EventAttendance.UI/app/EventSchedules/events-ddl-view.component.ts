﻿import { NgModule, EventEmitter } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, Output, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { Event_VM, EventSchedule_VM } from '../Models.model';
import { EventSchedulesService } from './eventschedules.service';

@Component({
    selector: 'events-ddl',
    template: `<select [(ngModel)]="selectedEventId" (change)="onSelect($event.target.value)" class="form-control input-sm" >
                  <option *ngFor="let item of eventsDdlList" value= "{{item.Id}}" [selected]="selectedEventId == item.Id">
                    {{item.Name}}
                  </option>
                </select>`,
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [EventSchedulesService]
})

export class EventsDdlComponent implements OnChanges {
    @Input() selectedEventId: number;
    @Output() select = new EventEmitter();
    eventsDdlList: Array<Event_VM>;

    constructor(private http: Http, private router: Router, private eventschedulesService: EventSchedulesService) {

        this.getEventItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    onSelect(id) {
        this.selectedEventId = id;
        this.select.emit(id);
    }

    getEventItems() {
        this.eventschedulesService.getEventItems(this.http).then(items => { this.eventsDdlList = items; });
    }
}