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

        //let requestoptions = new RequestOptions({
        //    method: "POST",
        //    url: this.ServiceBaseUrl,
        //    headers: headers,
        //    body: JSON.stringify(event)
        //})

        var data = JSON.stringify(event);
        //let data = 'Name=' + event.Name;

        //console.log(data);
        //let headers = new Headers({ 'Content-Type': 'application/json;charset=UTF-8;' });
        let headers = new Headers({ 'Content-Type': 'application/json' });
        let options = new RequestOptions({ headers: headers });

        let params: URLSearchParams = new URLSearchParams();
        params.set('Event', data);

        return http.get(this.ServiceBaseUrl + "/PostData", { search: params })
            .map(res => res.json().data);
            //.catch(this.handleError)

        //return http.post(this.ServiceBaseUrl, JSON.stringify(event))
        //    .toPromise()
        //    .then((response) => response.json());
    }


    update(http: Http, event: Event_VM) {
        return http.put(this.ServiceBaseUrl + "/" + event.Id, JSON.stringify(event))
            .map(res => res.json().data);
            //.toPromise()
            //.then((response) => response.json());
    }

    delete(http: Http, id: number) {
        let params: URLSearchParams = new URLSearchParams();
        params.set('id', id.toString());

        return http.delete(this.ServiceBaseUrl, { search: params })
            .toPromise()
            .then((response) => response.json());
    }
}