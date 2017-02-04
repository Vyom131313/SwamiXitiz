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
import { AttendeesModule, AttendeesRouting } from "./Attendees/attendees.module";

import { HomeModule } from "./Home/home.module";
import { NotFoundComponent } from './NotFound/not-found.component';

@NgModule({
    imports: [BrowserModule, HttpModule,
        NavbarLeftModule, HomeModule,
        EventsModule, EventsRouting,
        AttendeesModule, AttendeesRouting,
        AppRoutes],
    declarations: [AppComponent, AboutComponent, NotFoundComponent],
    bootstrap: [AppComponent],
    //providers: [EventsService]
})
export class AppModule {
    constructor(router: Router) {
        //console.log('Routes: ', JSON.stringify(router.config, undefined, 2));
    }
}