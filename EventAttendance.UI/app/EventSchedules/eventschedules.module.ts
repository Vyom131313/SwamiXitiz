import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';

// Components
import { EventScheduleFormViewComponent } from './eventschedule-form-view.component';
import { EventSchedulesListViewComponent } from './eventschedules-list-view.component';

// Services
import { EventSchedulesService } from './eventschedules.service';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule
    ],
    declarations: [
        EventSchedulesListViewComponent, EventScheduleFormViewComponent
    ],
    exports: [
        EventSchedulesListViewComponent
    ],
    providers: [
        EventSchedulesService
    ]
})
export class EventSchedulesModule { }

const eventschedulesRoutes: Routes = [
    { path: 'eventschedules', component: EventSchedulesListViewComponent, pathMatch: 'full' },
    { path: 'eventschedules/new', component: EventScheduleFormViewComponent },
    { path: 'eventschedules/:id', component: EventScheduleFormViewComponent }
];

export const EventSchedulesRouting = RouterModule.forChild(eventschedulesRoutes);