import {  NgModule, ElementRef, Renderer, ViewChild, Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { MenuItem } from './Models.model';
import { SharedService } from './shared.service';

@Component({
    selector: 'navbar-left',
    templateUrl: '/app/navbar-left.template.html'
})
export class NavbarLeftComponent {
    @ViewChild('wrapper') wrapper:ElementRef;
    menus: Array<MenuItem>;
    selectedMenu: MenuItem;

    constructor(private sharedService: SharedService,
                public elementRef: ElementRef,
                public renderer: Renderer) { }

    ngOnInit(): void {
    }

    
    onSelect(menu: MenuItem, event: any): void {
        event.stopPropagation();
        this.selectedMenu = menu;

        // Collapse menubar
        this.renderer.setElementClass(this.wrapper.nativeElement, 'toggled', false);
    }
}