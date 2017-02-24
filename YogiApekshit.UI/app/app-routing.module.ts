import { ModuleWithProviders, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminComponent } from './AdminModule/admin.component';
import { EndUserComponent } from './EndUserModule/enduser.component';

 const appRoutes1: Routes = [
     { path: '', component: EndUserComponent },
     { path: 'enduser', component: EndUserComponent },
     { path: 'admin', component: AdminComponent },

    //{ path: 'not-found', component: NotFoundComponent },

    //{ path: '**', redirectTo: '/home', pathMatch: 'full' }
    //{ path: '**', redirectTo: 'not-found' }
];

 export const AppRoutes: ModuleWithProviders = RouterModule.forRoot(appRoutes1, { useHash: true });