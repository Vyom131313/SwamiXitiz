import { Injectable } from '@angular/core';
import { Http } from "@angular/http";
import { Headers } from "@angular/http";
import { Contact } from './contact.model';

@Injectable()
export class PrarambhService {

    constructor(private http: Http) { }

    getData() {

        //let data2 = this.http.get("http://localhost:6007/api/QA/");//.map(response => response.json());
        return this.http.get("http://localhost:6007/api/QA/")
                        .map(responce => <Contact[]>responce.json());

        //return new Promise((resolve, reject) => {
        //    setTimeout(() => {
        //       resolve(data2);
        //    }, 2000);
        //});
    }
}
