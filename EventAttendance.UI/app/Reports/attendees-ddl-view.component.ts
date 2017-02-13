import { NgModule, EventEmitter } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, Output, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { Attendee_VM } from '../Models.model';
import { AttendeesService } from '../Attendees/attendees.service';

@Component({
    selector: 'attendees-ddl',
    template: `<select [(ngModel)]="selectedAttendeeId" (change)="onChange($event.target.value)" class="form-control input-sm" >
                  <option *ngFor="let item of attendeesDdlList" value= "{{item.Id}}" [selected]="selectedAttendeeId == item.Id">
                    {{item.FullName}} ({{item.ZoneName}})
                  </option>
                </select>`,
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [AttendeesService]
})

export class AttendeesDdlComponent implements OnChanges {
    @Input() selectedAttendeeId: number;
    @Output() select = new EventEmitter();
    attendeesDdlList: Array<Attendee_VM>;

    constructor(private http: Http, private router: Router, private attendeesService: AttendeesService) {

        this.getItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    onChange(id) {
        this.selectedAttendeeId = id;
        this.select.emit(id);
    }

    getItems() {
        this.attendeesService.getItems(this.http, "").then(items => {
            this.attendeesDdlList = items;
        });
    }
}