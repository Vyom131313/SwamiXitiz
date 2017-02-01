import { NgModule } from '@angular/core';
import { HttpModule, Http } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { AppRoutingModule } from './app-routing.module';

// Components
import { AppComponent } from './app.component';
import { NavbarLeftComponent } from './navbar-left.component';
import { HomeComponent } from './home.component';
import { AboutComponent } from './about.component';

// Modules
import { EventsModule, EventsRouting } from "./Events/events.module";


@NgModule({
    imports: [BrowserModule, HttpModule, AppRoutingModule, EventsModule, EventsRouting],
    declarations: [AppComponent, NavbarLeftComponent, HomeComponent, AboutComponent],
    bootstrap: [AppComponent],
    //providers: [EventsService]
})
export class AppModule {
    constructor(router: Router) {
        //console.log('Routes: ', JSON.stringify(router.config, undefined, 2));
    }
}
