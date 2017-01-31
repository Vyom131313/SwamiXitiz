import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import 'rxjs/add/operator/toPromise';
import 'rxjs/add/operator/map';
import { Observable } from 'rxjs';
import 'rxjs/Rx';
import 'rxjs/add/operator/map'
import { SharedService } from './shared.service';
import { MenuItem } from './Models.model';

@Injectable()
export class MenuItemService {

    public ServiceBaseUrl: string = "";
    //public ServiceBaseUrl: string = "http://localhost:9266";
    //public ServiceBaseUrl: string = "http://yogiapekshit.xitiz.net";
    
    constructor(private http: Http, private sharedService: SharedService)
    {
      //  this.sharedService.Lang.subscribe(value => { alert(''); this.getMenus(); });
    }

    // getMenus(): Observable<MenuItem[]> {
    //     let params: URLSearchParams = new URLSearchParams();
    //     params.set('lang', this.sharedService.Lang.getValue());

    //     return this.http.get(this.ServiceBaseUrl+"/api/Menu/get", { search: params })
    //     .map(this.extractData);
    //         // .toPromise()
    //         // .then((response) => response.json());
    // }

    //  private extractData(res: Response) {
    //     let body = res.json();
    //     return body.data || { };
    //  }


    getMenus() {

        //console.log('getMenus');

        let params: URLSearchParams = new URLSearchParams();
        params.set('lang', this.sharedService.Lang.getValue());

        return this.http.get(this.ServiceBaseUrl+"/api/Menu/get", { search: params })
            .toPromise()
            .then((response) => response.json());
    }

    getQA(bookId: number, chapterNumber: number, category: string) {

        //console.log('getQA');

        let params: URLSearchParams = new URLSearchParams();
        params.set('lang', this.sharedService.Lang.getValue());
        params.set('bookId', bookId.toString());
        params.set('chapterNumber', chapterNumber.toString());
        params.set('category', category);

        //this.sharedService.SetLanguage(this.sharedService.Lang.getValue() == "Eng" ? "Guj": "Eng");

        return this.http.get(this.ServiceBaseUrl+"/api/QA/getQA", {search: params })
            .toPromise()
            .then((response) => response.json());
    }   
}