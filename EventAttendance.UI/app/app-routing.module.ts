import { ModuleWithProviders, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './Home/home.component';
import { HelpComponent } from './Help/help.component';

import { AboutComponent } from './about.component';
import { EventsListViewComponent } from './Events/events-list-view.component';
import { NotFoundComponent } from './NotFound/not-found.component';

 const appRoutes1: Routes = [
    { path: '', component: HomeComponent },
    { path: 'help', component: HelpComponent },
    //{ path: '', redirectTo: '/home', pathMatch: 'full'},

    { path: 'about', component: AboutComponent },
    { path: 'not-found', component: NotFoundComponent },

    //{ path: '**', redirectTo: '/home', pathMatch: 'full' }
    { path: '**', redirectTo: 'not-found' }
];

 export const AppRoutes: ModuleWithProviders = RouterModule.forRoot(appRoutes1, { useHash: true });