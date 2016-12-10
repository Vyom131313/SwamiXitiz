import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem } from './Models.model';
import { MenuItemService } from './menuItem.service';
import { SharedService } from './shared.service';


@Component({
    selector: 'navbar-left',
    template: `
        <nav class="navbar navbar-m2p sidebar" role="navigation" id="myDropdown">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#" [innerHTML]="this.sharedService.TitleText">
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                        <li class="active open">
                            <a href="#">
                                {{this.sharedService.SelectLangText}}
                                <span style="margin-top:-5px;margin-left:15px;" (click)="ChangeLanguage('Eng', $event)" class="menu-icon pull-right hidden-xs showopacity glyphicon material-icons">E</span>
                                <span style="margin-top:-5px;" (click)="ChangeLanguage('Guj', $event)" class="menu-icon pull-right hidden-xs showopacity glyphicon material-icons">G</span>
                            </a>
                        </li>
                        <li attr.data-target="#Book{{bookmenu.Id}}"
                            *ngFor="let bookmenu of menus">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="menu-icon pull-right hidden-xs showopacity glyphicon material-icons">burst_mode</span>
                                {{bookmenu.Name}} <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu forAnimate" role="menu" id="Book{{bookmenu.Id}}">
                                <li *ngFor="let chaptermenu of bookmenu.MenuItems"
                                    [class.selected]="menu === selectedMenu"
                                    (click)="onSelect(chaptermenu, $event)">
                                    <a href="#"><i class="material-icons">add</i>{{chaptermenu.Name}}</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <detail-view [menu]="selectedMenu"></detail-view>
        </div>`
})
export class NavbarLeftComponent  {
    menus: Array<MenuItem>;
    selectedMenu: MenuItem;
    lastEvent: any;

    constructor(private menuItemService: MenuItemService, private sharedService: SharedService) { }

    ngOnInit(): void {
        this.getMenus();
    }

    getMenus() {
        this.menuItemService.getMenus().then(items => { this.menus = items; });
    }

    onSelect(menu: MenuItem, event:any): void {
        event.stopPropagation();
        this.lastEvent = event;
        this.selectedMenu = menu;
    }

    ChangeLanguage(lang: string, event: Event) {

        this.sharedService.SetLanguage(lang);
        this.getMenus();

        if (this.selectedMenu != null && this.selectedMenu != undefined)
        {
            this.selectedMenu.Lang = lang;
            //this.onSelect(this.selectedMenu, this.lastEvent);
        }
    }
}