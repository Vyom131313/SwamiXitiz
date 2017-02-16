import { NgModule, EventEmitter } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, Output, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { City_VM } from '../Models.model';
import { AttendeesService } from './attendees.service';

@Component({
    selector: 'cities-ddl',
    template: `<select [(ngModel)]="selectedCityId" (change)="onSelect($event.target.value)" class="form-control input-sm">
                  <option *ngFor="let item of citiesDdlList" value= "{{item.Id}}" [selected]="selectedCityId == item.Id">
                    {{item.Name}}
                  </option>
                </select>`,
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [AttendeesService]
})

export class CitiesDdlComponent implements OnChanges {
    @Input() selectedCityId: number;
    @Output() select = new EventEmitter();
    citiesDdlList: Array<City_VM>;

    constructor(private http: Http, private router: Router, private attendeesService: AttendeesService) {

        this.getCityItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    onSelect(id) {
        this.selectedCityId = id;
        this.select.emit(id);
    }

    getCityItems() {
        this.attendeesService.getCityItems(this.http).then(items => { this.citiesDdlList = items; });
    }
}