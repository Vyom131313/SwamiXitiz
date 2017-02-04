import { NgModule } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { Attendee_VM } from '../Models.model';
import { AttendeesService } from './attendees.service';

@Component({
    selector: 'attendees-list-view',
    templateUrl: './app/Attendees/attendees-list-view.template.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [AttendeesService]
})

export class AttendeesListViewComponent implements OnChanges {
    attendees_vm_list: Array<Attendee_VM>;

    constructor(private http: Http, private router: Router, private attendeesService: AttendeesService) {
        this.getItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    getItems() {
        this.attendeesService.getItems(this.http, '').then(items => { this.attendees_vm_list = items; });
    }

    delete(id: number, event: Event): void {

        var result = this.attendeesService.delete(this.http, id);
        result.subscribe(data => this.getItems());
    }
}