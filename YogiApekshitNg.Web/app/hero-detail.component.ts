import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input, OnInit } from '@angular/core';
import { MenuItem } from './menuItem.model';
import { QA_WWW } from './qa_www.model';
import { MenuItemService } from './menuItem.service';

@Component({
  selector: 'my-hero-detail',
  template: `
    <div *ngIf="menu">
      <h2>{{menu.Name}} details!</h2>
      <div>
        <label>Book Id: </label>{{menu.bookId}}
        <label>Chapter Number: </label>{{menu.chapterNumber}}
      </div>
    </div>

    <ul class="heroes">
      <li *ngFor="let qa of qa_www_list">
        <span class="badge">#</span> {{qa.Que}}
      </li>
    </ul>
  `
})
export class HeroDetailComponent implements OnInit {
    @Input() menu: MenuItem;
    qa_www_list: Array<QA_WWW>;

    constructor(private menuItemService: MenuItemService) { }

    ngOnInit(): void {
        //alert(this.menu);
        this.menuItemService.getQAWWW(1, 2)
            .then(items => this.qa_www_list = items);

        //this.http.get("http://localhost:6007/api/Menu/get")
        //   .map(res => res.json())
        //   .subscribe(res => {
        //       this.menus = res
        //       console.log(res);
        //   });
    }
}