import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem } from './menuItem.model';
import { QA_WWW } from './qa_www.model';
import { MenuItemService } from './menuItem.service';

@Component({
    selector: 'detail-view',
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
export class DetailViewComponent implements OnChanges {
    @Input() menu: MenuItem;
    qa_www_list: Array<QA_WWW>;

    constructor(private menuItemService: MenuItemService) { }
    ngOnChanges(changes: SimpleChanges) {
        console.log(changes);
        this.getData();
    }
    getData() {
        if (this.menu != undefined) {
            this.menuItemService.getQAWWW(this.menu.BookId, this.menu.ChapterNumber)
                .then(items => { this.qa_www_list = items; });
        }
    }
}