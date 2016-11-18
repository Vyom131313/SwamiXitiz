import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem } from './menuItem.model';
import { MenuItemService } from './menuItem.service';

@Component({
    selector: 'menu-component',
    templateUrl: './app/menu.component.html'
})
export class MenuComponent  {
    menus: Array<MenuItem>;
    selectedMenu: MenuItem;

    constructor(private menuItemService: MenuItemService) { }

    ngOnInit(): void {
        this.menuItemService.getMenus()
            .then(items => { this.menus = items; });
    }

    onSelect(menu: MenuItem): void {
        this.selectedMenu = menu;
    }
   
}