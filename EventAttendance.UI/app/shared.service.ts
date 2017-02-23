import { Injectable, EventEmitter } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/share';
import { Observer } from 'rxjs/Observer';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';

@Injectable()
export class SharedService {

    //public WebApiBaseUrl: string = "http://localhost:23283/api";
    public WebApiBaseUrl: string = "http://attendance.xitiz.net/api";

    constructor(private http: Http) {
        if (/localhost/.test(document.location.host)) {
            this.WebApiBaseUrl = "http://localhost:23283/api";
        }
    }
}