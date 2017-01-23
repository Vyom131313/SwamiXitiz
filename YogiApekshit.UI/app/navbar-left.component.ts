import {  NgModule, ElementRef, Renderer, ViewChild, Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { MenuItem } from './Models.model';
import { MenuItemService } from './menuItem.service';
import { SharedService } from './shared.service';

@Component({
    selector: 'navbar-left',
    templateUrl: '/app/navbar-left.template.html'
})
export class NavbarLeftComponent {
    @ViewChild('wrapper') wrapper:ElementRef;
    menus: Array<MenuItem>;
    selectedMenu: MenuItem;

    constructor(private menuItemService: MenuItemService, 
                private sharedService: SharedService,
                public elementRef: ElementRef,
                public renderer: Renderer) { }

    ngOnInit(): void {
        this.getMenus();
    }

    getMenus() {
        this.menuItemService.getMenus().then(items => { this.menus = items; });
    }

    onSelect(menu: MenuItem, event: any): void {
        event.stopPropagation();
        this.selectedMenu = menu;

        // Collapse menubar
        this.renderer.setElementClass(this.wrapper.nativeElement, 'toggled', false);
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

    SendFeedback(event: Event) {
        alert(this.sharedService.FeedbackContent);
    }
}