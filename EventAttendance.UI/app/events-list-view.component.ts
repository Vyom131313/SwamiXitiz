import { NgModule } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Event_VM } from './Models.model';
import { EventsService } from './events.service';

@Component({
    selector: 'events-list-view',
    templateUrl: './app/events-list-view.template.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [EventsService]
})

export class EventsListViewComponent implements OnChanges {
    events_vm_list: Array<Event_VM>;
    private http: Http;
    private eventsService: EventsService;

    constructor(private _http: Http, private _eventsService: EventsService) {
        this.http = _http;
        this.eventsService = _eventsService;

       // alert(JSON.stringify(this.eventsService.getAll(this.http, 'test')));
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }
}