import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { MenuItem } from './menuItem.model';
import { MenuItemService } from './menuItem.service';

@Component({
    selector: 'my-app',
    templateUrl: './app/app.component.html',
})
export class AppComponent implements OnInit {
    menus: Array<MenuItem>;
    selectedMenu: MenuItem;


    constructor(private menuItemService: MenuItemService) { }

    ngOnInit(): void {
        this.menuItemService.getMenus()
            .then(items => { this.menus = items; });

        //this.http.get("http://localhost:6007/api/Menu/get")
        //   .map(res => res.json())
        //   .subscribe(res => {
        //       this.menus = res
        //       console.log(res);
        //   });
    }

    onSelect(menu: MenuItem): void {
        this.selectedMenu = menu;
    }
}
