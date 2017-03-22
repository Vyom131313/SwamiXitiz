import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';
import { SelectModule } from 'ng2-select';

// Components
import { AttendeeFormViewComponent } from './attendee-form-view.component';
import { AttendeesListViewComponent } from './attendees-list-view.component';
import { ZonesDdlComponent } from './zones-ddl-view.component';
import { CitiesDdlComponent } from './cities-ddl-view.component';

// Services
import { AttendeesService } from './attendees.service';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule,
        SelectModule 
    ],
    declarations: [
        AttendeesListViewComponent, AttendeeFormViewComponent, ZonesDdlComponent, CitiesDdlComponent 
    ],
    exports: [
        AttendeesListViewComponent
    ],
    providers: [
        AttendeesService
    ]
})
export class AttendeesModule { }

const attendeesRoutes: Routes = [
    { path: 'attendees', component: AttendeesListViewComponent, pathMatch: 'full' },
    { path: 'attendees/new', component: AttendeeFormViewComponent },
    { path: 'attendees/:id', component: AttendeeFormViewComponent }
];

export const AttendeesRouting = RouterModule.forChild(attendeesRoutes);