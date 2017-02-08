import { NgModule } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
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
    providers: [AttendancesService]
})

export class AttendancesListViewComponent implements OnChanges {
    attendances_vm_list: Array<Attendance_VM>;
    filter: string;

    constructor(private http: Http, private router: Router, private attendancesService: AttendancesService) {
        this.filter = '';
        this.getItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    onFilter(event: Event)
    {
        this.getItems();
    }

    getItems() {
        this.attendancesService.getItems(this.http, this.filter).then(items => { this.attendances_vm_list = items; });
    }

    //delete(id: number, event: Event): void {

    //    var result = this.attendancesService.delete(this.http, id);
    //    result.subscribe(data => this.getItems());
    //}
}