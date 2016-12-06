import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem } from './menuItem.model';
import { QA } from './qa.model';
import { MenuItemService } from './menuItem.service';

@Component({
    selector: 'detail-view',
    template: `
                <div *ngIf="menu != null && menu != undefined &&  menu.Category !='All' ">
                    <queans [category]='' [qa_list]="qa_list"></queans>
                </div>
                <div *ngIf="menu != null && menu != undefined && menu.Category =='All'">
                    <queans [category]="'Correct_Option'"   [qa_list]="qa_list_Correct_Option"></queans>
                    <queans [category]="'Fill_In_Blank'"    [qa_list]="qa_list_Fill_In_Blank"></queans> 
                    <queans [category]="'One_Sentence'"     [qa_list]="qa_list_One_Sentence"></queans> 
                    <queans [category]="'Correct_Sentence'" [qa_list]="qa_list_Correct_Sentence"></queans>
                    <queans [category]="'Correct_Sequence'" [qa_list]="qa_list_Correct_Sequence"></queans>
                    <queans [category]="'Kirtan'"           [qa_list]="qa_list_Kirtan"></queans> 
                    <queans [category]="'Reason'"           [qa_list]="qa_list_Reason"></queans> 
                    <queans [category]="'Shlok'"            [qa_list]="qa_list_Shlok"></queans> 
                    <queans [category]="'Short_Note'"       [qa_list]="qa_list_Short_Note"></queans>                   
                    <queans [category]="'Swamini_Vaato'"    [qa_list]="qa_list_Swamini_Vaato"></queans> 
                </div>
            `
})
export class DetailViewComponent implements OnChanges {
    @Input() menu: MenuItem;
    qa_list: Array<QA>;
    qa_list_Correct_Option: Array<QA>;
    qa_list_Fill_In_Blank: Array<QA>;
    qa_list_One_Sentence: Array<QA>;
    qa_list_Correct_Sentence: Array<QA>;
    qa_list_Correct_Sequence: Array<QA>;
    qa_list_Kirtan: Array<QA>;
    qa_list_Reason: Array<QA>;
    qa_list_Shlok: Array<QA>;
    qa_list_Short_Note: Array<QA>;
    qa_list_Swamini_Vaato: Array<QA>;

    constructor(private menuItemService: MenuItemService) { }

    ngOnChanges(changes: SimpleChanges) {
        console.log(changes);
        this.getData();
    }

    getData() {
        if (this.menu != undefined) {
            if (this.menu.Category == 'All') {
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Correct_Option").then(items => { this.qa_list_Correct_Option = items; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Fill_In_Blank").then(items => { this.qa_list_Fill_In_Blank = items; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "One_Sentence").then(items => { this.qa_list_One_Sentence = items; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Correct_Sentence").then(items => { this.qa_list_Correct_Sentence = items; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Correct_Sequence").then(items => { this.qa_list_Correct_Sequence = items; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Kirtan").then(items => { this.qa_list_Kirtan = items; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Reason").then(items => { this.qa_list_Reason = items; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Shlok").then(items => { this.qa_list_Shlok = items; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Short_Note").then(items => { this.qa_list_Short_Note = items; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Swamini_Vaato").then(items => { this.qa_list_Swamini_Vaato = items; });
            }
            else {
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, this.menu.Category).then(items => { this.qa_list = items; });
            }
        }
    }
}