import { Injectable, EventEmitter } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/share';
import { Observer } from 'rxjs/Observer';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';

@Injectable()
export class SharedService {
    public Lang: BehaviorSubject<string> = new BehaviorSubject<string>("Eng");

    constructor() {
        //this.Lang = 'Eng';
    }

    SetLanguage(newValue: string) {
        this.Lang = new BehaviorSubject<string>(newValue);
    }
}