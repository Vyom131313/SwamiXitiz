import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import 'rxjs/add/operator/toPromise';
import { Observable } from 'rxjs';
import 'rxjs/Rx';
import 'rxjs/add/operator/map'
import { SharedService } from './shared.service';
import { MenuItem } from './Models.model';

@Injectable()
export class MenuItemService {

    constructor(private http: Http, private sharedService: SharedService)
    {
      //  this.sharedService.Lang.subscribe(value => { alert(''); this.getMenus(); });
    }

    getMenus() {
        let params: URLSearchParams = new URLSearchParams();
        params.set('lang', this.sharedService.Lang.getValue());

        return this.http.get("/api/Menu/get", { search: params })
            .toPromise()
            .then((response) => response.json());
    }

    getQA(bookId: number, chapterNumber: number, category: string) {

        let params: URLSearchParams = new URLSearchParams();
        params.set('lang', this.sharedService.Lang.getValue());
        params.set('bookId', bookId.toString());
        params.set('chapterNumber', chapterNumber.toString());
        params.set('category', category);

        //this.sharedService.SetLanguage(this.sharedService.Lang.getValue() == "Eng" ? "Guj": "Eng");

        return this.http.get("/api/QA/getQA", {search: params })
            .toPromise()
            .then((response) => response.json());
    }   
}