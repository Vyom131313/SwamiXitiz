import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem } from './menuItem.model';
import { QARecord } from './Models.model';
import { QA_VM } from './Models.model';
import { MenuItemService } from './menuItem.service';
import { SharedService } from './shared.service';

@Component({
    selector: 'queans',
    templateUrl: './app/queans.component.html'
})
export class QueAnsComponent implements OnChanges {
    @Input() qa_vm: Array<QA_VM>;
    @Input() category: string;

    QueAnsColumnText: string;
    ChapterColumnText: string;
    ExamsColumnText: string;

    constructor(private sharedService: SharedService) {
    }

    ngOnChanges(changes: SimpleChanges) {
        this.QueAnsColumnText = this.sharedService.GetQueAnsColumnText(this.category);
        this.ChapterColumnText = this.sharedService.ChapterColumnText;
        this.ExamsColumnText = this.sharedService.ExamsColumnText;
    }
}