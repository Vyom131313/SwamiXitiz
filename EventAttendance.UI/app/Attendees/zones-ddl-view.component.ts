import { NgModule, EventEmitter } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, Output, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { Zone_VM } from '../Models.model';
import { AttendeesService } from './attendees.service';

@Component({
    selector: 'zones-ddl',
    template: `<select [(ngModel)]="selectedZonetId" (change)="onSelect($event.target.value)" class="form-control input-sm" >
                  <option *ngFor="let item of zonesDdlList" value= "{{item.Id}}" [selected]="selectedZonetId == item.Id">
                    {{item.Name}}
                  </option>
                </select>`,
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [AttendeesService]
})

export class ZonesDdlComponent implements OnChanges {
    @Input() selectedZonetId: number;
    @Output() select = new EventEmitter();
    zonesDdlList: Array<Zone_VM>;

    constructor(private http: Http, private router: Router, private attendeesService: AttendeesService) {

        this.getZoneItems();
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }

    onSelect(id) {
        this.selectedZonetId = id;
        this.select.emit(id);
    }

    getZoneItems() {
        this.attendeesService.getZoneItems(this.http).then(items => { this.zonesDdlList = items; });
    }
}