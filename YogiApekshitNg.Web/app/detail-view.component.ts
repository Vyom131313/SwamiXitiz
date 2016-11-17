import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem } from './menuItem.model';
import { QA } from './qa.model';
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

<qa-view [qa_list]="qa_list"><qa-view>
  `
})
export class DetailViewComponent implements OnChanges {
    @Input() menu: MenuItem;
    qa_list: Array<QA>;

    constructor(private menuItemService: MenuItemService) { }
    ngOnChanges(changes: SimpleChanges) {
        console.log(changes);
        this.getData();
    }
    getData() {
        if (this.menu != undefined) {
            this.menuItemService.getQAWWW(this.menu.BookId, this.menu.ChapterNumber)
                .then(items => { this.qa_list = items; });
        }
    }
}