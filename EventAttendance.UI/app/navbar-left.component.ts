import {  NgModule, ElementRef, Renderer, ViewChild, Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
    selector: 'navbar-left',
    templateUrl: '/app/navbar-left.template.html'
})
export class NavbarLeftComponent {
    @ViewChild('wrapper') wrapper:ElementRef;
    selectedMenu: string;

    constructor(public elementRef: ElementRef, public renderer: Renderer) { }

    ngOnInit(): void {
    }
    
    onSelect(menu: string, event: any): void {
        event.stopPropagation();
        this.selectedMenu = menu;

        // Collapse menubar
        this.renderer.setElementClass(this.wrapper.nativeElement, 'toggled', false);
    }
}