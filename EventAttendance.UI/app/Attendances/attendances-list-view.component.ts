import { NgModule } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Directive, Input, EventEmitter, ElementRef, Renderer, Injectable, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { trigger, state, animate, transition, style } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { Attendance_VM } from '../Models.model';
import { AttendancesService } from './attendances.service';

@Directive({
    selector: '[focus]'
})

export class FocusDirective {
    @Input('focus') focusEvent: EventEmitter<boolean>;

    constructor(private element: ElementRef, private renderer: Renderer) {
    }

    ngOnInit() {
        this.focusEvent.subscribe(event => {
            this.renderer.invokeElementMethod(this.element.nativeElement, 'focus', []);
        });
    }
}

@Component({
    selector: 'loading-indicator',
    template: `<style type='text/css'>@-webkit-keyframes uil-default-anim { 0% { opacity: 1} 100% {opacity: 0} }@keyframes uil-default-anim { 0% { opacity: 1} 100% {opacity: 0} }.uil-default-css > div:nth-of-type(1){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: -0.5s;animation-delay: -0.5s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(2){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: -0.4166666666666667s;animation-delay: -0.4166666666666667s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(3){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: -0.33333333333333337s;animation-delay: -0.33333333333333337s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(4){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: -0.25s;animation-delay: -0.25s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(5){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: -0.16666666666666669s;animation-delay: -0.16666666666666669s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(6){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: -0.08333333333333331s;animation-delay: -0.08333333333333331s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(7){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: 0s;animation-delay: 0s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(8){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: 0.08333333333333337s;animation-delay: 0.08333333333333337s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(9){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: 0.16666666666666663s;animation-delay: 0.16666666666666663s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(10){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: 0.25s;animation-delay: 0.25s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(11){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: 0.33333333333333337s;animation-delay: 0.33333333333333337s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}.uil-default-css > div:nth-of-type(12){-webkit-animation: uil-default-anim 1s linear infinite;animation: uil-default-anim 1s linear infinite;-webkit-animation-delay: 0.41666666666666663s;animation-delay: 0.41666666666666663s;}.uil-default-css { position: relative;background:none;width:200px;height:200px;}</style><div class='uil-default-css'><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(0deg) translate(0,-60px);transform:rotate(0deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(30deg) translate(0,-60px);transform:rotate(30deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(60deg) translate(0,-60px);transform:rotate(60deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(90deg) translate(0,-60px);transform:rotate(90deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(120deg) translate(0,-60px);transform:rotate(120deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(150deg) translate(0,-60px);transform:rotate(150deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(180deg) translate(0,-60px);transform:rotate(180deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(210deg) translate(0,-60px);transform:rotate(210deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(240deg) translate(0,-60px);transform:rotate(240deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(270deg) translate(0,-60px);transform:rotate(270deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(300deg) translate(0,-60px);transform:rotate(300deg) translate(0,-60px);border-radius:10px;position:absolute;'></div><div style='top:80px;left:93px;width:14px;height:40px;background:#00b2ff;-webkit-transform:rotate(330deg) translate(0,-60px);transform:rotate(330deg) translate(0,-60px);border-radius:10px;position:absolute;'></div></div>`
})
export class LoadingIndicator { }

export class LoadingPage {
    public loading: boolean;
    constructor(val: boolean) {
        this.loading = val;
    }
    standby() {
        this.loading = true;
    }
    ready() {
        this.loading = false;
    }
}

@Component({
    selector: 'attendances-list-view',
    templateUrl: './app/Attendances/attendances-list-view.template.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
        //'../../node_modules/bootstrap/dist/css/bootstrap.min.css'
    ],
    //animations: [
    //    trigger('IsAttended', [
    //        state('false', style({opacity: 1})),
    //        state('true', style({opacity: 0})),
    //        transition('* => *', animate('.5s'))
    //    ])
    //],
    providers: [AttendancesService],
    //directives: [FocusDirective]
})

export class AttendancesListViewComponent extends LoadingPage implements OnChanges {
    master_list: Array<Attendance_VM>;
    attendances_vm_list: Array<Attendance_VM>;
    filter: string;
    selectedScheduleId: number = 0;
    selectedGender: string = 'M';
    totalKaryakarCount: number = 0;
    pendingKaryakarCount: number = 0;

    public myFocusTriggeringEventEmitter = new EventEmitter<boolean>();

    constructor(private http: Http, private router: Router, private attendancesService: AttendancesService) {
        super(true);

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

    onGenderSelect(gender: string, event: any) {
        if (this.selectedGender != gender) {
            this.selectedGender = gender;
            event.stopPropagation();

            this.getItems();
        }
    }

    onFilter(event: Event) {
        //this.getItems();
        this.applyFilter();
    }

    onClearFilter(event: Event) {
        this.filter = '';
        this.applyFilter();
    }

    onRefreshGetAllItems(event: Event) {
        this.filter = "";
        this.getItems();
    }

    getItems() {

        this.standby();

        this.attendances_vm_list = new Array<Attendance_VM>();

        this.attendancesService.getItems(this.http, this.selectedScheduleId, this.selectedGender, this.filter)
            .then(items => {
                this.master_list = items;
                this.applyFilter();
            });
    }

    applyFilter() {
        if (this.filter.length > 0) {
            this.attendances_vm_list = this.master_list.filter(c => c.FirstName.toLowerCase().startsWith(this.filter.toLowerCase()) || c.LastName.toLowerCase().startsWith(this.filter.toLowerCase()));
        }
        else {
            this.attendances_vm_list = this.master_list;
        }

        this.totalKaryakarCount = this.attendances_vm_list.filter(c => c.IsKaryakar).length;
        this.pendingKaryakarCount = this.attendances_vm_list.filter(c => c.IsKaryakar && c.IsAttended).length;

        this.myFocusTriggeringEventEmitter.emit(true);

        this.ready();
    }

    OnTakeAttendance(event: any, currentItem: Attendance_VM) {
        currentItem.IsAttended = true;
        event.stopPropagation();

        // Call Service
        var result = this.attendancesService.add(this.http, this.selectedScheduleId, currentItem);

        // On time if there is a filter then clear it and  reload data,
        //if (this.filter.length > 0) {

        this.filter = "";

        // Set focus to Filter textbox
        this.myFocusTriggeringEventEmitter.emit(true);

        result.subscribe(data => {

            //// Remove the record from UI
            //var index = this.attendances_vm_list.indexOf(currentItem, 0);
            //if (index > -1) {
            //    this.attendances_vm_list.splice(index, 1);
            //}

            //// Refresh Data
            //this.getItems()
        });
    }
}