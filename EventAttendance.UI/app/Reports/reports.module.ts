import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';

// Components
import { ReportByEventScheduleComponent } from './report-by-event-schedule.component';
import { EventSchedulesDdlComponent } from './event-schedules-ddl-view.component';
import { ReportByAttendeeComponent } from './report-by-attendee.component';
import { AttendeesDdlComponent } from './attendees-ddl-view.component';


// Services
import { ReportsService } from './reports.service';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule
    ],
    declarations: [
        ReportByEventScheduleComponent, EventSchedulesDdlComponent, ReportByAttendeeComponent, AttendeesDdlComponent
    ],
    exports: [
        ReportByEventScheduleComponent, ReportByAttendeeComponent
    ],
    providers: [
        ReportsService
    ]
})
export class ReportsModule { }

const reportsRoutes: Routes = [
    { path: 'reportBySchedule', component: ReportByEventScheduleComponent, pathMatch: 'full' },
    { path: 'reportByAttendee', component: ReportByAttendeeComponent, pathMatch: 'full' },
];

export const ReportsRouting = RouterModule.forChild(reportsRoutes);