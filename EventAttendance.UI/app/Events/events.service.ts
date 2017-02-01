import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import { Observable } from 'rxjs';
import 'rxjs/add/operator/toPromise';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import 'rxjs/Rx';

import { Event_VM } from '../models.model';

@Injectable()
export class EventsService {

    //public ServiceBaseUrl: string = "";
    public ServiceBaseUrl: string = "http://localhost:23283/api/Events";

    //constructor(private http: Http) {
    constructor() {
    }

    getItems(http: Http, filter: string) {
        let params: URLSearchParams = new URLSearchParams();
        params.set('filter', filter);

        return http.get(this.ServiceBaseUrl+"/Get", { search: params })
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

    add(http: Http, event: Event_VM) {
        return http.post(this.ServiceBaseUrl, JSON.stringify(event))
            .toPromise()
            .then((response) => response.json());
    }


    update(http: Http, event: Event_VM) {
        return http.put(this.ServiceBaseUrl, JSON.stringify(event))
            .toPromise()
            .then((response) => response.json());
    }

    delete(http: Http, id: number) {
        let params: URLSearchParams = new URLSearchParams();
        params.set('id', id.toString());

        return http.delete(this.ServiceBaseUrl + "/api/Events/delete", { search: params })
            .toPromise()
            .then((response) => response.json());
    }
}