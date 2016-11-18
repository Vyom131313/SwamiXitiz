import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem } from './menuItem.model';
import { MenuItemService } from './menuItem.service';

@Component({
    selector: 'navbar-left',
    templateUrl: './app/navbar-left.component.html'
})
export class NavbarLeftComponent  {
    menus: Array<MenuItem>;
    selectedMenu: MenuItem;

    constructor(private menuItemService: MenuItemService) { }

    ngOnInit(): void {
        this.menuItemService.getMenus()
            .then(items => { this.menus = items; });
    }

    onSelect(menu: MenuItem, event:any): void {
        event.stopPropagation();
        this.selectedMenu = menu;
        
    }
}