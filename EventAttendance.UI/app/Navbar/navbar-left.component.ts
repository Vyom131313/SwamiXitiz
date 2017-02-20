import {  NgModule, ElementRef, Renderer, ViewChild, Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
    selector: 'navbar-left',
    templateUrl: '/app/navbar/navbar-left.template.html'
})
export class NavbarLeftComponent {
    @ViewChild('wrapper') wrapper:ElementRef;
    //selectedMenu: string;

    constructor(public elementRef: ElementRef, public renderer: Renderer) { }

    ngOnInit(): void {
    }
}