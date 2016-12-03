import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem } from './menuItem.model';
import { QA } from './qa.model';
import { MenuItemService } from './menuItem.service';

@Component({
    selector: 'detail-view',
    template: `<queans [qa_list]="qa_list"><queans>`
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
            this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, this.menu.Category)
                .then(items => { this.qa_list = items; });
        }
    }
}