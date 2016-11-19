import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import 'rxjs/add/operator/toPromise';
import { Observable } from 'rxjs';
import 'rxjs/Rx';
import 'rxjs/add/operator/map'
import { SharedService } from './shared.service';
import { MenuItem } from './menuItem.model';

@Injectable()
export class MenuItemService {

    lang: string;

    constructor(private http: Http, private sharedService: SharedService)
    {
        //this.sharedService.Lang.subscribe(value => { this.lang = value;});
    }

    getMenus() {
                
        return this.http.get("http://localhost:6007/api/Menu/get")
            .toPromise()
            .then((response) => response.json());
    }

    getQAWWW(bookId: number, chapterNumber :number ) {

        let params: URLSearchParams = new URLSearchParams();
        params.set('lang', this.sharedService.Lang.getValue());
        params.set('bookId', bookId.toString());
        params.set('chapterNumber', chapterNumber.toString());
        params.set('category', "One_Sentence");

        this.sharedService.SetLanguage(this.sharedService.Lang.getValue() == "Eng" ? "Guj": "Eng");

        return this.http.get("http://localhost:6007/api/QA/getQA", {search: params })
            .toPromise()
            .then((response) => response.json());

    }
}