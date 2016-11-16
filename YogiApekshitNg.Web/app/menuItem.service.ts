import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import 'rxjs/add/operator/toPromise';
import { Observable } from 'rxjs';
import 'rxjs/Rx';
import 'rxjs/add/operator/map'

import { MenuItem } from './menuItem.model';

@Injectable()
export class MenuItemService {
    //menus: Promise<MenuItem[]>;

    constructor(private http: Http) { }

    getMenus() {

        return this.http.get("http://localhost:6007/api/Menu/get")
            .toPromise()
            .then((response) => response.json());
    }

    getQAWWW(bookId: number, chapterNumber :number ) {

        let params: URLSearchParams = new URLSearchParams();
        params.set('bookId', bookId.toString());
        params.set('chapterNumber', chapterNumber.toString());

        return this.http.get("http://localhost:6007/api/QA/getWWW", {search: params })
            .toPromise()
            .then((response) => response.json());
    }
}