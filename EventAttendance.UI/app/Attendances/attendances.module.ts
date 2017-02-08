import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';

// Components
import { AttendancesListViewComponent } from './attendances-list-view.component';
//import { ZonesDdlComponent } from './zones-ddl-view.component';

// Services
import { AttendancesService } from './attendances.service';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule
    ],
    declarations: [
        AttendancesListViewComponent, //ZonesDdlComponent
    ],
    exports: [
        AttendancesListViewComponent
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