﻿import { NgModule } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { trigger, state, animate, transition, style } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { LoadingIndicator, LoadingPage } from '../_Shared/loading-indicator.component';

import { Attendance_VM, EventSchedule_VM } from '../Models.model';
import { ReportsService } from './reports.service';

@Component({
    selector: 'report-by-event-schedule',
    templateUrl: './app/Reports/report-by-event-schedule.template.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [ReportsService]
})

export class ReportByEventScheduleComponent extends LoadingPage implements OnChanges {
    attendances_vm_list: Array<Attendance_VM>;
    attendances_m_vm_list: Array<Attendance_VM>;
    attendances_f_vm_list: Array<Attendance_VM>;
    
    attendances_absent_vm_list: Array<Attendance_VM>;
    attendances_m_slot_1_vm_list: Array<Attendance_VM>;
    attendances_m_slot_2_vm_list: Array<Attendance_VM>;
    attendances_m_slot_3_vm_list: Array<Attendance_VM>;
    attendances_m_slot_4_vm_list: Array<Attendance_VM>;
    attendances_m_slot_5_vm_list: Array<Attendance_VM>;
    attendances_m_slot_6_vm_list: Array<Attendance_VM>;

    attendances_f_slot_1_vm_list: Array<Attendance_VM>;
    attendances_f_slot_2_vm_list: Array<Attendance_VM>;
    attendances_f_slot_3_vm_list: Array<Attendance_VM>;
    attendances_f_slot_4_vm_list: Array<Attendance_VM>;
    attendances_f_slot_5_vm_list: Array<Attendance_VM>;
    attendances_f_slot_6_vm_list: Array<Attendance_VM>;

    slot1_m_cnt_perc: string;
    slot2_m_cnt_perc: string;
    slot3_m_cnt_perc: string;
    slot4_m_cnt_perc: string;
    slot5_m_cnt_perc: string;
    slot6_m_cnt_perc: string;

    slot1_f_cnt_perc: string;
    slot2_f_cnt_perc: string;
    slot3_f_cnt_perc: string;
    slot4_f_cnt_perc: string;
    slot5_f_cnt_perc: string;
    slot6_f_cnt_perc: string;

    eventShortDate: string;
    filter: string;
    notes: string;
    selectedScheduleId: number = 0;

    constructor(private http: Http, private router: Router, private reportsService: ReportsService) {
        super(true);

        this.filter = '';
        this.getItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    onScheduleChange(id: number) {
        this.selectedScheduleId = id;

        this.reportsService.getEventScheduleInfo(this.http, id)
            .then(item => { this.notes = item.Notes; this.eventShortDate = item.EventShortDate; });

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
        this.standby();

        this.attendances_vm_list = new Array<Attendance_VM>();
        this.attendances_absent_vm_list = new Array<Attendance_VM>();
        this.attendances_m_vm_list = new Array<Attendance_VM>();
        this.attendances_f_vm_list = new Array<Attendance_VM>();
        
        this.reportsService.getItems(this.http, this.selectedScheduleId, this.filter)
            .then(items => {

                this.attendances_vm_list = items;
                this.attendances_m_vm_list = this.attendances_vm_list.filter(c => c.IsAttended && c.Gender == 'M');;
                this.attendances_f_vm_list = this.attendances_vm_list.filter(c => c.IsAttended && c.Gender == 'F');;

                this.attendances_m_slot_1_vm_list = this.attendances_m_vm_list.filter(c => c.Slot == 'Slot-1');
                this.attendances_m_slot_2_vm_list = this.attendances_m_vm_list.filter(c => c.Slot == 'Slot-2');
                this.attendances_m_slot_3_vm_list = this.attendances_m_vm_list.filter(c => c.Slot == 'Slot-3');
                this.attendances_m_slot_4_vm_list = this.attendances_m_vm_list.filter(c => c.Slot == 'Slot-4');
                this.attendances_m_slot_5_vm_list = this.attendances_m_vm_list.filter(c => c.Slot == 'Slot-5');
                this.attendances_m_slot_6_vm_list = this.attendances_m_vm_list.filter(c => c.Slot == 'Slot-6');

                this.attendances_f_slot_1_vm_list = this.attendances_f_vm_list.filter(c => c.Slot == 'Slot-1');
                this.attendances_f_slot_2_vm_list = this.attendances_f_vm_list.filter(c => c.Slot == 'Slot-2');
                this.attendances_f_slot_3_vm_list = this.attendances_f_vm_list.filter(c => c.Slot == 'Slot-3');
                this.attendances_f_slot_4_vm_list = this.attendances_f_vm_list.filter(c => c.Slot == 'Slot-4');
                this.attendances_f_slot_5_vm_list = this.attendances_f_vm_list.filter(c => c.Slot == 'Slot-5');
                this.attendances_f_slot_6_vm_list = this.attendances_f_vm_list.filter(c => c.Slot == 'Slot-6');

                this.attendances_absent_vm_list = this.attendances_vm_list.filter(c => !c.IsAttended);

                this.slot1_m_cnt_perc = this.attendances_m_slot_1_vm_list.length.toString() + " (" + (this.attendances_m_slot_1_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";
                this.slot2_m_cnt_perc = this.attendances_m_slot_2_vm_list.length.toString() + " (" + (this.attendances_m_slot_2_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";
                this.slot3_m_cnt_perc = this.attendances_m_slot_3_vm_list.length.toString() + " (" + (this.attendances_m_slot_3_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";
                this.slot4_m_cnt_perc = this.attendances_m_slot_4_vm_list.length.toString() + " (" + (this.attendances_m_slot_4_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";
                this.slot5_m_cnt_perc = this.attendances_m_slot_5_vm_list.length.toString() + " (" + (this.attendances_m_slot_5_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";
                this.slot6_m_cnt_perc = this.attendances_m_slot_6_vm_list.length.toString() + " (" + (this.attendances_m_slot_6_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";

                this.slot1_f_cnt_perc = this.attendances_f_slot_1_vm_list.length.toString() + " (" + (this.attendances_f_slot_1_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";
                this.slot2_f_cnt_perc = this.attendances_f_slot_2_vm_list.length.toString() + " (" + (this.attendances_f_slot_2_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";
                this.slot3_f_cnt_perc = this.attendances_f_slot_3_vm_list.length.toString() + " (" + (this.attendances_f_slot_3_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";
                this.slot4_f_cnt_perc = this.attendances_f_slot_4_vm_list.length.toString() + " (" + (this.attendances_f_slot_4_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";
                this.slot5_f_cnt_perc = this.attendances_f_slot_5_vm_list.length.toString() + " (" + (this.attendances_f_slot_5_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";
                this.slot6_f_cnt_perc = this.attendances_f_slot_6_vm_list.length.toString() + " (" + (this.attendances_f_slot_6_vm_list.length / this.attendances_vm_list.length * 100).toFixed(2) + "%)";

                this.ready();

                //alert(this.attendances_vm_list.length + "-" + this.attendances_m_slot_1_vm_list.length + "-" + this.attendances_absent_vm_list.length);
            });
    }
}