import { NgModule } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Event_VM } from '../Models.model';
import { EventsService } from './events.service';

@Component({
    selector: 'events-list-view',
    templateUrl: './app/Events/events-list-view.template.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [EventsService]
})

export class EventsListViewComponent implements OnChanges {
    events_vm_list: Array<Event_VM>;

    constructor(private http: Http, private eventsService: EventsService) {

        eventsService.getItems(this.http, 'test').then(items => { this.events_vm_list = items; });
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }
}