import { NgModule, EventEmitter } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, Output, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { EventSchedule_VM } from '../Models.model';
import { EventSchedulesService } from '../EventSchedules/eventschedules.service';

@Component({
    selector: 'event-schedules-ddl',
    template: `<select [(ngModel)]="selectedScheduleId" (change)="onSelect($event.target.value)" class="form-control input-sm" >
                  <option *ngFor="let item of schedulesDdlList" value= "{{item.Id}}" [selected]="selectedScheduleId == item.Id">
                    {{item.EventShortDate}}
                  </option>
                </select>`,
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [EventSchedulesService]
})

export class EventSchedulesDdlComponent implements OnChanges {
    @Input() selectedScheduleId: number;
    @Output() select = new EventEmitter();
    schedulesDdlList: Array<EventSchedule_VM>;

    constructor(private http: Http, private router: Router, private eventschedulesService: EventSchedulesService) {

        this.getItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    onScheduleChange(id) {
        this.selectedScheduleId = id;
        this.select.emit(id);
    }

    getItems() {
        this.eventschedulesService.getUnfreezedItems(this.http).then(items => { this.schedulesDdlList = items; });
    }
}