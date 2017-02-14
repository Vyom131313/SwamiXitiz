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
import { SharedService } from '../shared.service';

@Injectable()
export class ReportsService {

    public ServiceBaseUrl: string = "";

    constructor(private sharedService: SharedService) {
        this.ServiceBaseUrl = this.sharedService.WebApiBaseUrl + "/Reports";
    }

    getItems(http: Http, eventScheduleId: number, filter: string) {
        let params: URLSearchParams = new URLSearchParams();
        params.set('eventScheduleId', eventScheduleId.toString());
        params.set('filter', filter);

        return http.get(this.ServiceBaseUrl +"/GetByEventSchedule", { search: params })
            .toPromise()
            .then((response) => response.json());
    }

    getByAttendee(http: Http, attendeeId: number) {
        let params: URLSearchParams = new URLSearchParams();
        params.set('attendeeId', attendeeId.toString());

        return http.get(this.ServiceBaseUrl +"/GetByAttendee", { search: params })
            .toPromise()
            .then((response) => response.json());
    }
}