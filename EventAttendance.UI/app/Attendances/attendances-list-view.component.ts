import { NgModule } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { trigger, state, animate, transition, style } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { Attendance_VM } from '../Models.model';
import { AttendancesService } from './attendances.service';

@Component({
    selector: 'attendances-list-view',
    templateUrl: './app/Attendances/attendances-list-view.template.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
        //'../../node_modules/bootstrap/dist/css/bootstrap.min.css'
    ],
    animations: [
        trigger('IsAttended', [
            state('false', style({opacity: 1})),
            state('true', style({opacity: 0})),
            transition('* => *', animate('.5s'))
        ])
    ],
    providers: [AttendancesService]
})

export class AttendancesListViewComponent implements OnChanges {
    attendances_vm_list: Array<Attendance_VM>;
    filter: string;
    selectedScheduleId: number = 0;

    constructor(private http: Http, private router: Router, private attendancesService: AttendancesService) {
        this.filter = '';
        this.getItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    onScheduleChange(id: number) {
        this.selectedScheduleId = id;
        this.getItems();
    }

    onFilter(event: Event) {
        this.getItems();
    }

    onRefreshGetAllItems(event: Event) {
        this.filter = "";
        this.getItems();
    }

    getItems() {

        this.attendances_vm_list = new Array<Attendance_VM>();

        this.attendancesService.getItems(this.http, this.selectedScheduleId, this.filter)
            .then(items => { this.attendances_vm_list = items; });
    }

    OnTakeAttendance(currentItem: Attendance_VM, event: any) {
        currentItem.IsAttended = true;
        event.stopPropagation();

        var result = this.attendancesService.add(this.http, this.selectedScheduleId, currentItem);

        // On time if there is a filter then clear it and  reload data,
        if (this.filter.length > 0) {
            this.filter = "";
            result.subscribe(data => this.getItems());
        }
    }
}