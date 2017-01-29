import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';

@Component({
    selector: 'about',
    template: 'This is About',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
})
export class AboutComponent implements OnChanges {

    constructor() { }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }
}