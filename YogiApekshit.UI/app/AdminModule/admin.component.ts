import { NgModule } from '@angular/core';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { NavbarLeftComponent } from './navbar-left.component';

@Component({
    selector: 'admin',
    template:
    `<div #wrapper id="wrapper" class="toggled">
        <navbar-left></navbar-left>
    </div>`,
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
})
export class AdminComponent {

    constructor() { }
}

