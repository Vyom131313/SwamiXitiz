import { NgModule } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { trigger, state, animate, transition, style } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { Attendance_VM } from '../Models.model';
import { ReportsService } from './reports.service';

@Component({
    selector: 'report-by-attendee',
    templateUrl: './app/Reports/report-by-attendee.template.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [ReportsService]
})

export class ReportByAttendeeComponent implements OnChanges {
    attendances_vm_list: Array<Attendance_VM>;
    selectedAttendeeId: number = 0;

    constructor(private http: Http, private router: Router, private attendancesService: ReportsService) {
        this.getItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    onAttendeeChange(id: number) {
        this.selectedAttendeeId = id;
    }

    onRefreshGetAllItems(event: Event) {
        this.getItems();
    }

    getItems() {
        this.attendances_vm_list = new Array<Attendance_VM>();

        this.attendancesService.getByAttendee(this.http, this.selectedAttendeeId)
            .then(items => {
                this.attendances_vm_list = items;
            });
    }
}