import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';

// Components
import { EndUserComponent } from './enduser.component';

import { NavbarLeftComponent } from './navbar-left.component';
import { DetailViewComponent } from './detail-view.component';
import { QAListComponent } from './QAList.component';

import { SharedService } from './shared.service';
import { MenuItemService } from './menuItem.service';

//import { SharedModule } from "./_Shared/shared.module";
//import { NotFoundComponent } from './NotFound/not-found.component';


@NgModule({
    imports: [
        BrowserModule,
        HttpModule,
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule
    ],
    declarations: [EndUserComponent, NavbarLeftComponent, DetailViewComponent, QAListComponent ],
    exports: [
        EndUserComponent
    ],
    providers: [SharedService, MenuItemService]
})
export class EndUserModule { }

const endUserModuleRoutes: Routes = [
    //{ path: 'eventschedules', component: EventSchedulesListViewComponent, pathMatch: 'full' },
    //{ path: 'eventschedules/new', component: EventScheduleFormViewComponent },
    //{ path: 'eventschedules/:id', component: EventScheduleFormViewComponent }
];

export const EndUserModuleRouting = RouterModule.forChild(endUserModuleRoutes);