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
    slot1Count: number = 0;
    slot2Count: number = 0;
    slot3Count: number = 0;
    slot4Count: number = 0;

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
                this.slot1Count = this.attendances_vm_list.filter(c => c.IsAttended && c.Slot == 'Slot-1').length;
                this.slot2Count = this.attendances_vm_list.filter(c => c.IsAttended && c.Slot == 'Slot-2').length;
                this.slot3Count = this.attendances_vm_list.filter(c => c.IsAttended && c.Slot == 'Slot-3').length;
                this.slot4Count = this.attendances_vm_list.filter(c => c.IsAttended && c.Slot == 'Slot-4').length;
            });
    }

    getStyleBySlot(slot) {
        var color = '#16a085';

        switch (slot) {
            case "Slot-1": color = "#16a085"; break;
            case "Slot-2": color = "#35acdf"; break;
            case "Slot-3": color = "#116f7d"; break;
            case "Slot-4": color = "#f0ad4e"; break;
        }

        //alert(slot + ' ' + color);
        return color;
    }
}