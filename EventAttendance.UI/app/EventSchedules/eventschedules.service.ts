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

import { EventSchedule_VM } from '../models.model';
import { SharedService } from '../shared.service';

@Injectable()
export class EventSchedulesService {

    public ServiceBaseUrl: string = "";
    public EventServiceBaseUrl: string = "";

    constructor(private sharedService: SharedService) {
        this.ServiceBaseUrl = this.sharedService.WebApiBaseUrl + "/EventSchedules";
        this.EventServiceBaseUrl = this.sharedService.WebApiBaseUrl + "/Events";
    }

    getItems(http: Http) {
        return http.get(this.ServiceBaseUrl)
            .toPromise()
            .then((response) => response.json());
    }

    getUnfreezedItems(http: Http) {
        return http.get(this.ServiceBaseUrl +"/GetUnfreezedEventSchedules")
            .toPromise()
            .then((response) => response.json());
    }

    getRaviSabhaAllEventSchedules(http: Http) {
        return http.get(this.ServiceBaseUrl + "/GetRaviSabhaAllEventSchedules")
            .toPromise()
            .then((response) => response.json());
    }

    getEventItems(http: Http) {
        
        let params: URLSearchParams = new URLSearchParams();
        params.set('filter', '');

        return http.get(this.EventServiceBaseUrl + "/Get", { search: params })
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

    add(http: Http, eventschedule: EventSchedule_VM) {
        eventschedule.Id = 0;

        let headers = new Headers({ 'Content-Type': 'application/json' });
        let options = new RequestOptions({ headers: headers });
        return http.post(this.ServiceBaseUrl, JSON.stringify(eventschedule), options).map(res => res);
            //.catch(this.handleError)
    }

    update(http: Http, eventschedule: EventSchedule_VM) {
        let headers = new Headers({ 'Content-Type': 'application/json' });
        let options = new RequestOptions({ headers: headers });
        return http.put(this.ServiceBaseUrl + "/" + eventschedule.Id, JSON.stringify(eventschedule), options).map(res => res);
    }

    delete(http: Http, id: number) {
        let params: URLSearchParams = new URLSearchParams();
        params.set('id', id.toString());

        return http.delete(this.ServiceBaseUrl, { search: params }).map(res => res);
    }
}