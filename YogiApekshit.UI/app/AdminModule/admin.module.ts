import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';

// Components
import { AdminComponent } from './admin.component';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule
    ],
    declarations: [AdminComponent],
    exports: [
        AdminComponent
    ],
    providers: []
})
export class AdminModule { }

const adminModuleRoutes: Routes = [
    //{ path: 'eventschedules', component: EventSchedulesListViewComponent, pathMatch: 'full' },
    //{ path: 'eventschedules/new', component: EventScheduleFormViewComponent },
    //{ path: 'eventschedules/:id', component: EventScheduleFormViewComponent }
];

export const AdminModuleRouting = RouterModule.forChild(adminModuleRoutes);