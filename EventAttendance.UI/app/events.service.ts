import { Injectable } from '@angular/core';
import { HttpModule, Http } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import 'rxjs/add/operator/toPromise';
import 'rxjs/add/operator/map';
import { Observable } from 'rxjs';
import 'rxjs/Rx';
import 'rxjs/add/operator/map'
import { Event_VM } from './Models.model';

@Injectable()
export class EventsService {

    public ServiceBaseUrl: string = "";
    //public ServiceBaseUrl: string = "http://localhost:9266";
    //public ServiceBaseUrl: string = "http://yogiapekshit.xitiz.net";
    
    constructor(private http: Http)
    {
    }

    getAll() {
        return this.http.get(this.ServiceBaseUrl+"/api/Events/getAll")
            .toPromise()
            .then((response) => response.json());
    }

    //getById(id: number) {

    //    let params: URLSearchParams = new URLSearchParams();
    //    params.set('id', id.toString());

    //    return this.http.get(this.ServiceBaseUrl+"/api/Events/getById", {search: params })
    //        .toPromise()
    //        .then((response) => response.json());
    //}
}