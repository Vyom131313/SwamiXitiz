import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem, QARecord, QA_VM } from './Models.model';
import { MenuItemService } from './menuItem.service';
import { SharedService } from './shared.service';

@Component({
    selector: 'QAList',
    template: ` 
                <table *ngIf="qa_vm != null && qa_vm != undefined && qa_vm.QARecords != null && qa_vm.QARecords != undefined && qa_vm.QARecords.length > 0"
                        class="table" [style.background-color]="qa_vm.Color">
                    <thead>
                        <tr>
                            <th width="30px;">
                                <a class="btn btnTableCollapse" style="padding:0px" data-toggle="collapse" attr.data-target="#tbody{{this.category}}" aria-expanded="true"></a>
                            </th>
                            <th>{{QueAnsColumnText}}</th>
                        </tr>
                    </thead>
                    <tbody id="tbody{{this.category}}" class="collapse in">
                        <tr *ngFor="let qa of qa_vm.QARecords"> 
                            <td style='white-space:nowrap;' align='center'>
                                <div style='text-align:center'>
                                    {{qa.Sr}}
                                </div>                            
                                <button type="button" style='float:left;' *ngIf="this.sharedService.IsAssessmentMode" (click)="qa.ShowAns = !qa.ShowAns" class="btn btn-info btn-xs" >{{this.sharedService.ShowAnsText}}</button>
                            </td>
                            <td>
                                <div style='font-weight:bold' [innerHTML]="qa.Que"></div>                                
                                <div [style.display]="this.sharedService.IsAssessmentMode && !qa.ShowAns ? 'none' : 'block' "  class="answer answer{{this.sharedService.Lang.value}}" [innerHTML]="qa.Ans"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
`
})
export class QAListComponent implements OnChanges {
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