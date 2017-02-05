import { NgModule } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { EventSchedule_VM } from '../Models.model';
import { EventSchedulesService } from './eventschedules.service';

@Component({
    selector: 'eventschedules-list-view',
    templateUrl: './app/EventSchedules/eventschedules-list-view.template.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [EventSchedulesService]
})

export class EventSchedulesListViewComponent implements OnChanges {
    eventschedules_vm_list: Array<EventSchedule_VM>;

    constructor(private http: Http, private router: Router, private eventschedulesService: EventSchedulesService) {
        this.getItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    getItems() {
        this.eventschedulesService.getItems(this.http).then(items => { this.eventschedules_vm_list = items; });
    }
}