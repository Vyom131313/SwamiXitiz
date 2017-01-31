import { NgModule, Injectable, ElementRef, Renderer, ViewChild, Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { MenuItem } from './Models.model';
import { MenuItemService } from './menuItem.service';
import { SharedService } from './shared.service';

@Component({
    selector: 'navbar-left',
    templateUrl: '/app/navbar-left.template.html'
})

@Injectable()
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
        //console.log('onSelect');

        // Collapse menubar
        this.renderer.setElementClass(this.wrapper.nativeElement, 'toggled', false);
    }

    ChangeLanguage(lang: string, event: Event) {

        if (this.sharedService.Lang.value == lang)
            return;

        this.sharedService.SetLanguage(lang);
        this.getMenus();

        if (this.selectedMenu != null && this.selectedMenu != undefined) {

            let mnu= Object.assign({}, this.selectedMenu)
            mnu.Lang = lang;

            //console.log('ChangeLanguage');
            //console.log('this.selectedMenu.Lang : ' + this.selectedMenu.Lang);
            //console.log('mnu.Lang : ' + mnu.Lang);

            //var mnu = this.selectedMenu;
            //this.selectedMenu = null;

            this.onSelect(mnu, event);
        }
    }

    SendFeedback(event: Event) {
        alert(this.sharedService.FeedbackContent);
    }
}