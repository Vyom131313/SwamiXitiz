import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';

import { SharedModule } from "../_Shared/shared.module";

// Components
import { AttendancesListViewComponent } from './attendances-list-view.component';
import { EventSchedulesDdlComponent } from './event-schedules-ddl-view.component';

//import { LoadingIndicator } from '../_Shared/loading-indicator.component';

// Services
import { AttendancesService } from './attendances.service';

// Directives
import { FocusDirective } from './attendances-list-view.component';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule,
        SharedModule
    ],
    declarations: [
        AttendancesListViewComponent, EventSchedulesDdlComponent, FocusDirective
    ],
    exports: [
        AttendancesListViewComponent, 
    ],
    providers: [
        AttendancesService
    ]
})
export class AttendancesModule { }

const attendancesRoutes: Routes = [
    { path: 'attendances', component: AttendancesListViewComponent, pathMatch: 'full' },
];

export const AttendancesRouting = RouterModule.forChild(attendancesRoutes);