﻿import { NgModule } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { trigger, state, animate, transition, style } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { Attendance_VM } from '../Models.model';
import { ReportsService } from './reports.service';

@Component({
    selector: 'report-by-event-schedule',
    templateUrl: './app/Reports/report-by-event-schedule.template.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [ReportsService]
})

export class ReportByEventScheduleComponent implements OnChanges {
    attendances_vm_list: Array<Attendance_VM>;
    filter: string;
    selectedScheduleId: number = 0;

    constructor(private http: Http, private router: Router, private attendancesService: ReportsService) {
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
        this.attendancesService.getItems(this.http, this.selectedScheduleId, this.filter)
            .then(items => { this.attendances_vm_list = items; });
    }
}