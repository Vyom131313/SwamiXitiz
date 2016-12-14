import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem, QARecord, QA_VM } from './Models.model';
import { MenuItemService } from './menuItem.service';
import { SharedService } from './shared.service';

@Component({
    selector: 'queans',
    template: ` 
        <div class="table-responsive" *ngIf="qa_vm != null && qa_vm != undefined && qa_vm.QARecords != null && qa_vm.QARecords != undefined && qa_vm.QARecords.length > 0">
                <table class="table" [style.background-color]="qa_vm.Color">
                    <thead>
                        <tr>
                            <th width="10px">
                                <a class="btn btnTableCollapse" style="padding:0px" data-toggle="collapse" attr.data-target="#tbody{{this.category}}" aria-expanded="true"></a>
                            </th>
                            <th>{{QueAnsColumnText}}</th>
                            <th width="10px">{{ChapterColumnText}}</th>
                            <th width="10px">{{ExamsColumnText}}</th>
                        </tr>
                    </thead>
                    <tbody id="tbody{{this.category}}" class="collapse in">
                        <tr *ngFor="let qa of qa_vm.QARecords"> 
                            <td>{{qa.Sr}}</td>
                            <td>
                                <div>
                                    <b>{{qa.Que}}</b>
                                    <div *ngIf="!this.sharedService.IsTestMode" class="answer" [innerHTML]="qa.Ans"></div>
                                </div>
                            </td>
                            <td style='white-space:noWrap'>{{qa.Chapter}}</td>
                            <td style='white-space:noWrap'>{{qa.Exams}}</td>
                        </tr>
                    </tbody>
                </table>
            <br/>
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