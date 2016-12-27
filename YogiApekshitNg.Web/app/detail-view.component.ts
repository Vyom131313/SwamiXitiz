import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem, QARecord, QA_VM } from './Models.model';
import { SharedService } from './shared.service';
import { MenuItemService } from './menuItem.service';

@Component({
    selector: 'detail-view',
    template: ` 
                <h4 *ngIf="menu != null && menu != undefined && menu.Category =='All' " class='QAListTitle'>
                    {{this.sharedService.ChapterColumnText}} 
                    {{menu.Name}} 
                </h4>
                <h4 *ngIf="menu != null && menu != undefined && menu.Category !='All' " class='QAListTitle'>
                    {{menu.Name}} 
                </h4>
                <div style="margin-top:50px;" *ngIf="menu != null && menu != undefined && menu.Category !='All' ">
                    <QAList [category]='menu.Category' [qa_vm]="qa_vm"></QAList>
                </div>
                <div style="margin-top:50px;" *ngIf="menu != null && menu != undefined && menu.Category =='All'">
                    <QAList [category]="'Who_Whom_When'"    [qa_vm]="qa_vm_Who_Whom_When"></QAList>
                    <QAList [category]="'Correct_Option'"   [qa_vm]="qa_vm_Correct_Option"></QAList>
                    <QAList [category]="'Fill_In_Blank'"    [qa_vm]="qa_vm_Fill_In_Blank"></QAList> 
                    <QAList [category]="'One_Sentence'"     [qa_vm]="qa_vm_One_Sentence"></QAList> 
                    <QAList [category]="'Correct_Sentence'" [qa_vm]="qa_vm_Correct_Sentence"></QAList>
                    <QAList [category]="'Correct_Sequence'" [qa_vm]="qa_vm_Correct_Sequence"></QAList>
                    <QAList [category]="'Kirtan'"           [qa_vm]="qa_vm_Kirtan"></QAList> 
                    <QAList [category]="'Reason'"           [qa_vm]="qa_vm_Reason"></QAList> 
                    <QAList [category]="'Short_Note'"       [qa_vm]="qa_vm_Short_Note"></QAList>                   
                    <QAList [category]="'Swamini_Vaato'"    [qa_vm]="qa_vm_Swamini_Vaato"></QAList> 
                </div>

<script>
    $('.btn-toggle').click(function () {
        $(this).find('.btn').toggleClass('active');

        if ($(this).find('.btn-primary').size() > 0) {
            $(this).find('.btn').toggleClass('btn-primary');
        }
        if ($(this).find('.btn-danger').size() > 0) {
            $(this).find('.btn').toggleClass('btn-danger');
        }
        if ($(this).find('.btn-success').size() > 0) {
            $(this).find('.btn').toggleClass('btn-success');
        }
        if ($(this).find('.btn-info').size() > 0) {
            $(this).find('.btn').toggleClass('btn-info');
        }

        $(this).find('.btn').toggleClass('btn-default');

    });
</script>
            `
})
export class DetailViewComponent implements OnChanges {
    @Input() menu: MenuItem;
    qa_vm: Array<QA_VM>;
    qa_vm_Who_Whom_When: Array<QARecord>;
    qa_vm_Correct_Option: Array<QARecord>;
    qa_vm_Fill_In_Blank: Array<QARecord>;
    qa_vm_One_Sentence: Array<QARecord>;
    qa_vm_Correct_Sentence: Array<QARecord>;
    qa_vm_Correct_Sequence: Array<QARecord>;
    qa_vm_Kirtan: Array<QARecord>;
    qa_vm_Reason: Array<QARecord>;
    qa_vm_Short_Note: Array<QARecord>;
    qa_vm_Swamini_Vaato: Array<QARecord>;

    constructor(private menuItemService: MenuItemService, private sharedService: SharedService) { }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
        this.getData();
    }

    getData() {
        if (this.menu != undefined) {
            if (this.menu.Category == 'All') {
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Who_Whom_When").then(result => { this.qa_vm_Who_Whom_When = result; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Correct_Option").then(result => { this.qa_vm_Correct_Option = result; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Fill_In_Blank").then(result => { this.qa_vm_Fill_In_Blank = result; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "One_Sentence").then(result => { this.qa_vm_One_Sentence = result; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Correct_Sentence").then(result => { this.qa_vm_Correct_Sentence = result; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Correct_Sequence").then(result => { this.qa_vm_Correct_Sequence = result; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Kirtan").then(result => { this.qa_vm_Kirtan = result; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Reason").then(result => { this.qa_vm_Reason = result; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Short_Note").then(result => { this.qa_vm_Short_Note = result; });
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, "Swamini_Vaato").then(result => { this.qa_vm_Swamini_Vaato = result; });
            }
            else {
                this.menuItemService.getQA(this.menu.BookId, this.menu.ChapterNumber, this.menu.Category).then(result => { this.qa_vm = result; });
            }
        }
    }
}