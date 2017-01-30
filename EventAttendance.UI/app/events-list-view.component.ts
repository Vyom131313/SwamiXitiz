import { NgModule } from '@angular/core';
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

    constructor(private eventsService: EventsService) { }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
        this.getData();
    }

    getData() {
    }
}