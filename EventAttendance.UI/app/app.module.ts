import { NgModule } from '@angular/core';
import { HttpModule, Http } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { AppRoutes } from './app-routing.module';

// Components
import { AppComponent } from './app.component';
import { AboutComponent } from './about.component';

// Modules
import { NavbarLeftModule } from "./Navbar/navbar-left.module";
import { EventsModule, EventsRouting } from "./Events/events.module";
import { EventSchedulesModule, EventSchedulesRouting } from "./EventSchedules/eventschedules.module";
import { AttendeesModule, AttendeesRouting } from "./Attendees/attendees.module";
import { AttendancesModule, AttendancesRouting } from "./Attendances/attendances.module";
import { ReportsModule, ReportsRouting } from "./Reports/reports.module";
import { LoginModule, LoginRouting } from "./Login/login.module";

import { SharedModule } from "./_Shared/shared.module";
import { HomeModule } from "./Home/home.module";
import { NotFoundComponent } from './NotFound/not-found.component';

import { SharedService } from './shared.service';

import { AUTH_PROVIDERS } from 'angular2-jwt';
import { AuthGuard } from './Login/authGuard.component';

@NgModule({
    imports: [BrowserModule, HttpModule,
        NavbarLeftModule, HomeModule,
        EventsModule, EventsRouting,
        EventSchedulesModule, EventSchedulesRouting,
        AttendeesModule, AttendeesRouting,
        AttendancesModule, AttendancesRouting,
        ReportsModule, ReportsRouting,
        LoginModule, LoginRouting,
        SharedModule,
        AppRoutes],
    declarations: [AppComponent, AboutComponent, NotFoundComponent],
    bootstrap: [AppComponent],
    providers: [SharedService, AuthGuard, AUTH_PROVIDERS]
})
export class AppModule {
    constructor(router: Router) {
        //console.log('Routes: ', JSON.stringify(router.config, undefined, 2));
    }
}