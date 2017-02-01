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
import { EventFormViewComponent } from './event-form-view.component';
import { EventsListViewComponent } from './events-list-view.component';

// Services
import { EventsService } from './Events.service';

@NgModule({
    imports: [BrowserModule, HttpModule, AppRoutingModule],
    declarations: [AppComponent, NavbarLeftComponent, HomeComponent, AboutComponent,
                    EventsListViewComponent, EventFormViewComponent],
    bootstrap: [AppComponent],
    providers: [EventsService]
})
export class AppModule {
    constructor(router: Router) {
        //console.log('Routes: ', JSON.stringify(router.config, undefined, 2));
    }
}
