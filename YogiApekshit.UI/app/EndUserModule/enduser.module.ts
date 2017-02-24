import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';

// Components
import { EndUserComponent } from './enduser.component';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule
    ],
    declarations: [EndUserComponent],
    exports: [
        EndUserComponent
    ],
    providers: []
})
export class EndUserModule { }

const endUserModuleRoutes: Routes = [
    //{ path: 'eventschedules', component: EventSchedulesListViewComponent, pathMatch: 'full' },
    //{ path: 'eventschedules/new', component: EventScheduleFormViewComponent },
    //{ path: 'eventschedules/:id', component: EventScheduleFormViewComponent }
];

export const EndUserModuleRouting = RouterModule.forChild(endUserModuleRoutes);