import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { MenuItem } from './menuItem.model';
import { QA } from './qa.model';
import { MenuItemService } from './menuItem.service';

@Component({
    selector: 'qa-view',
    templateUrl: './app/qa-view.component.html'
})
export class QAViewComponent  {
    @Input() qa_list: Array<QA>;
   
}