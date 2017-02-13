import { Injectable } from '@angular/core';
import { Component, Inject } from '@angular/core';

import { Headers, RequestOptions, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import { Observable } from 'rxjs';
import 'rxjs/add/operator/toPromise';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import 'rxjs/Rx';

import { Attendance_VM } from '../models.model';

@Injectable()
export class AttendancesService {

    //public ServiceBaseUrl: string = "";
    public ServiceBaseUrl: string = "http://localhost:23283/api/Attendances";

    //constructor(private http: Http) {
    constructor() {
    }

    getItems(http: Http, eventScheduleId: number, selectedGender: string, filter: string) {
        let params: URLSearchParams = new URLSearchParams();
        params.set('eventScheduleId', eventScheduleId.toString());
        params.set('gender', selectedGender);
        params.set('filter', filter);

        return http.get(this.ServiceBaseUrl, { search: params })
            .toPromise()
            .then((response) => response.json());
    }

    getZoneItems(http: Http) {

        return http.get(this.ServiceBaseUrl + "/GetZones")
            .toPromise()
            .then((response) => response.json());
    }

    getItem(http: Http, id: number) {

        let params: URLSearchParams = new URLSearchParams();
        params.set('id', id.toString());

        return http.get(this.ServiceBaseUrl, { search: params })
            .toPromise()
            .then((response) => response.json());
    }

    add(http: Http, eventScheduleId: number, attendance: Attendance_VM) {
        attendance.Id = 0;
        attendance.EventScheduleId = eventScheduleId;
        attendance.AttendanceTime = new Date(this.parseDateToStringWithFormat(new Date()));

        let headers = new Headers({ 'Content-Type': 'application/json' });
        let options = new RequestOptions({ headers: headers });

        return http.post(this.ServiceBaseUrl + "/" + eventScheduleId, JSON.stringify(attendance), options).map(res => res);
    }

    update(http: Http, attendance: Attendance_VM) {
        let headers = new Headers({ 'Content-Type': 'application/json' });
        let options = new RequestOptions({ headers: headers });
        return http.put(this.ServiceBaseUrl + "/" + attendance.Id, JSON.stringify(attendance), options).map(res => res);
    }

    delete(http: Http, id: number) {
        let params: URLSearchParams = new URLSearchParams();
        params.set('id', id.toString());

        return http.delete(this.ServiceBaseUrl, { search: params }).map(res => res);
    }

    private parseDateToStringWithFormat(date: Date): string {
        let result: string;
        let dd = date.getDate().toString();
        let mm = (date.getMonth() + 1).toString();
        let hh = date.getHours().toString();
        let min = date.getMinutes().toString();
        dd = dd.length === 2 ? dd : "0" + dd;
        mm = mm.length === 2 ? mm : "0" + mm;
        hh = hh.length === 2 ? hh : "0" + hh;
        min = min.length === 2 ? min : "0" + min;
        result = [date.getFullYear(), '-', mm, '-', dd, 'T', hh, ':', min].join('');

        return result;
    }
}