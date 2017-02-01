﻿import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import { Observable } from 'rxjs';
import 'rxjs/add/operator/toPromise';
import 'rxjs/add/operator/map';
import 'rxjs/Rx';
import { Event_VM } from '../models.model';

@Injectable()
export class EventsService {

    //public ServiceBaseUrl: string = "";
    public ServiceBaseUrl: string = "http://localhost:23283/";

    //constructor(private http: Http) {
    constructor() {
    }

    get(http: Http, filter: string) {
        let params: URLSearchParams = new URLSearchParams();
        params.set('filter', filter);

        return http.get(this.ServiceBaseUrl + "/api/Events/get", { search: params })
            .toPromise()
            .then((response) => response.json());
    }

    //getById(id: number) {

    //    let params: URLSearchParams = new URLSearchParams();
    //    params.set('id', id.toString());

    //    return this.http.get(this.ServiceBaseUrl + "/api/Events/getById", { search: params })
    //        .toPromise()
    //        .then((response) => response.json());
    //}
}