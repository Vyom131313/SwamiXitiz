import { NgModule } from '@angular/core';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { SharedService } from './shared.service';
import { MenuItemService } from './menuItem.service';
import { NavbarLeftComponent } from './navbar-left.component';

@Component({
    selector: 'end-user',
    template: 
    `<div #wrapper id="wrapper" class="toggled">
        <navbar-left></navbar-left>
        
    </div>`,
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
})
export class EndUserComponent {

    constructor() { }
}

