import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import 'rxjs/add/operator/toPromise';
import 'rxjs/add/operator/map';
import { Observable } from 'rxjs';
import 'rxjs/Rx';
import 'rxjs/add/operator/map'
import { MenuItem } from '../Models.model';

@Injectable()
export class AdminService {

    public ServiceBaseUrl: string = "http://yogiapekshit.xitiz.net";
    
    constructor(private http: Http)
    {
      //  this.sharedService.Lang.subscribe(value => { alert(''); this.getMenus(); });

        if (/localhost/.test(document.location.host)) {
            this.ServiceBaseUrl = "http://localhost:9266";
        }
    }

    //  private extractData(res: Response) {
    //     let body = res.json();
    //     return body.data || { };
    //  }
   
}