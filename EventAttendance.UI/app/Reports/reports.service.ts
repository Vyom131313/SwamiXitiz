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
export class ReportsService {

    //public ServiceBaseUrl: string = "";
    public ServiceBaseUrl: string = "http://localhost:23283/api/Reports";

    //constructor(private http: Http) {
    constructor() {
    }

    getItems(http: Http, eventScheduleId: number, filter: string) {
        let params: URLSearchParams = new URLSearchParams();
        params.set('eventScheduleId', eventScheduleId.toString());
        params.set('filter', filter);

        return http.get(this.ServiceBaseUrl +"/GetByEventSchedule", { search: params })
            .toPromise()
            .then((response) => response.json());
    }
}