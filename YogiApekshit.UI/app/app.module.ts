import { NgModule } from '@angular/core';
import { HttpModule, Http } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { AppRoutes } from './app-routing.module';

// Components
import { AppComponent } from './app.component';

// Modules
import { AdminModule, AdminModuleRouting } from "./AdminModule/admin.module";
import { EndUserModule, EndUserModuleRouting } from "./EndUserModule/enduser.module";

//import { SharedModule } from "./_Shared/shared.module";
//import { NotFoundComponent } from './NotFound/not-found.component';

import { SharedService } from './shared.service';

@NgModule({
    imports: [BrowserModule, HttpModule,
        AdminModule, AdminModuleRouting,
        EndUserModule, EndUserModuleRouting,
        AppRoutes],
    declarations: [AppComponent],
    bootstrap: [AppComponent],
    providers: [SharedService]
})
export class AppModule {
    constructor(router: Router) {
        //console.log('Routes: ', JSON.stringify(router.config, undefined, 2));
    }
}

/*

import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { NavbarLeftComponent } from './navbar-left.component';
import { DetailViewComponent } from './detail-view.component';
import { QAListComponent } from './QAList.component';

import { SharedService } from './shared.service';
import { MenuItemService } from './menuItem.service';

@NgModule({
  imports: [BrowserModule, HttpModule ],
  declarations: [AppComponent, NavbarLeftComponent, DetailViewComponent, QAListComponent ],
  bootstrap: [AppComponent],
  providers: [SharedService, MenuItemService]
})
export class AppModule { }


*/