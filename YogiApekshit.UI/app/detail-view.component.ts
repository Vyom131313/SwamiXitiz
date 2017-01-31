import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem, QARecord, QA_VM } from './Models.model';
import { SharedService } from './shared.service';
import { MenuItemService } from './menuItem.service';
import { NavbarLeftComponent } from './navbar-left.component';

@Component({
    selector: 'detail-view',
    templateUrl: '/app/detail-view.template.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ], 
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

    constructor(private menuItemService: MenuItemService, private navbarLeft: NavbarLeftComponent, private sharedService: SharedService) { }

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

    //ChangeLanguage(lang: string, event: Event) {

    //    if (this.sharedService.Lang.value == lang)
    //        return;

    //    this.sharedService.SetLanguage(lang);
    //}
}