import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem } from './Models.model';
import { MenuItemService } from './menuItem.service';
import { SharedService } from './shared.service';

@Component({
    selector: 'navbar-left',
    template: `
    <div id="wrapper" class="toggled">
        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
                <li class="active open" style="background: #ec1b5a;">
                    <a href="#" class="dropdown-toggle">
                        <button type="button" 
                                class="hamburger navbar-toggle" 
                                data-toggle="collapse" 
                                onclick="$('#wrapper').toggleClass('toggled')">
                              <span class="sr-only">Toggle navigation</span>
                              <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                        </button>

                        <div style="float:right;white-space;noWrap; ">
                            <tr>
                                <td style='font-size:13px;padding-right:5px;'>
                                    {{this.sharedService.SelectLangText}}
                                </td>
                                <td align='right'>
                                    <button type="button" class="btn btn-info btn-xs" (click)="ChangeLanguage('Eng', $event)" >E</button>
                                    <button type="button" class="btn btn-info btn-xs" (click)="ChangeLanguage('Guj', $event)" >G</button>
                                </td>
                            </tr>
                        </div>
                        <div>
                            <button class="btn btn-info btn-xs" style="margin-left:25px;font-size:13px" (click)="this.sharedService.SetTestMode(!this.sharedService.IsTestMode)">{{this.sharedService.SwitchModeText}}</button>
                        </div>                  
                    </a>
                </li>
                <li class="dropdown" attr.data-target="#Book{{bookmenu.Id}}"
                    *ngFor="let bookmenu of menus">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        {{bookmenu.Name}} <span class="caret"></span>
                    </a>

                    <ul class="dropdown-menu" role="menu" id="Book{{bookmenu.Id}}">
                        <li *ngFor="let chaptermenu of bookmenu.MenuItems"
                            [class.selected]="menu === selectedMenu"
                            (click)="onSelect(chaptermenu, $event)">
                            <a href="#" title="{{chaptermenu.Name}}" ><i class="material-icons" style="verticle-alignment:bottom;font-size:14px;padding-top:3px;padding-bottom:3px;padding-left:5px;padding-right:5px;">add</i>{{chaptermenu.Name}}</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>

        <!-- /#sidebar-wrapper -->
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid" style="padding-left:10px;">
                <div class="row">
                    <div class="col-lg-12">
                        <detail-view [menu]="selectedMenu"></detail-view>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
    </div>`

    //template: `
    //    <nav class="navbar navbar-m2p sidebar" role="navigation" id="myDropdown">
    //        <div class="container-fluid">
    //            <div class="navbar-header">
    //                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
    //                    <span class="sr-only">Toggle navigation</span>
    //                    <span class="icon-bar"></span>
    //                    <span class="icon-bar"></span>
    //                    <span class="icon-bar"></span>
    //                </button>
    //                <a class="navbar-brand" href="#" [innerHTML]="this.sharedService.TitleText">
    //                </a>
    //            </div>

    //            <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
    //                <ul class="nav navbar-nav">

    //                    <li class="active open">
    //                        <a href="#">
    //                            {{this.sharedService.SelectLangText}}
    //                            <span style="margin-top:-5px;margin-left:15px;" (click)="ChangeLanguage('Eng', $event)" class="menu-icon pull-right hidden-xs showopacity glyphicon material-icons">E</span>
    //                            <span style="margin-top:-5px;" (click)="ChangeLanguage('Guj', $event)" class="menu-icon pull-right hidden-xs showopacity glyphicon material-icons">G</span>
    //                        </a>
    //                    </li>
    //                    <li attr.data-target="#Book{{bookmenu.Id}}"
    //                        *ngFor="let bookmenu of menus">
    //                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
    //                            <span class="menu-icon pull-right hidden-xs showopacity glyphicon material-icons">burst_mode</span>
    //                            {{bookmenu.Name}} <span class="caret"></span>
    //                        </a>

    //                        <ul class="dropdown-menu forAnimate" role="menu" id="Book{{bookmenu.Id}}">
    //                            <li *ngFor="let chaptermenu of bookmenu.MenuItems"
    //                                [class.selected]="menu === selectedMenu"
    //                                (click)="onSelect(chaptermenu, $event)">
    //                                <a href="#"><i class="material-icons">add</i>{{chaptermenu.Name}}</a>
    //                            </li>
    //                        </ul>
    //                    </li>
    //                </ul>
    //            </div>
    //        </div>
    //    </nav>
    //    <div class="container-fluid">
    //        <detail-view [menu]="selectedMenu"></detail-view>
    //    </div>`
})
export class NavbarLeftComponent {
    menus: Array<MenuItem>;
    selectedMenu: MenuItem;

    constructor(private menuItemService: MenuItemService, private sharedService: SharedService) { }

    ngOnInit(): void {
        this.getMenus();
    }

    getMenus() {
        this.menuItemService.getMenus().then(items => { this.menus = items; });
    }

    onSelect(menu: MenuItem, event: any): void {
        event.stopPropagation();
        this.selectedMenu = menu;
    }

    ChangeLanguage(lang: string, event: Event) {

        if (this.sharedService.Lang.value == lang)
            return;

        this.sharedService.SetLanguage(lang);
        this.getMenus();

        if (this.selectedMenu != null && this.selectedMenu != undefined) {
            this.selectedMenu.Lang = lang;

            var mnu = this.selectedMenu;
            this.selectedMenu = null;
        }
    }
}