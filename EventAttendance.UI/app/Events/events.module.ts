import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';

// Components
import { EventFormViewComponent } from './event-form-view.component';
import { EventsListViewComponent } from './events-list-view.component';

// Services
import { EventsService } from './events.service';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule
    ],
    declarations: [
        EventsListViewComponent, EventFormViewComponent
    ],
    exports: [
        EventsListViewComponent
    ],
    providers: [
        EventsService
    ]
})
export class EventsModule { }

const eventsRoutes: Routes = [
    { path: 'events', component: EventsListViewComponent, pathMatch: 'full' },
    { path: 'events/new', component: EventFormViewComponent },
    { path: 'events/:id', component: EventFormViewComponent }
];

export const EventsRouting = RouterModule.forChild(eventsRoutes);