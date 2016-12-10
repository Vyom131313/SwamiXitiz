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
    template: `
        <div *ngIf="qa_vm != null && qa_vm != undefined && qa_vm.QARecords != null && qa_vm.QARecords != undefined && qa_vm.QARecords.length > 0">
            <div class="table-responsive bg-greensea">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>
                                {{QueAnsColumnText}}
                            </th>
                            <th>
                                {{ChapterColumnText}}
                            </th>
                            <th>{{ExamsColumnText}}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr *ngFor="let qa of qa_vm.QARecords">
                            <td>{{qa.Sr}}</td>
                            <td>
                                <div style="padding-bottom:10px;">
                                    <b>{{qa.Que}}</b>
                                    <div class="answer"><b>Ans:</b> <div [innerHTML]="qa.Ans"></div></div>
                                </div>
                            </td>
                            <td>{{qa.Chapter}}</td>
                            <td>{{qa.Exams}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <br />   
        </div>`
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