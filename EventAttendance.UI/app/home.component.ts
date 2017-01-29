import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Event_VM } from './Models.model';
import { EventsService } from './events.service';

@Component({
    selector: 'home',
    template: 'This is Home',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
})
export class HomeComponent implements OnChanges {

    constructor() { }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }
}