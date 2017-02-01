import { ModuleWithProviders, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './Home/home.component';
import { AboutComponent } from './about.component';
import { EventsListViewComponent } from './Events/events-list-view.component';
import { EventsService } from './Events/Events.service';

 const appRoutes1: Routes = [
    {
        path: '',
        component: HomeComponent
    },
    //{
    //    path: 'home',
    //    component: HomeComponent
    //},
    {
        path: 'about',
        component: AboutComponent
    },
    //{
    //    path: '',
    //    redirectTo: '/home',
    //    pathMatch: 'full'
    //},
    {
        path: '**',
        redirectTo: '/home',
        pathMatch: 'full'
    }
];

 export const AppRoutes: ModuleWithProviders = RouterModule.forRoot(appRoutes1);