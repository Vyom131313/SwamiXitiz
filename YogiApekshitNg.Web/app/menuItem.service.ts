import { Injectable } from '@angular/core';
import { Headers, Http, Response  } from '@angular/http';
import 'rxjs/add/operator/toPromise';
import { Observable } from 'rxjs';
import 'rxjs/Rx';
import 'rxjs/add/operator/map'

import { MenuItem } from './menuItem.model';

@Injectable()
export class MenuItemService {
    menus: Promise<MenuItem[]>;

    constructor(private http: Http) { }

    getMenus(){

        return  this.http.get("http://localhost:6007/api/Menu/get")
            .map(res => res.json())
            .subscribe(res => {
                this.menus = res
                console.log(res);
            });

            //.map((res: Response) => res.json());
           
       
            
        //let MENUS: MenuItem[] = [
        //    { id: 11, name: 'Mr. Paresh' },
        //    { id: 12, name: 'Narco' },
        //    { id: 13, name: 'Bombasto' },
        //    { id: 14, name: 'Celeritas' },
        //    { id: 15, name: 'Magneta' },
        //    { id: 16, name: 'RubberMan' },
        //    { id: 17, name: 'Dynama' },
        //    { id: 18, name: 'Dr IQ' },
        //    { id: 19, name: 'Magma' },
        //    { id: 20, name: 'Tornado' }
        //];
        //return MENUS;
    }
}